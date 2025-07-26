import 'package:flutter/material.dart';

import 'create_transaction_body.dart';

class CreateTransactionPage extends StatelessWidget {
  const CreateTransactionPage({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tạo giao dịch'),
      ),
      body: const CreateTransactionBody(),
    );
  }
}
