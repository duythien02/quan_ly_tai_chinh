import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Kantoku';

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
  String get connectionError =>
      'Không có kết nối internet, vui lòng kiểm tra lại';

  @override
  String get onTheNextScreen => 'ở màn hình tiếp theo để:';

  @override
  String get requestStoragePermission => 'Cho phép truy cập tệp tin';

  @override
  String get storageRequest1 => 'Lưu trữ tệp tải về';

  @override
  String get changeSettingsLater =>
      'Bạn có thể thay đổi quyền này sau ở trong mục Cài đặt của ứng dụng';

  @override
  String get continuous => 'Tiếp tục';

  @override
  String get requestPermissionLibrary => 'Cho phép truy cập thư viện ảnh';

  @override
  String get photoRequest1 => 'Cập nhật ảnh thông tin cá nhân';

  @override
  String get requestPermissionCamera => 'Cho phép truy cập camera';

  @override
  String get cameraRequest1 => 'Chụp hình cập nhật thông tin cá nhân';

  @override
  String get cameraRequest2 => 'Quét mã code dễ dàng';

  @override
  String get microPermissionRequest => 'Cho phép ghi âm thiết bị';

  @override
  String get microRequest1 => 'Gọi âm thanh';

  @override
  String get microRequest2 => 'Gửi ghi âm hỗ trợ';

  @override
  String get emptyContent => 'Chưa có nội dung';

  @override
  String get notification => 'Alert';

  @override
  String get openSettings => 'Open settings';

  @override
  String get notNow => 'Lúc khác';

  @override
  String get camera => 'Máy ảnh';

  @override
  String settingTitle(String permission) {
    return 'Bật quyền truy cập $permission trong phần cài đặt thiết bị';
  }

  @override
  String settingMessage(String permission) {
    return 'Ngọc Dung dùng quyền truy cập $permission để phục vụ cho hoạt động như ';
  }

  @override
  String get photoLibrary => 'Thư viện ảnh';

  @override
  String get micro => 'Micro';

  @override
  String get location => 'Vị trí';

  @override
  String get file => 'Tệp tin';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get logout => 'Logout';

  @override
  String get image => 'Hình ảnh';

  @override
  String get takePicture => 'Chụp hình';

  @override
  String get viewMore => 'Xem thêm';

  @override
  String get collapse => 'Thu gọn';

  @override
  String get downloadComplete => 'Tải xuống hoàn tất';

  @override
  String get open => 'Mở';

  @override
  String get getImageInCamera => 'Chụp ảnh mới';

  @override
  String get getImageInGallery => 'Chọn ảnh có sẵn';

  @override
  String get hintTextUser => 'Enter your ID Login';

  @override
  String get hintTextPassword => 'Enter your password';

  @override
  String get hintTextOrgCode => 'Enter organization code';

  @override
  String get startBreak => 'Break-in';

  @override
  String get endBreak => 'Break-out';

  @override
  String get checkin => 'Check-in';

  @override
  String get quickCheckin => 'Quick check-in';

  @override
  String get checkout => 'Check-out';

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
  String get attendanceRecord => 'Attendance record';

  @override
  String get worksiteList => 'Worksite List';

  @override
  String get currentProject => 'Current project';

  @override
  String get otherProject => 'Other project';

  @override
  String get noLog => 'No log';

  @override
  String get addNote => 'Add note';

  @override
  String get todayLog => 'Activity of today';

  @override
  String get theNextWorkingDay => 'The next working day';

  @override
  String get alert => 'Alert';

  @override
  String get selectProjectFirst => 'Please select project first';

  @override
  String get project => 'Project';

  @override
  String get projectMenu => 'Project menu';

  @override
  String get company => 'Company';

  @override
  String get enterWorkplace => 'Enter workplace';

  @override
  String get submit => 'Submit';

  @override
  String get remote => 'remote';

  @override
  String get officeList => 'Office List';

  @override
  String get projectList => 'Project List';

  @override
  String get workLocation => 'Work location';

  @override
  String get requiredProjectOrOffice => 'Please select office or project first';

  @override
  String get requiredCheckin => 'Please check-in first';

  @override
  String get requiredCheckout => 'Please check-out first';

  @override
  String get requiredBreakIn => 'Please break-in first';

  @override
  String get requiredBreakOut => 'Please break-out first';

  @override
  String get requiredLocationService =>
      'Location services are disabled, would you like to enable them?';

  @override
  String get checkInSuccess => 'Check-in success';

  @override
  String get success => 'success';

  @override
  String get gpsIn => 'GPS in';

  @override
  String get gpsOut => 'GPS out';

  @override
  String get fixedHour => 'Worked Time';

  @override
  String get note => 'Note';

  @override
  String get detail => 'Detail';

  @override
  String get overtime => 'Overtime';

  @override
  String get workload => 'Workload';

  @override
  String get workloadAllocation => 'Workload Allocation';

  @override
  String get worktime => 'Worktime';

  @override
  String get checkInTime => 'Check-in Time';

  @override
  String get requestDailyAttendance => 'Send Note';

  @override
  String get requestApproval => 'Request Approval';

  @override
  String get logHours => 'Log Hours';

  @override
  String get managerLogHours => 'Dashboard';

  @override
  String get worksiteManager => 'Worksite Manager';

  @override
  String get request => 'Request';

  @override
  String get account => 'Account';

  @override
  String get selectOrg => 'Select organization';

  @override
  String get date => 'Date';

  @override
  String get worksite => 'Worksite';

  @override
  String get dayTimeApproval => 'Approval';

  @override
  String get dailyReport => 'Daily Report';

  @override
  String get worksiteName => 'Worksite Name';

  @override
  String get address => 'Address';

  @override
  String get workerName => 'Worker Name';

  @override
  String get workerList => 'Worker List';

  @override
  String get attendanceStatus => 'Attendance Status';

  @override
  String get notCheckIn => 'Not Check-in';

  @override
  String get checkedIn => 'Checked-in';

  @override
  String get checkinGPS => 'Check-in GPS';

  @override
  String get checkoutGPS => 'Check-out GPS';

  @override
  String get approvalStatus => 'Approval Status';

  @override
  String get requestStatus => 'Request Status';

  @override
  String get requested => 'Requested';

  @override
  String get noRequest => 'Not requested';

  @override
  String get requestList => 'Request List';

  @override
  String get noPermission => 'You don\'t have permission to access';

  @override
  String get noteList => 'Note list';

  @override
  String get reject => 'Reject';

  @override
  String get rejected => 'Rejected';

  @override
  String get pending => 'Pending';

  @override
  String get absent => 'Absent';

  @override
  String get scheduled => 'Scheduled';

  @override
  String get work => 'Work';

  @override
  String get breakTime => 'Break Time';

  @override
  String get developmentWarning => 'This feature is under development';

  @override
  String get delete => 'Delete';

  @override
  String get save => 'Save';

  @override
  String get back => 'Back';

  @override
  String get reset => 'Reset';

  @override
  String get changePassword => 'Change password';

  @override
  String get currentPass => 'Current password';

  @override
  String get newPassword => 'New password';

  @override
  String get confirmPass => 'Confirm password';

  @override
  String get pleaseEnterAllFields => 'Please fill out all fields to proceed';

  @override
  String get confirmPassIncorrect =>
      'Password and Confirm Password does not match';

  @override
  String get invalidPassword =>
      'Password is invalid. Password must contain both upper and lowercase letter and include number';

  @override
  String get changePasswordSuccess => 'Your password was successfully changed';

  @override
  String get msgChangePass => 'Please update your password';

  @override
  String get offlineModeAlert => 'You are in offline mode';

  @override
  String get locationNotFound => 'Location not found';

  @override
  String get quitAccountAlert => 'Are you sure you want to quit this account ?';

  @override
  String get loginWithBiometric => 'Login with your biometric';

  @override
  String get from => 'From';

  @override
  String get to => 'To';

  @override
  String get sendNote => 'Send note';

  @override
  String get thisWeek => 'This week';

  @override
  String get lastWeek => 'Last week';

  @override
  String get thisMonth => 'This month';

  @override
  String get lastMonth => 'Last month';

  @override
  String get custom => 'Custom';

  @override
  String get edit => 'Edit';

  @override
  String get paid => 'Paid';

  @override
  String get unpaid => 'Unpaid';

  @override
  String get dayOff => 'Day Off';

  @override
  String get backToWork => 'Back To Work';

  @override
  String get changeShift => 'changeShift';

  @override
  String get metricTitle => 'Monthly Attendance Metrics';

  @override
  String get totalWorkingDays => 'Working Days';

  @override
  String get totalWorkingHours => 'Working Hours';

  @override
  String get totalOvertime => 'Overtime';

  @override
  String get totalPaidDayOff => 'Paid Day Off';

  @override
  String get totalUnpaidDayOff => 'Unpaid Day Off';

  @override
  String get createDate => 'Create Date';

  @override
  String get createdUser => 'Created User';

  @override
  String get requestType => 'Request Type';

  @override
  String get quantity => 'Quantity';

  @override
  String get unit => 'Unit';

  @override
  String get content => 'Content';

  @override
  String get status => 'Status';

  @override
  String get action => 'Action';

  @override
  String get days => 'Days';

  @override
  String get hours => 'Hours';

  @override
  String get minutes => 'Minutes';

  @override
  String get newTicket => 'New Ticket';

  @override
  String get recordTitle => 'Request History';

  @override
  String get attendanceRequest => 'Attendance';

  @override
  String get dayOffRequest => 'Day Off';

  @override
  String get dayOffType => 'Day Off Type';

  @override
  String get approver => 'Approver';

  @override
  String get halfDay => 'Half a Day';

  @override
  String get create => 'Create';

  @override
  String get view => 'View';

  @override
  String get approve => 'Approve';

  @override
  String get approved => 'Approved';

  @override
  String get onProgess => 'On Progress';

  @override
  String get dayOffDetailTitle => 'Day Off Detail Title';

  @override
  String get noRequestData => 'No Request Data';

  @override
  String get missingField => 'Missing required fields';

  @override
  String get dateConstraintErr => 'Start Date cannot overlap End Date';

  @override
  String get okButton => 'OK';

  @override
  String get cancelButton => 'Cancel';

  @override
  String get updateTicket => 'Update Request';

  @override
  String get language => 'Language';

  @override
  String get confirmLogOut => 'Are you sure to log out？';

  @override
  String get filterAll => 'All';

  @override
  String get filterProcessed => 'Processed';

  @override
  String get filterProcessing => 'Processing';

  @override
  String get filterCancelled => 'Cancelled';

  @override
  String get warning => 'Are you sure ?';

  @override
  String get breakInMustBeBeforeBreakOut =>
      'Break-in time must be before break-out time';

  @override
  String get checkInMustBeforeCheckOut =>
      'Check-in time must be before check-out time';

  @override
  String get checkInTimeHasBeenAdjusted =>
      'Check-in time has been adjusted to 24 hours before check-out time due to exceeding 24 hours';

  @override
  String get checkOutTimeHasBeenAdjusted =>
      'Check-out time has been adjusted to 24 hours after check-in time due to exceeding 24 hours';

  @override
  String get reasonInput => 'Please inform reason to accept/reject';

  @override
  String get none => 'none';

  @override
  String get monthlyAttendance => 'Attendance';

  @override
  String get month => 'Month';

  @override
  String get week => 'Week';

  @override
  String get doubleWeeks => '2 Weeks';

  @override
  String get attendanceTitle => 'Monthly Attendance';

  @override
  String get summaryRequestWarning =>
      'You have not submit for attendance this month!';

  @override
  String get holidayNoti => 'Today is holiday。';

  @override
  String get rejectReason => 'Reject reason';

  @override
  String get companyRequestReason => 'Company Work';

  @override
  String get personalRequestReason => 'Personal Work';

  @override
  String get original => 'Original';

  @override
  String get next => 'Next';

  @override
  String get noData => 'Data is empty';

  @override
  String get selectProject => 'Select project';

  @override
  String get search => 'Search';

  @override
  String get dataNumber => 'Data number';

  @override
  String get manager => 'Manager';

  @override
  String get invoiceTitle => 'Invoice Title';

  @override
  String get issueDate => 'Issue Date';

  @override
  String get issuer => 'Issuer';

  @override
  String get documentNumber => 'Document Number';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get paymentDeadline => 'Payment Deadline';

  @override
  String get mainConstruction => 'Main Construction';

  @override
  String get subConstruction => 'Sub Construction';

  @override
  String get selectValue => 'Select value';

  @override
  String get no => 'No';

  @override
  String get category => 'Category';

  @override
  String get item => 'Item';

  @override
  String get provider => 'Provider';

  @override
  String get payment => 'Payment';

  @override
  String get price => 'Price';

  @override
  String get taxRate => 'Tax rate';

  @override
  String get priceBeforeTax => 'Price before tax';

  @override
  String get priceAfterTax => 'Price after tax';

  @override
  String get projectName => 'Project Name';

  @override
  String get code => 'Code';

  @override
  String get worksiteAttendance => 'Worksite attendance';

  @override
  String get presigned => 'Presigned';

  @override
  String get cost => 'Cost';

  @override
  String get attendance => 'Attendance';

  @override
  String get overall => 'Overall';

  @override
  String get noApproval => 'No approval';

  @override
  String get leaveType => 'Leave Type';

  @override
  String get workingLocation => 'Working Location';

  @override
  String get editShift => 'Edit Shift';

  @override
  String get addNewShift => 'Add New Shift';

  @override
  String get workContent => 'Work Content Report';

  @override
  String get workContentHintText => 'Input work content...';

  @override
  String get manDay => 'Man Day';

  @override
  String get manHour => 'Man Hour';

  @override
  String get ranking => 'Ranking';

  @override
  String get selectWorksite => 'Select worksite';

  @override
  String get createAttendance => 'Create Attendance';

  @override
  String get otpSentToEmail => 'OTP has been sent to your email';

  @override
  String get expireTime => 'Hết hạn';

  @override
  String get invitationList => 'Danh sách lời mời';

  @override
  String get emailLabel => 'Email *';

  @override
  String get requiredEmail => 'Email is required';

  @override
  String get invalidEmail => 'Enter a valid email';

  @override
  String get loginIdLabel => 'Login ID *';

  @override
  String get requiredLoginId => 'Login ID is required';

  @override
  String get passwordLabel => 'Password *';

  @override
  String get requiredPassword => 'Password is required';

  @override
  String get confirmPasswordLabel => 'Confirm Password *';

  @override
  String get requiredConfirmPassword => 'Confirm Password is required';

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get name => 'Name *';

  @override
  String get requiredName => 'Name is required';

  @override
  String get phone => 'Phone';

  @override
  String get gender => 'Gender';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get other => 'Other';

  @override
  String get selectBirthday => 'Select Birthday';

  @override
  String get birthday => 'Birthday';

  @override
  String get enterOtp => 'Enter OTP *';

  @override
  String get resendOtpAfterOneMinute => 'Please resend OTP after 1 minute.';

  @override
  String get sendOtp => 'SEND OTP';

  @override
  String get registerSuccess => 'Register successfully!';

  @override
  String get welcome => 'Welcome';

  @override
  String get access => 'Access';

  @override
  String get availableAppover => 'Available Approver';

  @override
  String get officeApprover => 'Office Approver';

  @override
  String get worksiteApprover => 'Worksite Approver';

  @override
  String get alternativeApprover => 'Alternative Approver';

  @override
  String get workOnDayoffRequest => 'Work on dayoff request';

  @override
  String get workOnDayOffRequestDescription =>
      'Use this request to work on dayoff';

  @override
  String get lateOrEarlyRequest => 'Late or early request';

  @override
  String get lateOrEarlyRequestDescription =>
      'Use this request to be late or early';

  @override
  String get overtimeRequest => 'Overtime request';

  @override
  String get overtimeRequestDescription => 'Use this request to work overtime';

  @override
  String get leaveRequest => 'Leave request';

  @override
  String get leaveRequestDescription => 'Use this request to take leave';

  @override
  String get durationType => 'Request duration selection';

  @override
  String get durationTypeAllDay => 'All Day';

  @override
  String get durationTypeHalfDay => 'Half Day';

  @override
  String get durationTypeCustomize => 'Customize';

  @override
  String get period => 'Period';

  @override
  String get morning => 'Morning';

  @override
  String get afternoon => 'Afternoon';

  @override
  String get requestDescription => 'Request Description';

  @override
  String get monthlyAttendanceRequest => 'Monthly attendance request';

  @override
  String get event => 'Event';

  @override
  String get viewMethod => 'View Method';

  @override
  String get viewAllProjects => 'View All Projects';

  @override
  String get viewEachProject => 'View Each Project';

  @override
  String get enterTime => 'Enter Time';

  @override
  String get selectTime => 'Select Time';

  @override
  String get switchToDragMode => 'Switch to Drag Mode';

  @override
  String get switchToWheelMode => 'Switch to Wheel Mode';

  @override
  String get switchToInputMode => 'Switch to Input Mode';

  @override
  String get paidLeave => 'Paid Leave';

  @override
  String get unpaidLeave => 'Unpaid Leave';

  @override
  String get compensatoryLeave => 'Compensatory Leave';

  @override
  String get otherLeave => 'Other Leave';
}
