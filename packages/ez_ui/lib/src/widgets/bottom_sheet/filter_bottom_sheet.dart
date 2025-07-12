import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../ez_ui.dart';

Future<void> showFilterBottomSheet(
  final BuildContext context, {
  required final FilterBottomSheetParams params,
}) {
  return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
    ),
    builder: (final context) {
      return FilterBottomSheet(params: params);
    },
  );
}

class FilterBottomSheetParams {
  const FilterBottomSheetParams({
    required this.title,
    required this.items,
    required this.onSelectChange,
  });

  final String title;
  final List<FilterSectionItem> items;
  final void Function(Map<int, List<int>>) onSelectChange;
}

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
    required this.params,
  });

  final FilterBottomSheetParams params;

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  Map<int, List<int>> selectedVariant = {};

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 12.r, bottom: 12.r),
            width: 40.r,
            height: 4.r,
            decoration: BoxDecoration(
              color: Theme.of(context).unselectedWidgetColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.r, vertical: 8.r),
          child: Text(
            widget.params.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Flexible(
          child: ListView.separated(
            itemCount: widget.params.items.length,
            padding: const EdgeInsets.all(16),
            separatorBuilder: (final _, final __) => SizedBox(height: 24.r),
            itemBuilder: (final _, final index) {
              return buildSection(
                item: widget.params.items[index],
                sectionIndex: index,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildSection({
    required final FilterSectionItem item,
    required final int sectionIndex,
  }) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: AutoSizeText(
            item.title ?? '',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          spacing: 8.r,
          children: List.generate(item.items.length, (final index) {
            return item.allowMultiSelect
                ? _filterItem(
                    value: item.items[index],
                    index: index,
                    sectionIndex: sectionIndex,
                  )
                : _radioItem(
                    value: item.items[index],
                    index: index,
                    sectionIndex: sectionIndex,
                  );
          }),
        ),
      ],
    );
  }

  Widget _radioItem({
    required final BottomSheetItem value,
    required final int index,
    required final int sectionIndex,
  }) {
    final isSelected = selectedVariant[sectionIndex]?.contains(index) ?? false;

    return ChoiceChip(
      label: Text(
        value.name ?? '',
        style: TextStyle(
          color: isSelected ? Theme.of(context).colorScheme.onPrimary : null,
        ),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.grey[300]!,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 0,
      pressElevation: 0,
      selectedColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.white,
      selected: isSelected,
      onSelected: (final selected) {
        setState(() {
          selectedVariant[sectionIndex] = [index];
        });
        widget.params.onSelectChange.call(selectedVariant);
      },
    );
  }

  Widget _filterItem({
    required final BottomSheetItem value,
    required final int index,
    required final int sectionIndex,
  }) {
    final isSelected = selectedVariant[sectionIndex]?.contains(index) ?? false;

    return FilterChip(
      label: Text(value.name ?? ''),
      labelStyle: TextStyle(
        color: isSelected ? Theme.of(context).colorScheme.onPrimary : null,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected
              ? Theme.of(context).primaryColor
              : Theme.of(context).unselectedWidgetColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      selected: isSelected,
      onSelected: (final _) {
        onTapFilter(sectionIndex, index);
        widget.params.onSelectChange.call(selectedVariant);
      },
      elevation: 0,
      pressElevation: 0,
      backgroundColor: Colors.white,
      selectedColor: Theme.of(context).primaryColor,
      checkmarkColor: Colors.white,
    );
  }

  void onTapFilter(
    final int sectionIndex,
    final int index, {
    final int? maxPick,
  }) {
    final isSelected = selectedVariant[sectionIndex]?.contains(index) ?? false;

    if (selectedVariant[sectionIndex] == null) {
      selectedVariant[sectionIndex] = [];
    }
    if (isSelected) {
      selectedVariant[sectionIndex]?.remove(index);
    } else {
      if (maxPick != null) {
        if ((selectedVariant[sectionIndex]?.length ?? 0) < maxPick) {
          selectedVariant[sectionIndex]?.add(index);
        }
      } else {
        selectedVariant[sectionIndex]?.add(index);
      }
    }
    setState(() {});
  }
}

class FilterSectionItem {
  const FilterSectionItem({
    required this.title,
    this.allowMultiSelect = false,
    required this.items,
  });

  final String? title;
  final bool allowMultiSelect;
  final List<BottomSheetItem> items;
}
