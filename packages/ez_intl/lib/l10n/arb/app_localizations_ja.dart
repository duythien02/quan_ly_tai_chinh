import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'Kantoku';

  @override
  String get unknown => 'エラーが発生しました。後でもう一度お試しください';

  @override
  String get connectionErrorPleaseRefresh =>
      'ネットワーク接続エラーが発生しました。インターネット接続を確認して、もう一度お試しください';

  @override
  String get refresh => '更新';

  @override
  String get accept => '同意する';

  @override
  String get cancel => '取消';

  @override
  String get cancelRequest => '取下げ';

  @override
  String get requestDuration => '申請時間';

  @override
  String get close => '閉じる';

  @override
  String get connectionError => 'インターネットに接続されていません。接続を確認してください';

  @override
  String get onTheNextScreen => '次の画面で:';

  @override
  String get requestStoragePermission => 'ファイルアクセスを許可する';

  @override
  String get storageRequest1 => 'ダウンロードファイルの保存';

  @override
  String get changeSettingsLater => 'この許可を後でアプリ設定から変更できます';

  @override
  String get continuous => '継続';

  @override
  String get requestPermissionLibrary => '写真ライブラリにアクセスを許可する';

  @override
  String get photoRequest1 => '個人情報の写真を更新する';

  @override
  String get requestPermissionCamera => 'カメラにアクセスを許可する';

  @override
  String get cameraRequest1 => '個人情報を更新するための写真を撮影する';

  @override
  String get cameraRequest2 => '簡単にQRコードをスキャンする';

  @override
  String get microPermissionRequest => 'デバイスの音声録音を許可する';

  @override
  String get microRequest1 => '音声通話を行う';

  @override
  String get microRequest2 => 'サポートの音声メッセージを送信する';

  @override
  String get emptyContent => 'コンテンツがありません';

  @override
  String get notification => '通知';

  @override
  String get openSettings => '設定を開く';

  @override
  String get notNow => '後で';

  @override
  String get camera => 'カメラ';

  @override
  String settingTitle(String permission) {
    return 'デバイス設定で $permission へのアクセスを許可する';
  }

  @override
  String settingMessage(String permission) {
    return 'Ngọc Dung は $permission アクセス権限を使用して、以下の操作を行います ';
  }

  @override
  String get photoLibrary => '写真ライブラリ';

  @override
  String get micro => 'マイクロ';

  @override
  String get location => '場所';

  @override
  String get file => 'ファイル';

  @override
  String get login => 'ログイン';

  @override
  String get register => '登録';

  @override
  String get logout => 'ログアウト';

  @override
  String get image => '画像';

  @override
  String get takePicture => '写真を撮る';

  @override
  String get viewMore => 'もっと見る';

  @override
  String get collapse => '折りたたむ';

  @override
  String get downloadComplete => 'ダウンロード完了';

  @override
  String get open => '開く';

  @override
  String get getImageInCamera => '新しい写真を撮る';

  @override
  String get getImageInGallery => '利用可能な写真を選択';

  @override
  String get hintTextUser => 'ID ログインを入力してください';

  @override
  String get hintTextPassword => 'パスワードを入力してください';

  @override
  String get hintTextOrgCode => '組織コードを入力してください';

  @override
  String get startBreak => '休憩開始';

  @override
  String get endBreak => '休憩終了';

  @override
  String get checkin => '作業開始';

  @override
  String get quickCheckin => 'タッチ打刻';

  @override
  String get checkout => '作業終了';

  @override
  String get today => '今日';

  @override
  String get forgetPassword => 'パスワードを忘れた方';

  @override
  String get passwordRecoveryTitle => 'パスワードを復元申請';

  @override
  String get passwordRecoveryGuide =>
      'ユーザーIDまたはメールアドレスを入力してください。 復元リンクを含むメールが、登録されたメール アドレスに送信させていただきます。 メールの指示にお従うください。';

  @override
  String get recoveryInputText => 'ユーザーID・メールを入力してください';

  @override
  String get submitButton => '提出';

  @override
  String get sort => '並べ替え';

  @override
  String get attendanceRecord => '勤怠記録';

  @override
  String get worksiteList => '場所一覧';

  @override
  String get currentProject => '担当のプロジェクト';

  @override
  String get otherProject => '他のプロジェクト';

  @override
  String get noLog => '情報なし';

  @override
  String get addNote => 'メモを追加';

  @override
  String get todayLog => '今日の活動';

  @override
  String get theNextWorkingDay => '次の作業日';

  @override
  String get alert => 'アラート';

  @override
  String get selectProjectFirst => '工事を先に選択してください';

  @override
  String get project => 'プロジェクト';

  @override
  String get projectMenu => 'プロジェクトメニュ';

  @override
  String get company => '本社';

  @override
  String get enterWorkplace => '場所入力';

  @override
  String get submit => '提出';

  @override
  String get remote => 'リモート';

  @override
  String get officeList => '事務所一覧';

  @override
  String get projectList => '事業一覧';

  @override
  String get workLocation => '勤務地';

  @override
  String get requiredProjectOrOffice => '事務所または現場を先に選択してください';

  @override
  String get requiredCheckin => '最初にチェックインしてください';

  @override
  String get requiredCheckout => '最初にチェックアウトしてください';

  @override
  String get requiredBreakIn => '最初に休憩を開始してください';

  @override
  String get requiredBreakOut => '最初に休憩を終了してください';

  @override
  String get requiredLocationService => '位置サービスが無効になっています。有効にしますか？';

  @override
  String get checkInSuccess => 'チェックイン成功';

  @override
  String get success => '成功';

  @override
  String get gpsIn => 'GPS';

  @override
  String get gpsOut => 'GPS';

  @override
  String get fixedHour => '出勤';

  @override
  String get note => '備考';

  @override
  String get detail => '詳細';

  @override
  String get overtime => '残業';

  @override
  String get workload => '工数';

  @override
  String get workloadAllocation => '工数分配';

  @override
  String get worktime => '出勤';

  @override
  String get checkInTime => '打刻';

  @override
  String get requestDailyAttendance => '更新メモ';

  @override
  String get requestApproval => '勤怠承認申請';

  @override
  String get logHours => '打刻';

  @override
  String get managerLogHours => '打刻承認';

  @override
  String get worksiteManager => '現場管理';

  @override
  String get request => '申請管理';

  @override
  String get account => '設定';

  @override
  String get selectOrg => '組織を選択';

  @override
  String get date => '日付';

  @override
  String get worksite => '現場';

  @override
  String get dayTimeApproval => '状態';

  @override
  String get dailyReport => '日報';

  @override
  String get worksiteName => '現場名';

  @override
  String get address => '住所';

  @override
  String get workerName => '社員名';

  @override
  String get workerList => '出勤一覧';

  @override
  String get attendanceStatus => '出勤状態';

  @override
  String get notCheckIn => '未打刻';

  @override
  String get checkedIn => '打刻済み';

  @override
  String get checkinGPS => '作業開始位置情報';

  @override
  String get checkoutGPS => '作業終了位置情報';

  @override
  String get approvalStatus => '承認状態';

  @override
  String get requestStatus => '申請状態';

  @override
  String get requested => '申請済み';

  @override
  String get noRequest => '未申請';

  @override
  String get requestList => '申請一覧';

  @override
  String get noPermission => 'アクセス権がありません';

  @override
  String get noteList => 'メモリスト';

  @override
  String get reject => '拒否';

  @override
  String get rejected => '拒否済み';

  @override
  String get pending => '承認待ち';

  @override
  String get absent => '未出勤';

  @override
  String get scheduled => '予定有り';

  @override
  String get work => '出勤';

  @override
  String get breakTime => '休憩';

  @override
  String get developmentWarning => 'この機能は開発中です';

  @override
  String get delete => '削除';

  @override
  String get save => '保存';

  @override
  String get back => '戻る';

  @override
  String get reset => '復元';

  @override
  String get changePassword => 'パスワードを変更';

  @override
  String get currentPass => '現在のパスワード';

  @override
  String get newPassword => '新しいパスワード';

  @override
  String get confirmPass => 'パスワードの確認';

  @override
  String get pleaseEnterAllFields => 'すべての項目を入力してください';

  @override
  String get confirmPassIncorrect => 'パスワードと確認パスワードが一致しません';

  @override
  String get invalidPassword => 'パスワードが無効です。パスワードには大文字、小文字、数字が含まれている必要があります';

  @override
  String get changePasswordSuccess => 'パスワードが正常に変更されました';

  @override
  String get msgChangePass => 'パスワードを更新してください';

  @override
  String get offlineModeAlert => 'オフラインモードです';

  @override
  String get locationNotFound => '位置情報が取得できませんでした';

  @override
  String get quitAccountAlert => 'このアカウントを終了しますか？';

  @override
  String get loginWithBiometric => '生体認証でログイン';

  @override
  String get from => '開始';

  @override
  String get to => '終了';

  @override
  String get sendNote => '更新備考';

  @override
  String get thisWeek => '今週';

  @override
  String get lastWeek => '先週';

  @override
  String get thisMonth => '今月';

  @override
  String get lastMonth => '先月';

  @override
  String get custom => '選択';

  @override
  String get edit => '編集';

  @override
  String get paid => '有休';

  @override
  String get unpaid => '無休';

  @override
  String get dayOff => '休日';

  @override
  String get backToWork => '出勤';

  @override
  String get changeShift => 'シフト変える';

  @override
  String get metricTitle => '月次勤怠指標';

  @override
  String get totalWorkingDays => '出勤日数';

  @override
  String get totalWorkingHours => '出勤時数';

  @override
  String get totalOvertime => '残業時数';

  @override
  String get totalPaidDayOff => '休暇日数';

  @override
  String get totalUnpaidDayOff => '代休日数';

  @override
  String get createDate => '作成日';

  @override
  String get createdUser => '作成者';

  @override
  String get requestType => '申請種別';

  @override
  String get quantity => '数';

  @override
  String get unit => '単位';

  @override
  String get content => '内容';

  @override
  String get status => '状態';

  @override
  String get action => 'アクション';

  @override
  String get days => '日';

  @override
  String get hours => '時';

  @override
  String get minutes => '分';

  @override
  String get newTicket => '新規申請';

  @override
  String get recordTitle => '申請一覧';

  @override
  String get attendanceRequest => '勤怠申請';

  @override
  String get dayOffRequest => '休暇申請';

  @override
  String get dayOffType => '休日の種類';

  @override
  String get approver => '承認者';

  @override
  String get halfDay => '半日';

  @override
  String get create => '作成';

  @override
  String get view => '閲覧';

  @override
  String get approve => '承認';

  @override
  String get approved => '承認済み';

  @override
  String get onProgess => '承認待ち';

  @override
  String get dayOffDetailTitle => '休暇申請状態';

  @override
  String get noRequestData => '申請データなし';

  @override
  String get missingField => '必須項目が欠落しています';

  @override
  String get dateConstraintErr => '開始日は終了日を超えることはできません';

  @override
  String get okButton => 'OK';

  @override
  String get cancelButton => 'キャンセル';

  @override
  String get updateTicket => '申請更新';

  @override
  String get language => '言語変更';

  @override
  String get confirmLogOut => 'ログアウトよろしいでしょうか?';

  @override
  String get filterAll => 'すべて';

  @override
  String get filterProcessed => '処理済み';

  @override
  String get filterProcessing => '処理待ち';

  @override
  String get filterCancelled => '取下げ';

  @override
  String get warning => 'この操作を実行してもよろしいですか？';

  @override
  String get breakInMustBeBeforeBreakOut => '休憩開始時間は休憩終了時間より前でなければなりません';

  @override
  String get checkInMustBeforeCheckOut => '出勤時間は退勤時間より後でなければなりません';

  @override
  String get checkInTimeHasBeenAdjusted =>
      '出勤時間が退勤時間より24時間以上後であるため、24時間前に調整されました';

  @override
  String get checkOutTimeHasBeenAdjusted =>
      '退勤時間が出勤時間より24時間以上前であるため、24時間後に調整されました';

  @override
  String get reasonInput => '承諾・拒否の理由をご入力ください';

  @override
  String get none => 'なし';

  @override
  String get monthlyAttendance => '月次勤怠';

  @override
  String get month => '月';

  @override
  String get week => '週';

  @override
  String get doubleWeeks => '半月';

  @override
  String get attendanceTitle => '月次勤怠一覧';

  @override
  String get summaryRequestWarning => '月次勤怠を提出していませんでしょうか。';

  @override
  String get holidayNoti => '本日は祝日です。';

  @override
  String get rejectReason => '拒否理由';

  @override
  String get companyRequestReason => '仕事上都合';

  @override
  String get personalRequestReason => '私用';

  @override
  String get original => '元々';

  @override
  String get next => 'Next';

  @override
  String get noData => 'データがありません';

  @override
  String get selectProject => 'プロジェクトを選択';

  @override
  String get search => '検索';

  @override
  String get dataNumber => 'データ番号';

  @override
  String get manager => 'マネージャー';

  @override
  String get invoiceTitle => '請求書のタイトル';

  @override
  String get issueDate => '発行日';

  @override
  String get issuer => '発行者';

  @override
  String get documentNumber => '書類番号';

  @override
  String get paymentMethod => '支払い方法';

  @override
  String get paymentDeadline => '支払期限';

  @override
  String get mainConstruction => '本工事';

  @override
  String get subConstruction => '別工事';

  @override
  String get selectValue => '値を選択';

  @override
  String get no => '番号';

  @override
  String get category => 'カテゴリー';

  @override
  String get item => '項目';

  @override
  String get provider => '提供者';

  @override
  String get payment => '支払い';

  @override
  String get price => '価格';

  @override
  String get taxRate => '税率';

  @override
  String get priceBeforeTax => '税抜価格';

  @override
  String get priceAfterTax => '税込価格';

  @override
  String get projectName => 'プロジェクト名';

  @override
  String get code => 'コード';

  @override
  String get worksiteAttendance => '現場出席';

  @override
  String get presigned => '事前署名';

  @override
  String get cost => '費用';

  @override
  String get attendance => '出席';

  @override
  String get overall => '合計';

  @override
  String get noApproval => '未承認';

  @override
  String get leaveType => '休暇種別';

  @override
  String get workingLocation => '勤務場所';

  @override
  String get editShift => '出勤編集';

  @override
  String get addNewShift => '出勤追加';

  @override
  String get workContent => '作業内容報告';

  @override
  String get workContentHintText => '作業内容を入力してください';

  @override
  String get manDay => '人区';

  @override
  String get manHour => '人時';

  @override
  String get ranking => 'ランク';

  @override
  String get selectWorksite => '作業現場を選択';

  @override
  String get createAttendance => '勤怠追加';

  @override
  String get otpSentToEmail => 'OTPがメールに送信されました';

  @override
  String get expireTime => '有効期限';

  @override
  String get invitationList => '招待リスト';

  @override
  String get emailLabel => 'メール *';

  @override
  String get requiredEmail => 'メールは必須です';

  @override
  String get invalidEmail => '有効なメールアドレスを入力してください';

  @override
  String get loginIdLabel => 'ログインID *';

  @override
  String get requiredLoginId => 'ログインIDは必須です';

  @override
  String get passwordLabel => 'パスワード *';

  @override
  String get requiredPassword => 'パスワードは必須です';

  @override
  String get confirmPasswordLabel => 'パスワードを確認 *';

  @override
  String get requiredConfirmPassword => 'パスワードの確認は必須です';

  @override
  String get passwordMismatch => 'パスワードが一致しません';

  @override
  String get name => '名前 *';

  @override
  String get requiredName => '名前は必須です';

  @override
  String get phone => '電話番号';

  @override
  String get gender => '性別';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get other => 'その他';

  @override
  String get selectBirthday => '誕生日を選択';

  @override
  String get birthday => '誕生日';

  @override
  String get enterOtp => 'OTPを入力 *';

  @override
  String get resendOtpAfterOneMinute => '1分後にOTPを再送信してください。';

  @override
  String get sendOtp => 'OTPを送信';

  @override
  String get registerSuccess => '登録が完了しました！';

  @override
  String get welcome => 'Kantoku Systemへようこそ';

  @override
  String get access => 'アクセス';

  @override
  String get availableAppover => '許可承認者';

  @override
  String get officeApprover => '事務所承認者';

  @override
  String get worksiteApprover => '現場承認者';

  @override
  String get alternativeApprover => '代替承認者';

  @override
  String get workOnDayoffRequest => '休日出勤申請';

  @override
  String get workOnDayOffRequestDescription => '休日出勤が必要な場合は、この申請を使用してください';

  @override
  String get lateOrEarlyRequest => '早退・遅刻申請';

  @override
  String get lateOrEarlyRequestDescription => '早退・遅刻が必要な場合は、この申請を使用してください';

  @override
  String get overtimeRequest => '残業申請';

  @override
  String get overtimeRequestDescription => '残業が必要な場合は、この申請を使用してください';

  @override
  String get leaveRequest => '休暇申請';

  @override
  String get leaveRequestDescription => '休暇が必要な場合は、この申請を使用してください';

  @override
  String get durationType => '時間選択';

  @override
  String get durationTypeAllDay => '全日';

  @override
  String get durationTypeHalfDay => '半日';

  @override
  String get durationTypeCustomize => 'カスタム';

  @override
  String get period => '時間帯';

  @override
  String get morning => '午前';

  @override
  String get afternoon => '午後';

  @override
  String get requestDescription => '備考';

  @override
  String get monthlyAttendanceRequest => '月次勤怠申請';

  @override
  String get event => 'イベント';

  @override
  String get viewMethod => '表示方法';

  @override
  String get viewAllProjects => '全部表示';

  @override
  String get viewEachProject => '単位表示';

  @override
  String get enterTime => '時間を入力';

  @override
  String get selectTime => '時間を選択';

  @override
  String get switchToDragMode => 'ドラッグモードに切り替え';

  @override
  String get switchToWheelMode => 'ホイールモードに切り替え';

  @override
  String get switchToInputMode => '入力モードに切り替え';

  @override
  String get paidLeave => '有休';

  @override
  String get unpaidLeave => '無休';

  @override
  String get compensatoryLeave => '代休';

  @override
  String get otherLeave => 'その他';
}
