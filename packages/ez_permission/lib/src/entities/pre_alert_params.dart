import 'package:flutter/material.dart';

import 'pre_alert_item.dart';

class PreAlertParams {
  const PreAlertParams({
    required this.title,
    required this.desc,
    required this.note,
    required this.confirmText,
    this.backgroundColor,
  });

  final String title;
  final List<PreAlertItem> desc;
  final String note;
  final String confirmText;
  final Color? backgroundColor;
}
