import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bloc/ez_bloc.dart';
import '../../../core/params/params.dart';
import '../../../core/progresshud/loading_widget.dart';
import '../../../domain/entities/entities.dart';
import '../../profile/bloc/profile_bloc.dart';
import '../bloc/home_bloc.dart';
import 'account_summary_card.dart';
import 'transaction_chart_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  UserProfile? userProfile;
  List<AccountDocs>? accounts;
  AccountDocs? activeAccount;
  TransactionSummary? transactionSummary;
  late String _selectedRangeKey;
  final DateTime _dateTime = DateTime.now();
  late DateTime _startDate;
  late DateTime _endDate;

  // Dùng map để dễ quản lý key và value
  final Map<String, String> _dateRanges = {
    '7_days': '7 ngày',
    '1_month': '1 tháng',
    '3_months': '3 tháng',
  };

  @override
  void initState() {
    super.initState();
    _selectedRangeKey = _dateRanges.keys.first;
  }

  void _getTransactionSummary() {
    transactionSummary?.items.clear();
    context.read<HomeBloc>().add(
          GetTransactionSummaryEvent(
            GetTransactionSummaryRequestParams(
              startDate: DateFormat('yyyy-MM-dd').format(_startDate),
              endDate: DateFormat('yyyy-MM-dd').format(_endDate),
              accountId: activeAccount?.id,
            ),
          ),
        );
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (final context, final homeState) {
        if (homeState is GetAccountsSuccess) {
          accounts = homeState.accounts;
          activeAccount = accounts?.firstWhere((final e) => e.isMain == true);
          _startDate = _dateTime.subtract(const Duration(days: 6));
          _endDate = _dateTime;
          context.read<HomeBloc>().add(
                GetTransactionSummaryEvent(
                  GetTransactionSummaryRequestParams(
                    startDate: DateFormat('yyyy-MM-dd').format(_startDate),
                    endDate: DateFormat('yyyy-MM-dd').format(_endDate),
                    accountId: activeAccount?.id,
                  ),
                ),
              );
        }
        if (homeState is GetTransactionSummarySuccess) {
          transactionSummary = homeState.transactionSummary;
        }
      },
      builder: (final context, final homeState) {
        return BlocConsumer<ProfileBloc, ProfileState>(
          listener: (final context, final state) {
            if (state is GetUserProfileSuccess) {
              userProfile = state.userProfile;
            }
          },
          builder: (final context, final state) {
            return Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHomeHeader(
                            context,
                            userName: userProfile?.username ?? '',
                          ),
                          const SizedBox(height: 24),
                          AccountSummaryCard(
                            account: activeAccount,
                          ),
                          const SizedBox(height: 32),
                          // Header: Tiêu đề và Dropdown
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Biến động số dư',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: _selectedRangeKey,
                                    items: _dateRanges.keys
                                        .map((final String key) {
                                      return DropdownMenuItem<String>(
                                        value: key,
                                        child: Text(_dateRanges[key] ?? ''),
                                      );
                                    }).toList(),
                                    onChanged: (final String? newKey) {
                                      if (newKey != null) {
                                        _selectedRangeKey = newKey;
                                        if (newKey == '7_days') {
                                          _startDate = _dateTime.subtract(
                                            const Duration(days: 6),
                                          );
                                        } else if (newKey == '1_month') {
                                          _startDate = _dateTime.subtract(
                                            const Duration(days: 29),
                                          );
                                        } else if (newKey == '3_months') {
                                          _startDate = _dateTime.subtract(
                                            const Duration(days: 89),
                                          );
                                        }
                                        _getTransactionSummary();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          TransactionChartSection(
                            rangeKey: _selectedRangeKey,
                            listTransactionSummaryDocs:
                                transactionSummary?.items ?? [],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (homeState is HomeLoading)
                  const Center(
                    child: LoadingWidget(),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildHomeHeader(
    final BuildContext context, {
    required final String userName,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            Text(
              userName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        // Icon thông báo hoặc avatar
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_outlined),
          iconSize: 28,
        ),
      ],
    );
  }
}
