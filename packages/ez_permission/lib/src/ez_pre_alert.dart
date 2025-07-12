// Flutter imports:
// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_size_text/auto_size_text.dart';

import 'entities/pre_alert_params.dart';

class EZPreAlert extends StatelessWidget {
  const EZPreAlert(
    this.params,
    this.onRequest, {
    final Key? key,
  }) : super(key: key);

  static Future<T?> show<T>(
    final BuildContext context,
    final PreAlertParams params,
    final Future<dynamic> Function() onRequest,
  ) async {
    return showDialog<T>(
      context: context,
      useSafeArea: false,
      builder: (final _) => EZPreAlert(params, onRequest),
    );
  }

  final PreAlertParams params;
  final Future<dynamic> Function() onRequest;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: params.backgroundColor ?? const Color(0xff60bb6f),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: MediaQuery.of(context).size.height * 0.1,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: double.maxFinite,
                child: AutoSizeText(
                  params.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 30,
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: params.desc.length,
                padding: const EdgeInsets.symmetric(vertical: 45),
                separatorBuilder: (final _, final __) =>
                    const SizedBox(height: 35),
                itemBuilder: (final _, final index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: params.desc[index].icon,
                    title: AutoSizeText(
                      params.desc[index].desc,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        fontSize: 19,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                width: double.maxFinite,
                child: AutoSizeText(
                  params.note,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 19,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              buildButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(final BuildContext context) {
    return RawMaterialButton(
      splashColor: Theme.of(context).dividerColor,
      highlightColor: Theme.of(context).dividerColor,
      onPressed: () async {
        try {
          final dynamic requestResult = await onRequest();
          Navigator.of(context).pop(requestResult);
        } catch (_) {
          Navigator.of(context).pop();
        }
      },
      elevation: 6.0,
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      child: SizedBox(
        height: 55,
        child: Center(
          child: AutoSizeText(
            params.confirmText,
            style: const TextStyle(
              color: Color(0xff60bb6f),
              fontStyle: FontStyle.normal,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
