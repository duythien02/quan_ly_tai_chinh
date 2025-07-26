// Dart imports:

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';
import 'package:ez_resources/ez_resources.dart';

// Project imports:
import '../../../core/bloc/ez_bloc.dart';
import '../../../core/utils/tabbar_helpers.dart';
import '../bloc/tabbar_bloc.dart';

class AppCupertinoTabbar extends StatelessWidget {
  const AppCupertinoTabbar({
    final Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: CupertinoTabBar(
        key: tabBarGlobalKey,
        activeColor: Colors.orange,
        inactiveColor: Colors.grey,
        backgroundColor: Colors.transparent,
        currentIndex: index,
        items: _createListBottomNavigationBarItem(context, index),
        onTap: (final index) {
          context.read<TabbarBloc>().add(
                TabBarChangedIndex(
                  index: index,
                ),
              );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _createListBottomNavigationBarItem(
    final BuildContext context,
    final int currentIndex,
  ) {
    return [
      _buildBottomNavigationBarItem(
        context,
        icon: AppIcons.icHome,
        activeIcon: AppIcons.icHome,
        title: context.l10n.home,
        isSelected: currentIndex == 0,
      ),
      BottomNavigationBarItem(
        icon: Container(
          margin: const EdgeInsets.only(top: 2),
          decoration: const BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          width: 48,
          height: 48,
          child: Center(
            child: EZResources.image(
              ImageParams(
                name: AppIcons.icAdd,
                color: Colors.white,
                size: const ImageSize.square(20),
              ),
            ),
          ),
        ),
        label: '',
      ),
      _buildBottomNavigationBarItem(
        context,
        icon: AppIcons.icProfile,
        activeIcon: AppIcons.icProfile,
        title: context.l10n.profile,
        isSelected: currentIndex == 2,
      ),
    ];
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    final BuildContext context, {
    required final String icon,
    required final String activeIcon,
    required final String title,
    required final bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 2,
            width: 24,
            margin: const EdgeInsets.only(bottom: 4),
            color: isSelected ? Colors.orange : Colors.transparent,
          ),
          EZResources.image(
            ImageParams(
              name: icon,
              color: isSelected ? Colors.orange : Colors.grey,
              size: const ImageSize.square(22),
            ),
          ),
        ],
      ),
      activeIcon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 2,
            width: 24,
            margin: const EdgeInsets.only(bottom: 4),
            color: Colors.orange,
          ),
          EZResources.image(
            ImageParams(
              name: activeIcon,
              color: Colors.orange,
              size: const ImageSize.square(24),
            ),
          ),
        ],
      ),
      label: title,
    );
  }
}
