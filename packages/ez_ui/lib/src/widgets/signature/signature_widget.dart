import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signature/signature.dart';

class SignatureWidget extends StatefulWidget {
  const SignatureWidget({
    final Key? key,
    this.iconUndo,
    this.iconRedo,
    this.iconClear,
    this.iconDone,
    this.toolbarColor,
    this.width,
    this.height,
    this.onFinished,
  }) : super(key: key);

  final Widget? iconUndo;
  final Widget? iconRedo;
  final Widget? iconClear;
  final Widget? iconDone;
  final Color? toolbarColor;
  final double? width;
  final double? height;
  final void Function(Uint8List?)? onFinished;

  @override
  SignatureWidgetState createState() => SignatureWidgetState();
}

class SignatureWidgetState extends State<SignatureWidget> {
  final SignatureController _controller = SignatureController(
    exportBackgroundColor: Colors.white,
  );

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SIGNATURE CANVAS
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Signature(
              controller: _controller,
              width: widget.width ?? MediaQuery.of(context).size.width - 50,
              height: widget.height ?? 400.r,
              backgroundColor: Colors.white,
            ),
          ),
          //OK AND CLEAR BUTTONS
          Container(
            decoration:
                BoxDecoration(color: widget.toolbarColor ?? Colors.blue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                widget.iconDone ??
                    IconButton(
                      icon: const Icon(Icons.check),
                      color: Colors.white,
                      onPressed: () async {
                        if (_controller.isNotEmpty) {
                          await _controller.toPngBytes().then((final data) {
                            widget.onFinished?.call(data);
                          });
                        }
                      },
                    ),
                widget.iconUndo ??
                    IconButton(
                      icon: const Icon(Icons.undo),
                      color: Colors.white,
                      onPressed: () {
                        setState(_controller.undo);
                      },
                    ),
                widget.iconRedo ??
                    IconButton(
                      icon: const Icon(Icons.redo),
                      color: Colors.white,
                      onPressed: () {
                        setState(_controller.redo);
                      },
                    ),
                //CLEAR CANVAS
                widget.iconClear ??
                    IconButton(
                      icon: const Icon(Icons.clear),
                      color: Colors.white,
                      onPressed: () {
                        setState(_controller.clear);
                      },
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
