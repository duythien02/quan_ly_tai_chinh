import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateButton extends StatelessWidget {
  const CreateButton({
    super.key,
    required this.buttonName,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  });

  final Color backgroundColor;
  final Color textColor;
  final String buttonName;
  final Function onPressed;

  @override
  Widget build(final BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (final states) => backgroundColor,
        ),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
        ),
      ),
      onPressed: onPressed as void Function(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.r),
        child: Text(
          buttonName,
          style: TextStyle(fontSize: 14.sp, color: textColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
