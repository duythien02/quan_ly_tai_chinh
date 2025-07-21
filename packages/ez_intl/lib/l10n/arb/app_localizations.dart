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
  /// **'Kantoku'**
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
  /// **'Không có kết nối internet, vui lòng kiểm tra lại'**
  String get connectionError;

  /// No description provided for @onTheNextScreen.
  ///
  /// In en, this message translates to:
  /// **'ở màn hình tiếp theo để:'**
  String get onTheNextScreen;

  /// No description provided for @requestStoragePermission.
  ///
  /// In en, this message translates to:
  /// **'Cho phép truy cập tệp tin'**
  String get requestStoragePermission;

  /// No description provided for @storageRequest1.
  ///
  /// In en, this message translates to:
  /// **'Lưu trữ tệp tải về'**
  String get storageRequest1;

  /// No description provided for @changeSettingsLater.
  ///
  /// In en, this message translates to:
  /// **'Bạn có thể thay đổi quyền này sau ở trong mục Cài đặt của ứng dụng'**
  String get changeSettingsLater;

  /// No description provided for @continuous.
  ///
  /// In en, this message translates to:
  /// **'Tiếp tục'**
  String get continuous;

  /// No description provided for @requestPermissionLibrary.
  ///
  /// In en, this message translates to:
  /// **'Cho phép truy cập thư viện ảnh'**
  String get requestPermissionLibrary;

  /// No description provided for @photoRequest1.
  ///
  /// In en, this message translates to:
  /// **'Cập nhật ảnh thông tin cá nhân'**
  String get photoRequest1;

  /// No description provided for @requestPermissionCamera.
  ///
  /// In en, this message translates to:
  /// **'Cho phép truy cập camera'**
  String get requestPermissionCamera;

  /// No description provided for @cameraRequest1.
  ///
  /// In en, this message translates to:
  /// **'Chụp hình cập nhật thông tin cá nhân'**
  String get cameraRequest1;

  /// No description provided for @cameraRequest2.
  ///
  /// In en, this message translates to:
  /// **'Quét mã code dễ dàng'**
  String get cameraRequest2;

  /// No description provided for @microPermissionRequest.
  ///
  /// In en, this message translates to:
  /// **'Cho phép ghi âm thiết bị'**
  String get microPermissionRequest;

  /// No description provided for @microRequest1.
  ///
  /// In en, this message translates to:
  /// **'Gọi âm thanh'**
  String get microRequest1;

  /// No description provided for @microRequest2.
  ///
  /// In en, this message translates to:
  /// **'Gửi ghi âm hỗ trợ'**
  String get microRequest2;

  /// No description provided for @emptyContent.
  ///
  /// In en, this message translates to:
  /// **'Chưa có nội dung'**
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
  /// **'Lúc khác'**
  String get notNow;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Máy ảnh'**
  String get camera;

  /// No description provided for @settingTitle.
  ///
  /// In en, this message translates to:
  /// **'Bật quyền truy cập {permission} trong phần cài đặt thiết bị'**
  String settingTitle(String permission);

  /// No description provided for @settingMessage.
  ///
  /// In en, this message translates to:
  /// **'Ngọc Dung dùng quyền truy cập {permission} để phục vụ cho hoạt động như '**
  String settingMessage(String permission);

  /// No description provided for @photoLibrary.
  ///
  /// In en, this message translates to:
  /// **'Thư viện ảnh'**
  String get photoLibrary;

  /// No description provided for @micro.
  ///
  /// In en, this message translates to:
  /// **'Micro'**
  String get micro;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Vị trí'**
  String get location;

  /// No description provided for @file.
  ///
  /// In en, this message translates to:
  /// **'Tệp tin'**
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
  /// **'Hình ảnh'**
  String get image;

  /// No description provided for @takePicture.
  ///
  /// In en, this message translates to:
  /// **'Chụp hình'**
  String get takePicture;

  /// No description provided for @viewMore.
  ///
  /// In en, this message translates to:
  /// **'Xem thêm'**
  String get viewMore;

  /// No description provided for @collapse.
  ///
  /// In en, this message translates to:
  /// **'Thu gọn'**
  String get collapse;

  /// No description provided for @downloadComplete.
  ///
  /// In en, this message translates to:
  /// **'Tải xuống hoàn tất'**
  String get downloadComplete;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Mở'**
  String get open;

  /// No description provided for @getImageInCamera.
  ///
  /// In en, this message translates to:
  /// **'Chụp ảnh mới'**
  String get getImageInCamera;

  /// No description provided for @getImageInGallery.
  ///
  /// In en, this message translates to:
  /// **'Chọn ảnh có sẵn'**
  String get getImageInGallery;

  /// No description provided for @hintTextUser.
  ///
  /// In en, this message translates to:
  /// **'Enter your ID Login'**
  String get hintTextUser;

  /// No description provided for @hintTextPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get hintTextPassword;

  /// No description provided for @hintTextOrgCode.
  ///
  /// In en, this message translates to:
  /// **'Enter organization code'**
  String get hintTextOrgCode;

  /// No description provided for @startBreak.
  ///
  /// In en, this message translates to:
  /// **'Break-in'**
  String get startBreak;

  /// No description provided for @endBreak.
  ///
  /// In en, this message translates to:
  /// **'Break-out'**
  String get endBreak;

  /// No description provided for @checkin.
  ///
  /// In en, this message translates to:
  /// **'Check-in'**
  String get checkin;

  /// No description provided for @quickCheckin.
  ///
  /// In en, this message translates to:
  /// **'Quick check-in'**
  String get quickCheckin;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Check-out'**
  String get checkout;

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

  /// No description provided for @attendanceRecord.
  ///
  /// In en, this message translates to:
  /// **'Attendance record'**
  String get attendanceRecord;

  /// No description provided for @worksiteList.
  ///
  /// In en, this message translates to:
  /// **'Worksite List'**
  String get worksiteList;

  /// No description provided for @currentProject.
  ///
  /// In en, this message translates to:
  /// **'Current project'**
  String get currentProject;

  /// No description provided for @otherProject.
  ///
  /// In en, this message translates to:
  /// **'Other project'**
  String get otherProject;

  /// No description provided for @noLog.
  ///
  /// In en, this message translates to:
  /// **'No log'**
  String get noLog;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get addNote;

  /// No description provided for @todayLog.
  ///
  /// In en, this message translates to:
  /// **'Activity of today'**
  String get todayLog;

  /// No description provided for @theNextWorkingDay.
  ///
  /// In en, this message translates to:
  /// **'The next working day'**
  String get theNextWorkingDay;

  /// No description provided for @alert.
  ///
  /// In en, this message translates to:
  /// **'Alert'**
  String get alert;

  /// No description provided for @selectProjectFirst.
  ///
  /// In en, this message translates to:
  /// **'Please select project first'**
  String get selectProjectFirst;

  /// No description provided for @project.
  ///
  /// In en, this message translates to:
  /// **'Project'**
  String get project;

  /// No description provided for @projectMenu.
  ///
  /// In en, this message translates to:
  /// **'Project menu'**
  String get projectMenu;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @enterWorkplace.
  ///
  /// In en, this message translates to:
  /// **'Enter workplace'**
  String get enterWorkplace;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @remote.
  ///
  /// In en, this message translates to:
  /// **'remote'**
  String get remote;

  /// No description provided for @officeList.
  ///
  /// In en, this message translates to:
  /// **'Office List'**
  String get officeList;

  /// No description provided for @projectList.
  ///
  /// In en, this message translates to:
  /// **'Project List'**
  String get projectList;

  /// No description provided for @workLocation.
  ///
  /// In en, this message translates to:
  /// **'Work location'**
  String get workLocation;

  /// No description provided for @requiredProjectOrOffice.
  ///
  /// In en, this message translates to:
  /// **'Please select office or project first'**
  String get requiredProjectOrOffice;

  /// No description provided for @requiredCheckin.
  ///
  /// In en, this message translates to:
  /// **'Please check-in first'**
  String get requiredCheckin;

  /// No description provided for @requiredCheckout.
  ///
  /// In en, this message translates to:
  /// **'Please check-out first'**
  String get requiredCheckout;

  /// No description provided for @requiredBreakIn.
  ///
  /// In en, this message translates to:
  /// **'Please break-in first'**
  String get requiredBreakIn;

  /// No description provided for @requiredBreakOut.
  ///
  /// In en, this message translates to:
  /// **'Please break-out first'**
  String get requiredBreakOut;

  /// No description provided for @requiredLocationService.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled, would you like to enable them?'**
  String get requiredLocationService;

  /// No description provided for @checkInSuccess.
  ///
  /// In en, this message translates to:
  /// **'Check-in success'**
  String get checkInSuccess;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'success'**
  String get success;

  /// No description provided for @gpsIn.
  ///
  /// In en, this message translates to:
  /// **'GPS in'**
  String get gpsIn;

  /// No description provided for @gpsOut.
  ///
  /// In en, this message translates to:
  /// **'GPS out'**
  String get gpsOut;

  /// No description provided for @fixedHour.
  ///
  /// In en, this message translates to:
  /// **'Worked Time'**
  String get fixedHour;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @detail.
  ///
  /// In en, this message translates to:
  /// **'Detail'**
  String get detail;

  /// No description provided for @overtime.
  ///
  /// In en, this message translates to:
  /// **'Overtime'**
  String get overtime;

  /// No description provided for @workload.
  ///
  /// In en, this message translates to:
  /// **'Workload'**
  String get workload;

  /// No description provided for @workloadAllocation.
  ///
  /// In en, this message translates to:
  /// **'Workload Allocation'**
  String get workloadAllocation;

  /// No description provided for @worktime.
  ///
  /// In en, this message translates to:
  /// **'Worktime'**
  String get worktime;

  /// No description provided for @checkInTime.
  ///
  /// In en, this message translates to:
  /// **'Check-in Time'**
  String get checkInTime;

  /// No description provided for @requestDailyAttendance.
  ///
  /// In en, this message translates to:
  /// **'Send Note'**
  String get requestDailyAttendance;

  /// No description provided for @requestApproval.
  ///
  /// In en, this message translates to:
  /// **'Request Approval'**
  String get requestApproval;

  /// No description provided for @logHours.
  ///
  /// In en, this message translates to:
  /// **'Log Hours'**
  String get logHours;

  /// No description provided for @managerLogHours.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get managerLogHours;

  /// No description provided for @worksiteManager.
  ///
  /// In en, this message translates to:
  /// **'Worksite Manager'**
  String get worksiteManager;

  /// No description provided for @request.
  ///
  /// In en, this message translates to:
  /// **'Request'**
  String get request;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @selectOrg.
  ///
  /// In en, this message translates to:
  /// **'Select organization'**
  String get selectOrg;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @worksite.
  ///
  /// In en, this message translates to:
  /// **'Worksite'**
  String get worksite;

  /// No description provided for @dayTimeApproval.
  ///
  /// In en, this message translates to:
  /// **'Approval'**
  String get dayTimeApproval;

  /// No description provided for @dailyReport.
  ///
  /// In en, this message translates to:
  /// **'Daily Report'**
  String get dailyReport;

  /// No description provided for @worksiteName.
  ///
  /// In en, this message translates to:
  /// **'Worksite Name'**
  String get worksiteName;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @workerName.
  ///
  /// In en, this message translates to:
  /// **'Worker Name'**
  String get workerName;

  /// No description provided for @workerList.
  ///
  /// In en, this message translates to:
  /// **'Worker List'**
  String get workerList;

  /// No description provided for @attendanceStatus.
  ///
  /// In en, this message translates to:
  /// **'Attendance Status'**
  String get attendanceStatus;

  /// No description provided for @notCheckIn.
  ///
  /// In en, this message translates to:
  /// **'Not Check-in'**
  String get notCheckIn;

  /// No description provided for @checkedIn.
  ///
  /// In en, this message translates to:
  /// **'Checked-in'**
  String get checkedIn;

  /// No description provided for @checkinGPS.
  ///
  /// In en, this message translates to:
  /// **'Check-in GPS'**
  String get checkinGPS;

  /// No description provided for @checkoutGPS.
  ///
  /// In en, this message translates to:
  /// **'Check-out GPS'**
  String get checkoutGPS;

  /// No description provided for @approvalStatus.
  ///
  /// In en, this message translates to:
  /// **'Approval Status'**
  String get approvalStatus;

  /// No description provided for @requestStatus.
  ///
  /// In en, this message translates to:
  /// **'Request Status'**
  String get requestStatus;

  /// No description provided for @requested.
  ///
  /// In en, this message translates to:
  /// **'Requested'**
  String get requested;

  /// No description provided for @noRequest.
  ///
  /// In en, this message translates to:
  /// **'Not requested'**
  String get noRequest;

  /// No description provided for @requestList.
  ///
  /// In en, this message translates to:
  /// **'Request List'**
  String get requestList;

  /// No description provided for @noPermission.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to access'**
  String get noPermission;

  /// No description provided for @noteList.
  ///
  /// In en, this message translates to:
  /// **'Note list'**
  String get noteList;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get reject;

  /// No description provided for @rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get rejected;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @absent.
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get absent;

  /// No description provided for @scheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get scheduled;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @breakTime.
  ///
  /// In en, this message translates to:
  /// **'Break Time'**
  String get breakTime;

  /// No description provided for @developmentWarning.
  ///
  /// In en, this message translates to:
  /// **'This feature is under development'**
  String get developmentWarning;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get changePassword;

  /// No description provided for @currentPass.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get currentPass;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPassword;

  /// No description provided for @confirmPass.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPass;

  /// No description provided for @pleaseEnterAllFields.
  ///
  /// In en, this message translates to:
  /// **'Please fill out all fields to proceed'**
  String get pleaseEnterAllFields;

  /// No description provided for @confirmPassIncorrect.
  ///
  /// In en, this message translates to:
  /// **'Password and Confirm Password does not match'**
  String get confirmPassIncorrect;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is invalid. Password must contain both upper and lowercase letter and include number'**
  String get invalidPassword;

  /// No description provided for @changePasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your password was successfully changed'**
  String get changePasswordSuccess;

  /// No description provided for @msgChangePass.
  ///
  /// In en, this message translates to:
  /// **'Please update your password'**
  String get msgChangePass;

  /// No description provided for @offlineModeAlert.
  ///
  /// In en, this message translates to:
  /// **'You are in offline mode'**
  String get offlineModeAlert;

  /// No description provided for @locationNotFound.
  ///
  /// In en, this message translates to:
  /// **'Location not found'**
  String get locationNotFound;

  /// No description provided for @quitAccountAlert.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to quit this account ?'**
  String get quitAccountAlert;

  /// No description provided for @loginWithBiometric.
  ///
  /// In en, this message translates to:
  /// **'Login with your biometric'**
  String get loginWithBiometric;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @sendNote.
  ///
  /// In en, this message translates to:
  /// **'Send note'**
  String get sendNote;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get thisWeek;

  /// No description provided for @lastWeek.
  ///
  /// In en, this message translates to:
  /// **'Last week'**
  String get lastWeek;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get thisMonth;

  /// No description provided for @lastMonth.
  ///
  /// In en, this message translates to:
  /// **'Last month'**
  String get lastMonth;

  /// No description provided for @custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get custom;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @paid.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get paid;

  /// No description provided for @unpaid.
  ///
  /// In en, this message translates to:
  /// **'Unpaid'**
  String get unpaid;

  /// No description provided for @dayOff.
  ///
  /// In en, this message translates to:
  /// **'Day Off'**
  String get dayOff;

  /// No description provided for @backToWork.
  ///
  /// In en, this message translates to:
  /// **'Back To Work'**
  String get backToWork;

  /// No description provided for @changeShift.
  ///
  /// In en, this message translates to:
  /// **'changeShift'**
  String get changeShift;

  /// No description provided for @metricTitle.
  ///
  /// In en, this message translates to:
  /// **'Monthly Attendance Metrics'**
  String get metricTitle;

  /// No description provided for @totalworkingDays.
  ///
  /// In en, this message translates to:
  /// **'Total Working'**
  String get totalWorkingDays;

  /// No description provided for @totalworkingHours.
  ///
  /// In en, this message translates to:
  /// **'Total Working'**
  String get totalWorkingHours;

  /// No description provided for @totalOvertime.
  ///
  /// In en, this message translates to:
  /// **'Total Overtime'**
  String get totalOvertime;

  /// No description provided for @totalPaidDayOff.
  ///
  /// In en, this message translates to:
  /// **'Total Day Off'**
  String get totalPaidDayOff;

  /// No description provided for @totalUnpaidDayOff.
  ///
  /// In en, this message translates to:
  /// **'Remains Vacation'**
  String get totalUnpaidDayOff;

  /// No description provided for @createDate.
  ///
  /// In en, this message translates to:
  /// **'Create Date'**
  String get createDate;

  /// No description provided for @createdUser.
  ///
  /// In en, this message translates to:
  /// **'Created User'**
  String get createdUser;

  /// No description provided for @requestType.
  ///
  /// In en, this message translates to:
  /// **'Request Type'**
  String get requestType;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @unit.
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// No description provided for @content.
  ///
  /// In en, this message translates to:
  /// **'Content'**
  String get content;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @action.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get action;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'Hours'**
  String get hours;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'Minutes'**
  String get minutes;

  /// No description provided for @newTicket.
  ///
  /// In en, this message translates to:
  /// **'New Ticket'**
  String get newTicket;

  /// No description provided for @recordTitle.
  ///
  /// In en, this message translates to:
  /// **'Request History'**
  String get recordTitle;

  /// No description provided for @attendanceRequest.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendanceRequest;

  /// No description provided for @dayOffRequest.
  ///
  /// In en, this message translates to:
  /// **'Day Off'**
  String get dayOffRequest;

  /// No description provided for @dayOffType.
  ///
  /// In en, this message translates to:
  /// **'Day Off Type'**
  String get dayOffType;

  /// No description provided for @approver.
  ///
  /// In en, this message translates to:
  /// **'Approver'**
  String get approver;

  /// No description provided for @halfDay.
  ///
  /// In en, this message translates to:
  /// **'Half a Day'**
  String get halfDay;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get approve;

  /// No description provided for @approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get approved;

  /// No description provided for @onProgess.
  ///
  /// In en, this message translates to:
  /// **'On Progress'**
  String get onProgess;

  /// No description provided for @dayOffDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Day Off Detail Title'**
  String get dayOffDetailTitle;

  /// No description provided for @noRequestData.
  ///
  /// In en, this message translates to:
  /// **'No Request Data'**
  String get noRequestData;

  /// No description provided for @missingField.
  ///
  /// In en, this message translates to:
  /// **'Missing required fields'**
  String get missingField;

  /// No description provided for @dateConstraintErr.
  ///
  /// In en, this message translates to:
  /// **'Start Date cannot overlap End Date'**
  String get dateConstraintErr;

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

  /// No description provided for @updateTicket.
  ///
  /// In en, this message translates to:
  /// **'Update Request'**
  String get updateTicket;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @confirmLogOut.
  ///
  /// In en, this message translates to:
  /// **'Are you sure to log out？'**
  String get confirmLogOut;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterProcessed.
  ///
  /// In en, this message translates to:
  /// **'Processed'**
  String get filterProcessed;

  /// No description provided for @filterProcessing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get filterProcessing;

  /// No description provided for @filterCancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get filterCancelled;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Are you sure ?'**
  String get warning;

  /// No description provided for @breakInMustBeBeforeBreakOut.
  ///
  /// In en, this message translates to:
  /// **'Break-in time must be before break-out time'**
  String get breakInMustBeBeforeBreakOut;

  /// No description provided for @checkInMustBeforeCheckOut.
  ///
  /// In en, this message translates to:
  /// **'Check-in time must be before check-out time'**
  String get checkInMustBeforeCheckOut;

  /// No description provided for @checkInTimeHasBeenAdjusted.
  ///
  /// In en, this message translates to:
  /// **'Check-in time has been adjusted to 24 hours before check-out time due to exceeding 24 hours'**
  String get checkInTimeHasBeenAdjusted;

  /// No description provided for @checkOutTimeHasBeenAdjusted.
  ///
  /// In en, this message translates to:
  /// **'Check-out time has been adjusted to 24 hours after check-in time due to exceeding 24 hours'**
  String get checkOutTimeHasBeenAdjusted;

  /// No description provided for @reasonInput.
  ///
  /// In en, this message translates to:
  /// **'Please inform reason to accept/reject'**
  String get reasonInput;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'none'**
  String get none;

  /// No description provided for @monthlyAttendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get monthlyAttendance;

  /// No description provided for @month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get month;

  /// No description provided for @week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get week;

  /// No description provided for @doubleWeeks.
  ///
  /// In en, this message translates to:
  /// **'2 Weeks'**
  String get doubleWeeks;

  /// No description provided for @attendanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Monthly Attendance'**
  String get attendanceTitle;

  /// No description provided for @summaryRequestWarning.
  ///
  /// In en, this message translates to:
  /// **'You have not submit for attendance this month!'**
  String get summaryRequestWarning;

  /// No description provided for @holidayNoti.
  ///
  /// In en, this message translates to:
  /// **'Today is holiday。'**
  String get holidayNoti;

  /// No description provided for @rejectReason.
  ///
  /// In en, this message translates to:
  /// **'Reject reason'**
  String get rejectReason;

  /// No description provided for @companyRequestReason.
  ///
  /// In en, this message translates to:
  /// **'Company Work'**
  String get companyRequestReason;

  /// No description provided for @personalRequestReason.
  ///
  /// In en, this message translates to:
  /// **'Personal Work'**
  String get personalRequestReason;

  /// No description provided for @original.
  ///
  /// In en, this message translates to:
  /// **'Original'**
  String get original;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'Data is empty'**
  String get noData;

  /// No description provided for @selectProject.
  ///
  /// In en, this message translates to:
  /// **'Select project'**
  String get selectProject;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @dataNumber.
  ///
  /// In en, this message translates to:
  /// **'Data number'**
  String get dataNumber;

  /// No description provided for @manager.
  ///
  /// In en, this message translates to:
  /// **'Manager'**
  String get manager;

  /// No description provided for @invoiceTitle.
  ///
  /// In en, this message translates to:
  /// **'Invoice Title'**
  String get invoiceTitle;

  /// No description provided for @issueDate.
  ///
  /// In en, this message translates to:
  /// **'Issue Date'**
  String get issueDate;

  /// No description provided for @issuer.
  ///
  /// In en, this message translates to:
  /// **'Issuer'**
  String get issuer;

  /// No description provided for @documentNumber.
  ///
  /// In en, this message translates to:
  /// **'Document Number'**
  String get documentNumber;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @paymentDeadline.
  ///
  /// In en, this message translates to:
  /// **'Payment Deadline'**
  String get paymentDeadline;

  /// No description provided for @mainConstruction.
  ///
  /// In en, this message translates to:
  /// **'Main Construction'**
  String get mainConstruction;

  /// No description provided for @subConstruction.
  ///
  /// In en, this message translates to:
  /// **'Sub Construction'**
  String get subConstruction;

  /// No description provided for @selectValue.
  ///
  /// In en, this message translates to:
  /// **'Select value'**
  String get selectValue;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @item.
  ///
  /// In en, this message translates to:
  /// **'Item'**
  String get item;

  /// No description provided for @provider.
  ///
  /// In en, this message translates to:
  /// **'Provider'**
  String get provider;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @taxRate.
  ///
  /// In en, this message translates to:
  /// **'Tax rate'**
  String get taxRate;

  /// No description provided for @priceBeforeTax.
  ///
  /// In en, this message translates to:
  /// **'Price before tax'**
  String get priceBeforeTax;

  /// No description provided for @priceAfterTax.
  ///
  /// In en, this message translates to:
  /// **'Price after tax'**
  String get priceAfterTax;

  /// No description provided for @projectName.
  ///
  /// In en, this message translates to:
  /// **'Project Name'**
  String get projectName;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @worksiteAttendance.
  ///
  /// In en, this message translates to:
  /// **'Worksite attendance'**
  String get worksiteAttendance;

  /// No description provided for @presigned.
  ///
  /// In en, this message translates to:
  /// **'Presigned'**
  String get presigned;

  /// No description provided for @cost.
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get cost;

  /// No description provided for @attendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendance;

  /// No description provided for @overall.
  ///
  /// In en, this message translates to:
  /// **'Overall'**
  String get overall;

  /// No description provided for @noApproval.
  ///
  /// In en, this message translates to:
  /// **'No approval'**
  String get noApproval;

  /// No description provided for @leaveType.
  ///
  /// In en, this message translates to:
  /// **'Leave Type'**
  String get leaveType;

  /// No description provided for @workingLocation.
  ///
  /// In en, this message translates to:
  /// **'Working Location'**
  String get workingLocation;

  /// No description provided for @editShift.
  ///
  /// In en, this message translates to:
  /// **'Edit Shift'**
  String get editShift;

  /// No description provided for @addNewShift.
  ///
  /// In en, this message translates to:
  /// **'Add New Shift'**
  String get addNewShift;

  /// No description provided for @workContent.
  ///
  /// In en, this message translates to:
  /// **'Work Content Report'**
  String get workContent;

  /// No description provided for @workContentHintText.
  ///
  /// In en, this message translates to:
  /// **'Input work content...'**
  String get workContentHintText;

  /// No description provided for @manDay.
  ///
  /// In en, this message translates to:
  /// **'Man Day'**
  String get manDay;

  /// No description provided for @manHour.
  ///
  /// In en, this message translates to:
  /// **'Man Hour'**
  String get manHour;

  /// No description provided for @ranking.
  ///
  /// In en, this message translates to:
  /// **'Ranking'**
  String get ranking;

  /// No description provided for @selectWorksite.
  ///
  /// In en, this message translates to:
  /// **'Select worksite'**
  String get selectWorksite;

  /// No description provided for @createAttendance.
  ///
  /// In en, this message translates to:
  /// **'Create Attendance'**
  String get createAttendance;

  /// No description provided for @otpSentToEmail.
  ///
  /// In en, this message translates to:
  /// **'OTP has been sent to your email'**
  String get otpSentToEmail;

  /// No description provided for @expireTime.
  ///
  /// In en, this message translates to:
  /// **'Hết hạn'**
  String get expireTime;

  /// No description provided for @invitationList.
  ///
  /// In en, this message translates to:
  /// **'Danh sách lời mời'**
  String get invitationList;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email *'**
  String get emailLabel;

  /// No description provided for @requiredEmail.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get requiredEmail;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email'**
  String get invalidEmail;

  /// No description provided for @loginIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Login ID *'**
  String get loginIdLabel;

  /// No description provided for @requiredLoginId.
  ///
  /// In en, this message translates to:
  /// **'Login ID is required'**
  String get requiredLoginId;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password *'**
  String get passwordLabel;

  /// No description provided for @requiredPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get requiredPassword;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password *'**
  String get confirmPasswordLabel;

  /// No description provided for @requiredConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password is required'**
  String get requiredConfirmPassword;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordMismatch;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name *'**
  String get name;

  /// No description provided for @requiredName.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get requiredName;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @selectBirthday.
  ///
  /// In en, this message translates to:
  /// **'Select Birthday'**
  String get selectBirthday;

  /// No description provided for @birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get birthday;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter OTP *'**
  String get enterOtp;

  /// No description provided for @resendOtpAfterOneMinute.
  ///
  /// In en, this message translates to:
  /// **'Please resend OTP after 1 minute.'**
  String get resendOtpAfterOneMinute;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'SEND OTP'**
  String get sendOtp;

  /// No description provided for @registerSuccess.
  ///
  /// In en, this message translates to:
  /// **'Register successfully!'**
  String get registerSuccess;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @access.
  ///
  /// In en, this message translates to:
  /// **'Access'**
  String get access;

  /// No description provided for @AvailableAppover.
  ///
  /// In en, this message translates to:
  /// **'Available Appover'**
  String get availableAppover;

  /// No description provided for @officeApprover.
  ///
  /// In en, this message translates to:
  /// **'Office Approver'**
  String get officeApprover;

  /// No description provided for @worksiteApprover.
  ///
  /// In en, this message translates to:
  /// **'Worksite Approver'**
  String get worksiteApprover;

  /// No description provided for @alternativeApprover.
  ///
  /// In en, this message translates to:
  /// **'Alternative Approver'**
  String get alternativeApprover;

  /// No description provided for @workOnDayoffRequest.
  ///
  /// In en, this message translates to:
  /// **'Work on dayoff request'**
  String get workOnDayoffRequest;

  /// No description provided for @workOnDayOffRequestDescription.
  ///
  /// In en, this message translates to:
  /// **'Work on day off request'**
  String get workOnDayOffRequestDescription;

  /// No description provided for @lateOrEarlyRequest.
  ///
  /// In en, this message translates to:
  /// **'Late or early request'**
  String get lateOrEarlyRequest;

  /// No description provided for @lateOrEarlyRequestDescription.
  ///
  /// In en, this message translates to:
  /// **'Late or early request'**
  String get lateOrEarlyRequestDescription;

  /// No description provided for @overtimeRequest.
  ///
  /// In en, this message translates to:
  /// **'Overtime request'**
  String get overtimeRequest;

  /// No description provided for @overtimeRequestDescription.
  ///
  /// In en, this message translates to:
  /// **'Overtime request'**
  String get overtimeRequestDescription;

  /// No description provided for @leaveRequest.
  ///
  /// In en, this message translates to:
  /// **'Leave request'**
  String get leaveRequest;

  /// No description provided for @leaveRequestDescription.
  ///
  /// In en, this message translates to:
  /// **'Leave request'**
  String get leaveRequestDescription;

  /// No description provided for @durationType.
  ///
  /// In en, this message translates to:
  /// **'Duration Type'**
  String get durationType;

  /// No description provided for @durationType_AllDay.
  ///
  /// In en, this message translates to:
  /// **'All Day'**
  String get durationTypeAllDay;

  /// No description provided for @durationType_HalfDay.
  ///
  /// In en, this message translates to:
  /// **'Half Day'**
  String get durationTypeHalfDay;

  /// No description provided for @durationType_Customize.
  ///
  /// In en, this message translates to:
  /// **'Customize'**
  String get durationTypeCustomize;

  /// No description provided for @period.
  ///
  /// In en, this message translates to:
  /// **'Period'**
  String get period;

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

  /// No description provided for @requestDescription.
  ///
  /// In en, this message translates to:
  /// **'Request Description'**
  String get requestDescription;

  /// No description provided for @AvailableAppover.
  ///
  /// In en, this message translates to:
  /// **'Monthly attendance request'**
  String get monthlyAttendanceRequest;

  /// No description provided for @event.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event;

  /// No description provided for @viewMethod.
  ///
  /// In en, this message translates to:
  /// **'View Method'**
  String get viewMethod;

  /// No description provided for @viewAllProjects.
  ///
  /// In en, this message translates to:
  /// **'View All Projects'**
  String get viewAllProjects;

  /// No description provided for @viewEachProject.
  ///
  /// In en, this message translates to:
  /// **'View Each Project'**
  String get viewEachProject;

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

  /// No description provided for @paidLeave.
  ///
  /// In en, this message translates to:
  /// **'Paid Leave'**
  String get paidLeave;

  /// No description provided for @unpaidLeave.
  ///
  /// In en, this message translates to:
  /// **'Unpaid Leave'**
  String get unpaidLeave;

  /// No description provided for @compensatoryLeave.
  ///
  /// In en, this message translates to:
  /// **'Compensatory Leave'**
  String get compensatoryLeave;

  /// No description provided for @otherLeave.
  ///
  /// In en, this message translates to:
  /// **'Other Leave'**
  String get otherLeave;
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
