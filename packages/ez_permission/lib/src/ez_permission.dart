import 'package:flutter/material.dart';

import '../ez_permission.dart';

class EZPermission {
  /// return true/false when the permission is granted/denied
  static Future<bool> request(
    final BuildContext context,
    final PreAlertParams alertParams,
    final EZPermissionParams permissionParams,
  ) async {
    if (await hasPermission(permissionParams.permission)) {
      return true;
    }

    if (context.mounted) {
      await EZPreAlert.show<PermissionStatus>(
        context,
        PreAlertParams(
          title: alertParams.title,
          note: alertParams.note,
          confirmText: alertParams.confirmText,
          desc: alertParams.desc,
        ),
        permissionParams.permission.request,
      );
    }

    if (await hasPermission(permissionParams.permission)) {
      return true;
    } else {
      permissionParams.onDenied?.call();

      return false;
    }
  }

  static Future<bool> hasPermission(final Permission permission) async {
    final permissionStatus = await permission.status;
    final hasPermission = permissionStatus.isGranted ||
        permissionStatus.isLimited ||
        permissionStatus.isRestricted;

    return hasPermission;
  }
}
