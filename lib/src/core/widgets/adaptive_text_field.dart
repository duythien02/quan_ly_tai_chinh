// Flutter imports:
import 'package:flutter/material.dart';

class AdaptiveTextField extends StatefulWidget {
  const AdaptiveTextField({
    super.key,
    this.hintText,
    this.controller,
    this.hintStyle = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.black54,
    ),
    this.onChanged,
    this.maxHeight,
  });
  final String? hintText;
  final TextEditingController? controller;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;
  final double? maxHeight;

  @override
  State<AdaptiveTextField> createState() => _AdaptiveTextFieldState();
}

class _AdaptiveTextFieldState extends State<AdaptiveTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    // Add listener to handle text wrapping
    _controller.addListener(_handleTextWrapping);
  }

  void _handleTextWrapping() {
    final text = _controller.text;
    if (text.isNotEmpty) {
      // Get current cursor position
      final cursorPosition = _controller.selection.start;

      // Add newline if text exceeds width
      final maxCharsPerLine = (MediaQuery.sizeOf(context).width /
              (widget.hintStyle?.fontSize ?? 13))
          .floor();

      if (text.length > cursorPosition &&
          cursorPosition > 0 &&
          cursorPosition % maxCharsPerLine == 0 &&
          text[cursorPosition - 1] != '\n') {
        final newText = text.replaceRange(cursorPosition, cursorPosition, '\n');
        _controller.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(
            offset: cursorPosition + 1,
          ),
        );
      }
    }
  }

  @override
  Widget build(final BuildContext context) {
    return LayoutBuilder(
      builder: (final context, final constraints) {
        return TextFormField(
          controller: _controller,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          onChanged: (final value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).hintColor),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).hintColor),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            filled: true,
            fillColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          style: const TextStyle(
            height: 1.5,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextWrapping);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
