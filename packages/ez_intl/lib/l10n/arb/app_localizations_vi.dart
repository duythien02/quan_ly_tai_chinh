import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

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
  String get cancelRequest => 'Hủy yêu cầu';

  @override
  String get requestDuration => 'Thời gian yêu cầu';

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
  String get register => 'Đăng ký';

  @override
  String get logout => 'Đăng xuất';

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
  String get quickCheckin => 'Check-in 1 chạm';

  @override
  String get checkout => 'Check-out';

  @override
  String get today => 'Today';

  @override
  String get forgetPassword => 'Forget Your Password?';

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
  String get noLog => '情報なし';

  @override
  String get addNote => 'Thêm ghi chú';

  @override
  String get todayLog => 'Hoạt động trong ngày';

  @override
  String get theNextWorkingDay => 'Ngày làm việc tiếp theo';

  @override
  String get alert => 'Thông báo';

  @override
  String get selectProjectFirst => 'Xin hãy lựa chọn dự án trước!';

  @override
  String get project => 'Dự án';

  @override
  String get projectMenu => 'Danh sach du an';

  @override
  String get company => 'Company';

  @override
  String get enterWorkplace => 'Nhập nơi làm việc';

  @override
  String get submit => 'Gui';

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
  String get fixedHour => 'Fixed Hour';

  @override
  String get note => 'Note';

  @override
  String get detail => 'Chi tiết';

  @override
  String get overtime => 'Overtime';

  @override
  String get workload => 'Công số';

  @override
  String get workloadAllocation => 'Phân chia công số';

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
  String get dailyReport => 'Báo cáo ngày';

  @override
  String get worksiteName => 'Worksite Name';

  @override
  String get address => 'Địa chỉ';

  @override
  String get workerName => 'Worker Name';

  @override
  String get workerList => 'Danh sách nhân viên';

  @override
  String get attendanceStatus => 'Attendance Status';

  @override
  String get notCheckIn => 'Chưa Check-in';

  @override
  String get checkedIn => 'Đã Check-in';

  @override
  String get checkinGPS => 'Check-in GPS';

  @override
  String get checkoutGPS => 'Check-out GPS';

  @override
  String get approvalStatus => 'Approval Status';

  @override
  String get requestStatus => 'Request Status';

  @override
  String get requested => 'Đã gửi yêu cầu';

  @override
  String get noRequest => 'Not requested';

  @override
  String get requestList => 'Request List';

  @override
  String get noPermission => 'Bạn không có quyền truy cập';

  @override
  String get noteList => 'Danh sách ghi chú';

  @override
  String get reject => 'Từ chối';

  @override
  String get rejected => 'Đã từ chối';

  @override
  String get pending => 'Đang chờ';

  @override
  String get absent => 'Vắng mặt';

  @override
  String get scheduled => 'Đã đăng ký';

  @override
  String get work => 'Làm việc';

  @override
  String get breakTime => 'Thời gian nghỉ';

  @override
  String get developmentWarning => 'Chức năng này đang phát triển';

  @override
  String get delete => 'Xóa';

  @override
  String get save => 'Lưu';

  @override
  String get back => 'Quay lại';

  @override
  String get reset => 'Khôi phục';

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
  String get totalWorkingDays => 'Total Working';

  @override
  String get totalWorkingHours => 'Total Working';

  @override
  String get totalOvertime => 'Total Overtime';

  @override
  String get totalPaidDayOff => 'Total Day Off';

  @override
  String get totalUnpaidDayOff => 'Remains Vacation';

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
  String get attendanceRequest => 'Attendance Request';

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
  String get cancelButton => 'Hủy bỏ';

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
  String get rejectReason => 'Lý do từ chối';

  @override
  String get companyRequestReason => 'Công việc công ty';

  @override
  String get personalRequestReason => 'Công việc cá nhân';

  @override
  String get original => 'Ban đầu';

  @override
  String get next => 'Kế tiếp';

  @override
  String get noData => 'Không có dữ liệu';

  @override
  String get selectProject => 'Chọn dự án';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get dataNumber => 'Số dữ liệu';

  @override
  String get manager => 'Người quản lý';

  @override
  String get invoiceTitle => 'Tiêu đề hóa đơn';

  @override
  String get issueDate => 'Ngày phát hành';

  @override
  String get issuer => 'Người phát hành';

  @override
  String get documentNumber => 'Số tài liệu';

  @override
  String get paymentMethod => 'Phương thức thanh toán';

  @override
  String get paymentDeadline => 'Hạn thanh toán';

  @override
  String get mainConstruction => 'Công trình chính';

  @override
  String get subConstruction => 'Công trình phụ';

  @override
  String get selectValue => 'Chọn giá trị';

  @override
  String get no => 'STT';

  @override
  String get category => 'Danh mục';

  @override
  String get item => 'Mục';

  @override
  String get provider => 'Nhà cung cấp';

  @override
  String get payment => 'Thanh toán';

  @override
  String get price => 'Giá';

  @override
  String get taxRate => 'Thuế suất';

  @override
  String get priceBeforeTax => 'Giá trước thuế';

  @override
  String get priceAfterTax => 'Giá sau thuế';

  @override
  String get projectName => 'Tên dự án';

  @override
  String get code => 'Mã';

  @override
  String get worksiteAttendance => 'Chấm công tại công trường';

  @override
  String get presigned => 'Ký trước';

  @override
  String get cost => 'Chi phí';

  @override
  String get attendance => 'Chấm công';

  @override
  String get overall => 'Tổng cộng';

  @override
  String get noApproval => 'Chưa phê duyệt';

  @override
  String get leaveType => 'Loại nghỉ phép';

  @override
  String get workingLocation => 'Vị trí làm việc';

  @override
  String get editShift => 'Chỉnh sửa ca làm';

  @override
  String get addNewShift => 'Thêm ca làm';

  @override
  String get workContent => 'Nội dung công việc';

  @override
  String get workContentHintText => 'Nhập nội dung công việc...';

  @override
  String get manDay => 'Ngày công';

  @override
  String get manHour => 'Giờ công';

  @override
  String get ranking => 'Bậc thợ';

  @override
  String get selectWorksite => 'Chọn công trường';

  @override
  String get createAttendance => 'Tạo chấm công';

  @override
  String get otpSentToEmail => 'OTP đã được gửi đến email của bạn';

  @override
  String get expireTime => 'Hết hạn';

  @override
  String get invitationList => 'Danh sách lời mời';

  @override
  String get emailLabel => 'Email *';

  @override
  String get requiredEmail => 'Email là bắt buộc';

  @override
  String get invalidEmail => 'Vui lòng nhập địa chỉ email hợp lệ';

  @override
  String get loginIdLabel => 'ID đăng nhập *';

  @override
  String get requiredLoginId => 'ID đăng nhập là bắt buộc';

  @override
  String get passwordLabel => 'Mật khẩu *';

  @override
  String get requiredPassword => 'Mật khẩu là bắt buộc';

  @override
  String get confirmPasswordLabel => 'Xác nhận mật khẩu *';

  @override
  String get requiredConfirmPassword => 'Xác nhận mật khẩu là bắt buộc';

  @override
  String get passwordMismatch => 'Mật khẩu không khớp';

  @override
  String get name => 'Tên *';

  @override
  String get requiredName => 'Tên là bắt buộc';

  @override
  String get phone => 'Số điện thoại';

  @override
  String get gender => 'Giới tính';

  @override
  String get male => 'Nam';

  @override
  String get female => 'Nữ';

  @override
  String get other => 'Khác';

  @override
  String get selectBirthday => 'Chọn ngày sinh';

  @override
  String get birthday => 'Ngày sinh';

  @override
  String get enterOtp => 'Nhập OTP *';

  @override
  String get resendOtpAfterOneMinute => 'Vui lòng gửi lại OTP sau 1 phút.';

  @override
  String get sendOtp => 'Gửi OTP';

  @override
  String get registerSuccess => 'Đăng ký thành công!';

  @override
  String get welcome => 'Xin chào';

  @override
  String get access => 'Truy cập';

  @override
  String get availableAppover => 'Người phê duyệt';

  @override
  String get officeApprover => 'Người phê duyệt văn phòng';

  @override
  String get worksiteApprover => 'Người phê duyệt công trường';

  @override
  String get alternativeApprover => 'Người phê duyệt thay thế';

  @override
  String get workOnDayoffRequest => 'Làm việc trong ngày nghỉ';

  @override
  String get workOnDayOffRequestDescription =>
      'Sử dụng khi cần làm việc trong ngày nghỉ';

  @override
  String get lateOrEarlyRequest => 'Đi muộn/Về sớm';

  @override
  String get lateOrEarlyRequestDescription =>
      'Sử dụng khi cần đi muộn hoặc về sớm';

  @override
  String get overtimeRequest => 'Làm thêm giờ';

  @override
  String get overtimeRequestDescription => 'Sử dụng khi cần làm thêm giờ';

  @override
  String get leaveRequest => 'Nghỉ phép làm việc';

  @override
  String get leaveRequestDescription => 'Sử dụng khi cần nghỉ phép';

  @override
  String get durationType => 'Lựa chọn thời gian';

  @override
  String get durationTypeAllDay => 'Cả ngày';

  @override
  String get durationTypeHalfDay => 'Nửa ngày';

  @override
  String get durationTypeCustomize => 'Tùy chỉnh';

  @override
  String get period => 'Khoảng thời gian';

  @override
  String get morning => 'Buổi sáng';

  @override
  String get afternoon => 'Buổi chiều';

  @override
  String get requestDescription => 'Ghi chú';

  @override
  String get monthlyAttendanceRequest => 'Yêu cầu chấm công tháng';

  @override
  String get event => 'Sự kiện';

  @override
  String get viewMethod => 'Phương thức xem';

  @override
  String get viewAllProjects => 'Xem tất cả dự án';

  @override
  String get viewEachProject => 'Xem từng dự án';

  @override
  String get enterTime => 'Nhập thời gian';

  @override
  String get selectTime => 'Chọn thời gian';

  @override
  String get switchToDragMode => 'Chuyển sang chế độ kéo';

  @override
  String get switchToWheelMode => 'Chuyển sang chế độ quay';

  @override
  String get switchToInputMode => 'Chuyển sang chế độ nhập';

  @override
  String get paidLeave => 'Nghỉ phép có hưởng lương';

  @override
  String get unpaidLeave => 'Nghỉ phép không hưởng lương';

  @override
  String get compensatoryLeave => 'Nghỉ phép bù';

  @override
  String get otherLeave => 'Nghỉ phép khác';
}
