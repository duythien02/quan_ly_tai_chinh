import 'package:flutter/material.dart';

import '../../core/bloc/ez_bloc.dart';
import '../../core/params/params.dart';
import '../../injector/injector.dart';
import 'bloc/create_transaction_bloc.dart';
import 'create_transaction_body.dart';

class CreateTransactionPage extends StatelessWidget {
  const CreateTransactionPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm giao dịch'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (final context) => getIt<CreateTransactionBloc>()
              ..add(
                GetCategories(
                  GetCategoriesRequestParams(),
                ),
              )
              ..add(
                GetAccounts(
                  GetAccountsRequestParams(),
                ),
              ),
          ),
        ],
        child: const CreateTransactionBody(),
      ),
    );
  }
}
