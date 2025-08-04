// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import '../app_strings.dart';

GlobalKey? tabBarGlobalKey = GlobalKey(debugLabel: AppStrings.tabBarGlobalKey);

void tabBarOnIndexChange(final int index) {
  // getIt<AppRouter>().popUntilRouteWithName(TabBarRoute.name);
  final onTap = (tabBarGlobalKey?.currentWidget as CupertinoTabBar?)?.onTap;
  if (onTap != null) {
    onTap(index);
  }
}
