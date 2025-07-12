import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'chip.dart';

class EzFilterChipList extends StatefulWidget {
  const EzFilterChipList({
    super.key,
    required this.items,
    required this.onTap,
    this.defaultIds,
  });

  final List<ChipModel> items;
  final void Function(List<ChipModel>) onTap;
  final List<String?>? defaultIds;

  @override
  State<EzFilterChipList> createState() => _EzFilterChipListState();
}

class _EzFilterChipListState extends State<EzFilterChipList> {
  final selectedList = <ChipModel>[];

  @override
  void initState() {
    super.initState();
    if (widget.defaultIds != null) {
      for (var i = 0; i < widget.defaultIds!.length; i++) {
        final defaultItem = widget.items
            .firstWhereOrNull((final e) => e.id == widget.defaultIds?[i]);
        if (defaultItem != null) {
          selectedList.add(defaultItem);
        }
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    return Wrap(
      children: List.generate(widget.items.length, (final index) {
        final item = widget.items[index];
        final currentIndex =
            selectedList.indexWhere((final e) => e.id == item.id);
        final isSelected = currentIndex != -1;

        return FilterChip(
          label: const Text('Official Store'),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          selected: isSelected,
          onSelected: (final selected) {
            if (isSelected) {
              selectedList.removeAt(currentIndex);
            } else {
              selectedList.add(item);
            }
            widget.onTap.call(selectedList);
          },
          elevation: 0,
          pressElevation: 0,
          backgroundColor: Theme.of(context).unselectedWidgetColor,
          selectedColor: Theme.of(context).primaryColor,
          checkmarkColor: Theme.of(context).colorScheme.onPrimary,
        );
      }),
    );
  }
}
