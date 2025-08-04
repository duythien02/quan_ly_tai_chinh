import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'arb/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'TDTFinance'**
  String get appName;

  /// No description provided for @unknown.
  ///
  /// In en, this message translates to:
  /// **'An error occurred, please try again later'**
  String get unknown;

  /// No description provided for @connectionErrorPleaseRefresh.
  ///
  /// In en, this message translates to:
  /// **'Network connection error, please check your internet connection and try again'**
  String get connectionErrorPleaseRefresh;

  /// No description provided for @refresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get refresh;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @cancelRequest.
  ///
  /// In en, this message translates to:
  /// **'Cancel request'**
  String get cancelRequest;

  /// No description provided for @requestDuration.
  ///
  /// In en, this message translates to:
  /// **'Request duration'**
  String get requestDuration;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @connectionError.
  ///
  /// In en, this message translates to:
  /// **'No internet connection, please check again'**
  String get connectionError;

  /// No description provided for @onTheNextScreen.
  ///
  /// In en, this message translates to:
  /// **'On the next screen to:'**
  String get onTheNextScreen;

  /// No description provided for @requestStoragePermission.
  ///
  /// In en, this message translates to:
  /// **'Allow access to files'**
  String get requestStoragePermission;

  /// No description provided for @storageRequest1.
  ///
  /// In en, this message translates to:
  /// **'Download file storage'**
  String get storageRequest1;

  /// No description provided for @changeSettingsLater.
  ///
  /// In en, this message translates to:
  /// **'You can change this permission later in the application settings'**
  String get changeSettingsLater;

  /// No description provided for @continuous.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continuous;

  /// No description provided for @requestPermissionLibrary.
  ///
  /// In en, this message translates to:
  /// **'Allow access to photo library'**
  String get requestPermissionLibrary;

  /// No description provided for @photoRequest1.
  ///
  /// In en, this message translates to:
  /// **'Update personal information'**
  String get photoRequest1;

  /// No description provided for @requestPermissionCamera.
  ///
  /// In en, this message translates to:
  /// **'Allow access to camera'**
  String get requestPermissionCamera;

  /// No description provided for @cameraRequest1.
  ///
  /// In en, this message translates to:
  /// **'Take a photo to update personal information'**
  String get cameraRequest1;

  /// No description provided for @cameraRequest2.
  ///
  /// In en, this message translates to:
  /// **'Scan code easily'**
  String get cameraRequest2;

  /// No description provided for @microPermissionRequest.
  ///
  /// In en, this message translates to:
  /// **'Allow access to microphone'**
  String get microPermissionRequest;

  /// No description provided for @microRequest1.
  ///
  /// In en, this message translates to:
  /// **'Call audio'**
  String get microRequest1;

  /// No description provided for @microRequest2.
  ///
  /// In en, this message translates to:
  /// **'Send audio support'**
  String get microRequest2;

  /// No description provided for @emptyContent.
  ///
  /// In en, this message translates to:
  /// **'No content'**
  String get emptyContent;

  /// No description provided for @notification.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get notification;

  /// No description provided for @openSettings.
  ///
  /// In en, this message translates to:
  /// **'Open settings'**
  String get openSettings;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get notNow;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @settingTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable access to {permission} in the device settings'**
  String settingTitle(String permission);

  /// No description provided for @settingMessage.
  ///
  /// In en, this message translates to:
  /// **'TDTFinance uses access to {permission} to serve activities like '**
  String settingMessage(String permission);

  /// No description provided for @photoLibrary.
  ///
  /// In en, this message translates to:
  /// **'Photo library'**
  String get photoLibrary;

  /// No description provided for @micro.
  ///
  /// In en, this message translates to:
  /// **'Micro'**
  String get micro;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @file.
  ///
  /// In en, this message translates to:
  /// **'File'**
  String get file;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get image;

  /// No description provided for @takePicture.
  ///
  /// In en, this message translates to:
  /// **'Take picture'**
  String get takePicture;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'View more'**
  String get viewMore;

  /// No description provided for @collapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse'**
  String get collapse;

  /// No description provided for @downloadComplete.
  ///
  /// In en, this message translates to:
  /// **'Download complete'**
  String get downloadComplete;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @getImageInCamera.
  ///
  /// In en, this message translates to:
  /// **'Take new photo'**
  String get getImageInCamera;

  /// No description provided for @getImageInGallery.
  ///
  /// In en, this message translates to:
  /// **'Select existing photo'**
  String get getImageInGallery;

  /// No description provided for @hintTextUser.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get hintTextUser;

  /// No description provided for @hintTextPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get hintTextPassword;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgetPassword;

  /// No description provided for @passwordRecoveryTitle.
  ///
  /// In en, this message translates to:
  /// **'Password Recovery'**
  String get passwordRecoveryTitle;

  /// No description provided for @passwordRecoveryGuide.
  ///
  /// In en, this message translates to:
  /// **'Please enter your user ID or email address. An email containing a recovery link will be sent to your registered email address. Please follow the instructions in the email.'**
  String get passwordRecoveryGuide;

  /// No description provided for @recoveryInputText.
  ///
  /// In en, this message translates to:
  /// **'Please enter userID or email'**
  String get recoveryInputText;

  /// No description provided for @submitButton.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submitButton;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @enterTime.
  ///
  /// In en, this message translates to:
  /// **'Enter Time'**
  String get enterTime;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Select Time'**
  String get selectTime;

  /// No description provided for @okButton.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButton;

  /// No description provided for @cancelButton.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelButton;

  /// No description provided for @switchToDragMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to Drag Mode'**
  String get switchToDragMode;

  /// No description provided for @switchToWheelMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to Wheel Mode'**
  String get switchToWheelMode;

  /// No description provided for @switchToInputMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to Input Mode'**
  String get switchToInputMode;

  /// No description provided for @morning.
  ///
  /// In en, this message translates to:
  /// **'Morning'**
  String get morning;

  /// No description provided for @afternoon.
  ///
  /// In en, this message translates to:
  /// **'Afternoon'**
  String get afternoon;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// No description provided for @createTheFirstAccount.
  ///
  /// In en, this message translates to:
  /// **'Hi, pls create the first account!'**
  String get createTheFirstAccount;

  /// No description provided for @currencyType.
  ///
  /// In en, this message translates to:
  /// **'Currency type'**
  String get currencyType;

  /// No description provided for @accountName.
  ///
  /// In en, this message translates to:
  /// **'Account name'**
  String get accountName;

  /// No description provided for @initialBalance.
  ///
  /// In en, this message translates to:
  /// **'Initial balance'**
  String get initialBalance;

  /// No description provided for @dontHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don't have an account? Register'**
  String get dontHaveAnAccount;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Login'**
  String get alreadyHaveAnAccount;

  /// No description provided for @hintTextEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get hintTextEmail;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get welcomeBack;

  /// No description provided for @loginToContinue.
  ///
  /// In en, this message translates to:
  /// **'Login to continue'**
  String get loginToContinue;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @onboarding_1Title.
  ///
  /// In en, this message translates to:
  /// **'Quản lý chi tiêu dễ dàng'**
  String get onboarding_1Title;

  /// No description provided for @onboarding_1Description.
  ///
  /// In en, this message translates to:
  /// **'Ghi chép lại mọi khoản thu chi hàng ngày để có cái nhìn tổng quan về tài chính của bạn.'**
  String get onboarding_1Description;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
