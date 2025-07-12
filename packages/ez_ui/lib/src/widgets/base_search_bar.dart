// Flutter imports:
import 'package:flutter/material.dart';

class BaseSearchBar extends StatefulWidget {
  const BaseSearchBar({
    final Key? key,
    required this.controller,
    this.onClear,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.colorBackground,
  }) : super(key: key);

  final TextEditingController controller;

  final Function(String)? onChanged;

  final Function(String)? onSubmitted;

  final Function()? onClear;

  final String? hintText;

  final Color? colorBackground;

  @override
  BaseSearchBarState createState() => BaseSearchBarState();
}

class BaseSearchBarState extends State<BaseSearchBar> {
  @override
  Widget build(final BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(189),
      borderSide: const BorderSide(
        style: BorderStyle.none,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: widget.colorBackground ?? Theme.of(context).dividerColor,
      ),
      child: TextField(
        controller: widget.controller,
        style: Theme.of(context).textTheme.bodyMedium,
        onSubmitted: (final text) => widget.onSubmitted?.call(text),
        onChanged: (final text) {
          setState(() {
            if (text.isEmpty) {
              widget.onClear?.call();
            } else {
              widget.onChanged?.call(widget.controller.text);
            }
          });
        },
        decoration: InputDecoration(
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).hintColor,
              ),
          hintText: widget.hintText,
          prefixIcon: IconButton(
            iconSize: 14,
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          suffixIcon: widget.controller.text.isNotEmpty
              ? InkWell(
                  highlightColor: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0),
                  splashColor: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0),
                  onTap: () {
                    setState(() {
                      widget.controller.clear();
                      widget.onClear?.call();
                    });
                  },
                  child: const SizedBox(
                    width: 16,
                    height: 16,
                    child: Center(
                      child: Icon(Icons.close),
                    ),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
