// Package imports:
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

Future<TrackingStatus> appTrackingTransparencyForIOS() async {
  final TrackingStatus status =
      await AppTrackingTransparency.trackingAuthorizationStatus;
  if (status == TrackingStatus.notDetermined) {
    // Request system's tracking authorization dialog
    final TrackingStatus status =
        await AppTrackingTransparency.requestTrackingAuthorization();

    return status;
  }

  return TrackingStatus.notDetermined;
}
