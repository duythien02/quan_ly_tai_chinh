import 'package:permission_handler/permission_handler.dart';

class EZPermissionParams {
  EZPermissionParams({
    this.onDenied,
    required this.permission,
  });

  final Function()? onDenied;
  final Permission permission;
}
