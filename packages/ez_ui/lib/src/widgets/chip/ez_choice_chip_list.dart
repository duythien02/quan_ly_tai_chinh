import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chip.dart';

class EzChoiceChipList extends StatefulWidget {
  const EzChoiceChipList({
    super.key,
    required this.items,
    required this.onTap,
    this.defaultId,
  });

  final List<ChipModel> items;
  final void Function(ChipModel) onTap;
  final String? defaultId;

  @override
  State<EzChoiceChipList> createState() => _EzChoiceChipListState();
}

class _EzChoiceChipListState extends State<EzChoiceChipList> {
  String? selectedChipId;

  @override
  void initState() {
    super.initState();
    selectedChipId = widget.defaultId;
  }

  @override
  Widget build(final BuildContext context) {
    return Wrap(
      spacing: 8.r,
      children: List.generate(widget.items.length, (final index) {
        return ChoiceChip(
          label: Text(
            widget.items[index].name ?? '',
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          elevation: 0,
          pressElevation: 0,
          selectedColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).unselectedWidgetColor,
          selected: selectedChipId == widget.items[index].id,
          onSelected: (final selected) {
            setState(() {
              selectedChipId = widget.items[index].id;
            });
            widget.onTap.call(widget.items[index]);
          },
        );
      }),
    );
  }
}
