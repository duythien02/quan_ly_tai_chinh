import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignatureResultPage extends StatefulWidget {
  const SignatureResultPage({final Key? key, required this.data})
      : super(key: key);
  final Uint8List data;

  @override
  SignatureResultPageState createState() => SignatureResultPageState();
}

class SignatureResultPageState extends State<SignatureResultPage> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            minHeight: 100.r,
            minWidth: double.infinity,
            maxHeight: 200.r,
          ),
          child: Image.memory(widget.data),
        ),
      ),
    );
  }
}
