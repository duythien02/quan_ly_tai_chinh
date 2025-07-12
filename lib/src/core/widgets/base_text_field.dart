// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
    this.controller, {
    this.label = '',
    super.key,
    this.readOnly = false,
    this.enabled = true,
    this.onTap,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixText,
    this.labelStyle = const TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: Colors.black54,
    ),
    this.textCapitalization = TextCapitalization.none,
    this.height,
    this.hintStyle,
    this.hintText,
    this.autofocus = false,
    this.focusNode,
    this.onSubmitted,
    this.textInputAction,
  });

  final TextEditingController controller;
  final String label;
  final bool readOnly;
  final bool enabled;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? prefixText;
  final TextStyle labelStyle;
  final TextCapitalization textCapitalization;
  final double? height;
  final String? hintText;
  final TextStyle? hintStyle;
  final bool autofocus;
  final FocusNode? focusNode;
  final void Function(String)? onSubmitted;
  final TextInputAction? textInputAction;
  @override
  Widget build(final BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: AutoSizeText(
                label,
                style: labelStyle,
              ),
            ),
          SizedBox(
            height: height,
            child: TextField(
              enabled: enabled,
              onTap: onTap,
              readOnly: onTap != null || readOnly,
              autofocus: autofocus,
              textCapitalization: textCapitalization,
              textInputAction: textInputAction ?? TextInputAction.next,
              controller: controller,
              focusNode: focusNode,
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle ??
                    Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Theme.of(context).hintColor),
                prefixText: prefixText,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                suffixIcon: suffixIcon,
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
                fillColor: readOnly
                    ? Theme.of(context).primaryColorLight
                    : Theme.of(context).scaffoldBackgroundColor,
              ),
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              obscureText: obscureText,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
