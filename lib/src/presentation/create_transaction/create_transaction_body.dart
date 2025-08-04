// lib/src/presentation/add_transaction/widgets/add_transaction_body.dart

import 'package:collection/collection.dart';
import 'package:ez_intl/ez_intl.dart';
import 'package:ez_resources/ez_resources.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../core/bloc/ez_bloc.dart';
import '../../core/params/params.dart';
import '../../core/utils/curency_input_formatter.dart';

import '../../core/utils/string_helper.dart';
import '../../core/utils/url_helper.dart';
import '../../domain/entities/entities.dart';
import 'bloc/create_transaction_bloc.dart';

// Enum để quản lý loại giao dịch
enum TransactionType { expense, income }

class CreateTransactionBody extends StatefulWidget {
  const CreateTransactionBody({super.key});

  @override
  State<CreateTransactionBody> createState() => _CreateTransactionBodyState();
}

class _CreateTransactionBodyState extends State<CreateTransactionBody> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  // State để quản lý việc chọn Thu nhập/Chi tiêu
  TransactionType _selectedType = TransactionType.expense;
  CategoryDocs? _selectedCategory;
  List<CategoryDocs?> _categories = [];
  List<AccountDocs?> _accounts = [];
  AccountDocs? _selectedAccount;

  @override
  void initState() {
    super.initState();
    _dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
  }

  @override
  void dispose() {
    _amountController.dispose();
    _categoryController.dispose();
    _accountController.dispose();
    _dateController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  void _saveTransaction() {
    final double amount = _amountController.text.toDouble();
    context.read<CreateTransactionBloc>().add(
          CreateTransaction(
            CreateTransactionRequestParams(
              amount: amount,
              categoryId: _selectedCategory?.id ?? '',
              accountId: _selectedAccount?.id ?? '',
              date: _dateController.text,
              type: _selectedType == TransactionType.expense
                  ? 'expense'
                  : 'income',
              description: _noteController.text,
            ),
          ),
        );
  }

  @override
  Widget build(final BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final isExpense = _selectedType == TransactionType.expense;
    final transactionColor =
        isExpense ? Colors.red.shade400 : Colors.green.shade500;

    return BlocConsumer<CreateTransactionBloc, CreateTransactionState>(
      listener: (final context, final state) {
        if (state is GetCategoriesSuccess) {
          _categories = state.categories.items;
        }
        if (state is GetAccountsSuccess) {
          _accounts = state.accounts;
          _selectedAccount = _accounts.firstWhereOrNull(
            (final account) => account?.isMain == true,
          );
          _accountController.text = _selectedAccount?.accountName ?? '';
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Thanh chọn Thu nhập / Chi tiêu
                      Center(
                        child:
                            CupertinoSlidingSegmentedControl<TransactionType>(
                          groupValue: _selectedType,
                          thumbColor: isExpense
                              ? Colors.red.shade100
                              : Colors.green.shade100,
                          children: {
                            TransactionType.expense: _buildSegment('Chi tiêu'),
                            TransactionType.income: _buildSegment('Thu nhập'),
                          },
                          onValueChanged: (final value) {
                            if (value != null) {
                              setState(() {
                                _selectedType = value;
                              });
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: transactionColor.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Số tiền',
                              style: TextStyle(
                                color: transactionColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextFormField(
                              controller: _amountController,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                CurrencyInputFormatter(),
                              ],
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: transactionColor,
                              ),
                              decoration: InputDecoration(
                                hintText: '0',
                                hintStyle: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade400,
                                ),
                                border: InputBorder.none,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: transactionColor,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      // Lưới Danh mục
                      _buildCategoryGrid(),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            _buildDetailRow(
                              icon: Icons.account_balance_wallet_outlined,
                              label: 'Tài khoản',
                              value: _accountController.text,
                              onTap: () {
                                // TODO: Mở màn hình chọn tài khoản
                              },
                            ),
                            _buildDetailRow(
                              icon: Icons.calendar_today_outlined,
                              label: 'Ngày',
                              value: _dateController.text,
                              onTap: _selectDate,
                            ),
                            _buildNoteField(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      // Nút Lưu
                      ElevatedButton(
                        onPressed: _saveTransaction,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                        child: const Text(
                          'Thêm',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // Widget con cho thanh chọn
  Widget _buildSegment(final String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(text, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _buildCategoryGrid() {
    final filteredCategories = _categories
        .where((final category) => category?.type == _selectedType.name)
        .toList();

    if (filteredCategories.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Chọn danh mục',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade700,
                ),
          ),
          const SizedBox(height: 16),
          const ShimmerLoading13(),
        ],
      );
    }

    // Lấy tối đa 7 mục đầu tiên để hiển thị
    final displayedCategories = filteredCategories.take(7).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Chọn danh mục',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.9,
          ),
          itemCount: displayedCategories.length + 1,
          itemBuilder: (final context, final index) {
            // Nút Xem tất cả
            if (index == displayedCategories.length) {
              return _buildCategoryItem(
                name: context.l10n.viewMore,
                iconData: Icons.arrow_forward_ios,
                isSelected: false,
                onTap: () {
                  // TODO: Điều hướng đến trang danh sách danh mục
                },
              );
            }

            // Các item danh mục
            final category = displayedCategories[index];
            return _buildCategoryItem(
              name: category?.name ?? '',
              iconUrl: UrlHelper.resolve(category?.iconUrl ?? ''),
              isSelected: _selectedCategory?.id == category?.id,
              onTap: () {
                setState(() {
                  _selectedCategory = category;
                });
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryItem({
    required final String name,
    final String? iconUrl,
    final IconData? iconData,
    required final bool isSelected,
    required final VoidCallback onTap,
  }) {
    final color =
        isSelected ? Theme.of(context).primaryColor : Colors.grey.shade700;

    // Đảm bảo chỉ có 1 trong 2 loại icon được cung cấp
    assert(
      iconUrl != null || iconData != null,
      'Either iconUrl or iconData must be provided',
    );

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: isSelected
                ? Theme.of(context).primaryColor.withValues(alpha: 0.5)
                : Colors.grey.shade200,
            child: (iconUrl != null && iconUrl.isNotEmpty)
                ? EZResources.image(
                    ImageParams(
                      fit: BoxFit.contain,
                      name: iconUrl,
                      size: const ImageSize.square(24),
                      color: color,
                    ),
                  )
                : Icon(iconData, color: color),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow({
    required final IconData icon,
    required final String label,
    required final String value,
    required final VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey.shade600),
            const SizedBox(width: 16),
            Text(label, style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextFormField(
        controller: _noteController,
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.note_alt_outlined, color: Colors.grey.shade600),
          hintText: 'Ghi chú',
          border: InputBorder.none, // Bỏ border
        ),
      ),
    );
  }
}
