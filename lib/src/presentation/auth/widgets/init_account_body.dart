import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/params/params.dart';
import '../../../core/routes/app_router.dart';
import '../../../domain/entities/entities.dart';
import '../../../injector/injector.dart';
import '../../account/bloc/account_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/init_account_bloc.dart';

class InitAccountBody extends StatefulWidget {
  const InitAccountBody({super.key});

  @override
  State<InitAccountBody> createState() => _InitAccountBodyState();
}

class _InitAccountBodyState extends State<InitAccountBody> {
  final _nameController = TextEditingController();
  final _balanceController = TextEditingController();
  List<CurrencyDocs> _listCurrencies = [];
  CurrencyDocs? _selectedCurrency;

  @override
  void dispose() {
    _nameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    return BlocConsumer<AccountBloc, AccountState>(
      listener: (final context, final state) async {
        if (state is GetCurrenciesSuccess) {
          _listCurrencies = state.currency.items;
          if (_listCurrencies.isNotEmpty && _selectedCurrency == null) {
            _selectedCurrency = _listCurrencies.first;
          }
        }
        if (state is CreateAccountSuccess) {
          getIt<AppRouter>().replaceAll([const TabBarRoute()]);
        }
      },
      builder: (final context, final state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                context.l10n.createTheFirstAccount,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              DropdownButtonFormField<CurrencyDocs>(
                value: _selectedCurrency,
                decoration: InputDecoration(
                  labelText: context.l10n.currencyType,
                  border: const OutlineInputBorder(),
                ),
                items: _listCurrencies.map((final CurrencyDocs currency) {
                  return DropdownMenuItem<CurrencyDocs>(
                    value: currency,
                    child: Text(currency.name ?? ''),
                  );
                }).toList(),
                onChanged: (final CurrencyDocs? newValue) {
                  setState(() {
                    _selectedCurrency = newValue;
                  });
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: context.l10n.accountName,
                  border: const OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
                onChanged: (final value) {
                  setState(() {});
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _balanceController,
                decoration: const InputDecoration(
                  labelText: 'S  ố dư ban đầu',
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _nameController.text.isNotEmpty
                    ? () {
                        context.read<AccountBloc>().add(
                              CreateAccount(
                                CreateAccountRequestParams(
                                  accountName: _nameController.text,
                                  initialBalance: double.tryParse(
                                        _balanceController.text,
                                      ) ??
                                      0,
                                  currencyCode: _selectedCurrency?.code ?? '',
                                ),
                              ),
                            );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(context.l10n.createAccount),
              ),
            ],
          ),
        );
      },
    );
  }
}
