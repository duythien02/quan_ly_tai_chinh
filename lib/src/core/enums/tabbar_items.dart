// Flutter imports:
import 'package:flutter/material.dart' hide TabBarView;

import '../../presentation/home_page/home_page.dart';
import '../../presentation/profile/profile_page.dart';
import '../../presentation/transaction/create_transaction_page.dart';

// Project imports:

// Package imports:

enum TabBarItems {
  home,
  createTransaction,
  profile,
}

Map<TabBarItems, Widget> getTabBarWidgetsMap() {
  return {
    TabBarItems.home: const HomePage(),
    TabBarItems.createTransaction: const CreateTransactionPage(),
    TabBarItems.profile: const ProfilePage(),
  };
}
