// Project imports:
import '../ez_firebase.dart';

class FirebaseListenersParams {
  FirebaseListenersParams({
    required this.vapidKey,
    required this.handleNotification,
    required this.onTokenReceived,
    this.log,
  });

  final String? vapidKey;
  final Function(RemoteMessage, {required bool isBackground})
      handleNotification;
  final Function(String?) onTokenReceived;
  final Function(String)? log;
}
