// Flutter imports:
import 'package:flutter/material.dart' hide TabBarView;

// Project imports:

// Package imports:

enum TabBarItems {
  home,
  account,
}

Map<TabBarItems, Widget> getTabBarWidgetsMap() {
  return {
    // TabBarItems.logHours: const DashboardManagerPage(),
    // TabBarItems.monthlyAttendance: const MonthlyAttendancePage(),
    // TabBarItems.request: const DayOffRequestPage(),
    // if (TabBarView.isManager) TabBarItems.worksite: const DashboardPage(),
    // TabBarItems.account: const AccountPage(),
  };
}
