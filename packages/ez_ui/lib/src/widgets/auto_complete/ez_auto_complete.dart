import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../widgets.dart';

class EzAutoComplete extends StatefulWidget {
  const EzAutoComplete({
    super.key,
    required this.items,
    this.hint,
    required this.onSuggestionSelected,
  });

  final List<AutoCompleteItem> items;
  final String? hint;
  final void Function(AutoCompleteItem) onSuggestionSelected;

  @override
  State<EzAutoComplete> createState() => _EzAutoCompleteState();
}

class _EzAutoCompleteState extends State<EzAutoComplete> {
  @override
  Widget build(final BuildContext context) {
    final boxImageSize = MediaQuery.of(context).size.width / 12;

    return TypeAheadField(
      textFieldConfiguration: TextFieldConfiguration(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: widget.hint,
        ),
      ),
      suggestionsCallback: _getSuggestions,
      itemBuilder: (final context, final suggestion) {
        return ListTile(
          leading: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            child: (suggestion.img?.isNotEmpty ?? false)
                ? EzCachedNetworkImage(
                    width: boxImageSize,
                    height: boxImageSize,
                    imageUrl: suggestion.img ?? '',
                  )
                : const SizedBox.shrink(),
          ),
          title: Text(suggestion.title ?? ''),
          subtitle: Text(
            suggestion.subTitle ?? '',
          ),
        );
      },
      onSuggestionSelected: widget.onSuggestionSelected,
    );
  }

  List<AutoCompleteItem> _getSuggestions(final String query) {
    final matches = <AutoCompleteItem>[];
    matches.addAll(widget.items);
    matches.retainWhere(
      (final data) =>
          data.title?.toLowerCase().contains(query.toLowerCase()) ?? false,
    );

    return matches;
  }
}

class AutoCompleteItem {
  AutoCompleteItem({
    this.title,
    this.img,
    this.subTitle,
  });

  final String? title;
  final String? img;
  final String? subTitle;
}
