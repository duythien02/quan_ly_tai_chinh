import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../widgets.dart';

class EzAutoCompleteForm extends StatefulWidget {
  const EzAutoCompleteForm({
    final Key? key,
    required this.items,
    this.label,
    required this.onSubmit,
    required this.submitText,
  }) : super(key: key);

  final List<String?> items;
  final String? label;
  final String submitText;
  final void Function(String?) onSubmit;

  @override
  EzAutoCompleteFormState createState() => EzAutoCompleteFormState();
}

class EzAutoCompleteFormState extends State<EzAutoCompleteForm> {
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.r),
          child: TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(labelText: widget.label),
              controller: _typeAheadController,
            ),
            suggestionsCallback: _getSuggestions,
            itemBuilder: (final context, final suggestion) {
              return ListTile(
                title: Text(suggestion ?? ''),
              );
            },
            transitionBuilder:
                (final context, final suggestionsBox, final controller) {
              return suggestionsBox;
            },
            onSuggestionSelected: (final suggestion) {
              _typeAheadController.text = suggestion ?? '';
            },
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.r),
          child: CreateButton(
            buttonName: widget.submitText,
            onPressed: () => widget.onSubmit.call(_typeAheadController.text),
          ),
        ),
      ],
    );
  }

  List<String?> _getSuggestions(final String query) {
    final matches = <String?>[];
    matches.addAll(widget.items);

    matches.retainWhere(
      (final s) => s?.toLowerCase().contains(query.toLowerCase()) ?? false,
    );

    return matches;
  }
}
