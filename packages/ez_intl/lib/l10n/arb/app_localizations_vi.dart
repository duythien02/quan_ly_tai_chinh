import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'TDTFinance';

  @override
  String get unknown => 'Đã xảy ra lỗi, vui lòng thử lại sau';

  @override
  String get connectionErrorPleaseRefresh =>
      'Lỗi kết nối mạng, vui lòng kiểm tra lại kết nối internet và thử lại';

  @override
  String get refresh => 'Làm mới';

  @override
  String get accept => 'Đồng ý';

  @override
  String get cancel => 'Hủy';

  @override
  String get cancelRequest => 'Hủy yêu cầu';

  @override
  String get requestDuration => 'Thời gian yêu cầu';

  @override
  String get close => 'Đóng';

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
  String get notification => 'Thông báo';

  @override
  String get openSettings => 'Mở cài đặt';

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
    return 'TDTFinance dùng quyền truy cập $permission để phục vụ cho hoạt động như ';
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
  String get login => 'Đăng nhập';

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
  String get hintTextUser => 'Nhập tên tài khoản của bạn';

  @override
  String get hintTextPassword => 'Nhập mật khẩu của bạn';

  @override
  String get today => 'Hôm nay';

  @override
  String get forgetPassword => 'Quên mật khẩu?';

  @override
  String get passwordRecoveryTitle => 'Khôi phục mật khẩu';

  @override
  String get passwordRecoveryGuide =>
      'Vui lòng nhập tên tài khoản hoặc địa chỉ email của bạn. Một email có chứa liên kết khôi phục sẽ được gửi đến địa chỉ email đã đăng ký của bạn. Vui lòng làm theo hướng dẫn trong email.';

  @override
  String get recoveryInputText =>
      'Vui lòng nhập tên tài khoản hoặc địa chỉ email của bạn';

  @override
  String get submitButton => 'Xác nhận';

  @override
  String get sort => 'Sắp xếp';

  @override
  String get home => 'Trang chủ';

  @override
  String get enterTime => 'Nhập thời gian';

  @override
  String get selectTime => 'Chọn thời gian';

  @override
  String get okButton => 'OK';

  @override
  String get cancelButton => 'Hủy';

  @override
  String get switchToDragMode => 'Chuyển sang chế độ kéo';

  @override
  String get switchToWheelMode => 'Chuyển sang chế độ quay';

  @override
  String get switchToInputMode => 'Chuyển sang chế độ nhập';

  @override
  String get morning => 'Sáng';

  @override
  String get afternoon => 'Chiều';

  @override
  String get next => 'Kế tiếp';

  @override
  String get createAccount => 'Tạo tài khoản';

  @override
  String get createTheFirstAccount => 'Tạo tài khoản đầu tiên của bạn!';

  @override
  String get currencyType => 'Loại tiền tệ';

  @override
  String get accountName => 'Tên tài khoản';

  @override
  String get initialBalance => 'Số dư ban đầu';

  @override
  String get dontHaveAnAccount => 'Không có tài khoản? Đăng ký';

  @override
  String get alreadyHaveAnAccount => 'Đã có tài khoản? Đăng nhập';

  @override
  String get hintTextEmail => 'Nhập địa chỉ email của bạn';

  @override
  String get profile => 'Hồ sơ';

  @override
  String get hello => 'Xin chào';
}
