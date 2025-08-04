import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'TDTFinance';

  @override
  String get unknown => 'An error occurred, please try again later';

  @override
  String get connectionErrorPleaseRefresh =>
      'Network connection error, please check your internet connection and try again';

  @override
  String get refresh => 'Refresh';

  @override
  String get accept => 'Accept';

  @override
  String get cancel => 'Cancel';

  @override
  String get cancelRequest => 'Cancel request';

  @override
  String get requestDuration => 'Request duration';

  @override
  String get close => 'Close';

  @override
  String get connectionError => 'No internet connection, please check again';

  @override
  String get onTheNextScreen => 'On the next screen to:';

  @override
  String get requestStoragePermission => 'Allow access to files';

  @override
  String get storageRequest1 => 'Download file storage';

  @override
  String get changeSettingsLater =>
      'You can change this permission later in the application settings';

  @override
  String get continuous => 'Continue';

  @override
  String get requestPermissionLibrary => 'Allow access to photo library';

  @override
  String get photoRequest1 => 'Update personal information';

  @override
  String get requestPermissionCamera => 'Allow access to camera';

  @override
  String get cameraRequest1 => 'Take a photo to update personal information';

  @override
  String get cameraRequest2 => 'Scan code easily';

  @override
  String get microPermissionRequest => 'Allow access to microphone';

  @override
  String get microRequest1 => 'Call audio';

  @override
  String get microRequest2 => 'Send audio support';

  @override
  String get emptyContent => 'No content';

  @override
  String get notification => 'Alert';

  @override
  String get openSettings => 'Open settings';

  @override
  String get notNow => 'Later';

  @override
  String get camera => 'Camera';

  @override
  String settingTitle(String permission) {
    return 'Enable access to $permission in the device settings';
  }

  @override
  String settingMessage(String permission) {
    return 'TDTFinance uses access to $permission to serve activities like ';
  }

  @override
  String get photoLibrary => 'Photo library';

  @override
  String get micro => 'Micro';

  @override
  String get location => 'Location';

  @override
  String get file => 'File';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get logout => 'Logout';

  @override
  String get image => 'Image';

  @override
  String get takePicture => 'Take picture';

  @override
  String get viewMore => 'View more';

  @override
  String get collapse => 'Collapse';

  @override
  String get downloadComplete => 'Download complete';

  @override
  String get open => 'Open';

  @override
  String get getImageInCamera => 'Take new photo';

  @override
  String get getImageInGallery => 'Select existing photo';

  @override
  String get hintTextUser => 'Enter your username';

  @override
  String get hintTextPassword => 'Enter your password';

  @override
  String get today => 'Today';

  @override
  String get forgetPassword => 'Forgot Password?';

  @override
  String get passwordRecoveryTitle => 'Password Recovery';

  @override
  String get passwordRecoveryGuide =>
      'Please enter your user ID or email address. An email containing a recovery link will be sent to your registered email address. Please follow the instructions in the email.';

  @override
  String get recoveryInputText => 'Please enter userID or email';

  @override
  String get submitButton => 'Submit';

  @override
  String get sort => 'Sort';

  @override
  String get home => 'Home';

  @override
  String get enterTime => 'Enter Time';

  @override
  String get selectTime => 'Select Time';

  @override
  String get okButton => 'OK';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get switchToDragMode => 'Switch to Drag Mode';

  @override
  String get switchToWheelMode => 'Switch to Wheel Mode';

  @override
  String get switchToInputMode => 'Switch to Input Mode';

  @override
  String get morning => 'Morning';

  @override
  String get afternoon => 'Afternoon';

  @override
  String get next => 'Next';

  @override
  String get createAccount => 'Create account';

  @override
  String get createTheFirstAccount => 'Create the first account!';

  @override
  String get currencyType => 'Currency type';

  @override
  String get accountName => 'Account name';

  @override
  String get initialBalance => 'Initial balance';

  @override
  String get dontHaveAnAccount => 'Don\'t have an account? Register';

  @override
  String get alreadyHaveAnAccount => 'Already have an account? Login';

  @override
  String get hintTextEmail => 'Enter your email';

  @override
  String get profile => 'Profile';

  @override
  String get hello => 'Hello';

  @override
  String get skip => 'Skip';

  @override
  String get welcomeBack => 'Welcome back!';

  @override
  String get loginToContinue => 'Login to continue';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get onboarding_1Title => 'Easy expense management';

  @override
  String get onboarding_1Description =>
      'Record every day\'s income and expense to have a clear overview of your finances.';
}
