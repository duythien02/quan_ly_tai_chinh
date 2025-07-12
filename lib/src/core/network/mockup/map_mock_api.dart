// Package imports:
import 'package:path_to_regexp/path_to_regexp.dart';

// Project imports:
import '../end_points.dart';

final Map<String, String> mapMockApiForGetRequest = <String, String>{
  EndPoints.logHours: 'log_hours',
  EndPoints.logHoursProjectLoad: 'log_hours_project_load',
  EndPoints.logHoursOfficeLoad: 'log_hours_office_load',
  EndPoints.logHoursWorksiteLoad: 'log_hours_office_load',
  EndPoints.worksiteManagerWorksiteLoad: 'worksite_manager_worksite_load',
  EndPoints.loginGetOrg: 'login_org_load',
  EndPoints.account: 'account',
  EndPoints.worksiteManagerWorksiteDataLoad:
      'worksite_manager_project_data_load',
  EndPoints.requestsForUserLoad: 'day_off_request',
  EndPoints.requestsForApproverLoad: 'day_off_request_appr_load',
  EndPoints.requestByIdLoad: 'day_off_request_by_id_load',
  EndPoints.projectData: 'project_data_nonpaging',
  EndPoints.dashboardManager: 'dashboard_manager',
  EndPoints.detailProjectCost: 'detail_project_cost',
  EndPoints.detailProjectCostCategoryLoad: 'detail_project_cost_category_load',
  EndPoints.accountManagerCheck: 'account_manager_check',
  EndPoints.detailProjectCostConstructionLoad:
      'detail_project_cost_construction_load',
  EndPoints.detailProjectCostGetCostItem: 'detail_project_cost_get_cost_item',
  EndPoints.detailProjectCostGetCostVendor:
      'detail_project_cost_get_cost_vendor',
  EndPoints.registerGetOtp: 'register_get_otp',
  EndPoints.loginCheckInvitation: 'login_check_invitation',
};

final Map<String, String> mapMockApiForPostRequest = <String, String>{
  EndPoints.login: 'login',
  EndPoints.logHoursCheckIn: 'log_hours_check_in',
  EndPoints.logHoursUpdate: 'log_hours_update',
  EndPoints.accountPasswordChange: 'account_password_change',
  EndPoints.forgotPassword: 'account_forgot_password',
  EndPoints.requestCreate: 'request_create',
  EndPoints.requestUpdate: 'request_update',
  EndPoints.requestApprove: 'request_approve',
  EndPoints.requestReject: 'request_reject',
  EndPoints.requestCancel: 'request_cancel',
  EndPoints.accountAvatarUpdate: 'account_avatar_update',
  EndPoints.worksiteManagerApprove: 'worksite_manager_approve',
  EndPoints.detailProjectCostCreateNewInvoice:
      'detail_project_cost_create_new_invoice',
  EndPoints.worksiteManagerWorksiteReportLoad:
      'worksite_manager_worksite_report_load',
  EndPoints.worksiteManagerWorksiteReportUpdate:
      'worksite_manager_worksite_report_update',
  EndPoints.loginLoginWithOrg: 'login_login_with_org',
  EndPoints.register: 'register',
  EndPoints.loginAcceptInvitation: 'login_accept_invitation',
};

String? getJsonNameForGetRequest(
  final String endpoint, {
  final Map<String, dynamic>? queryParameters,
}) {
  for (final String key in mapMockApiForGetRequest.keys) {
    if (hasMatch(endpoint, key)) {
      return mapMockApiForGetRequest[key];
    }
  }
  return null;
}

String? getJsonNameForPostRequest(
  final String endpoint, {
  final dynamic data,
  final Map<String, dynamic>? queryParameters,
}) {
  for (final String key in mapMockApiForPostRequest.keys) {
    if (hasMatch(endpoint, key)) {
      return mapMockApiForPostRequest[key];
    }
  }

  return null;
}

bool hasMatch(final String path, final String endPoints) {
  final String endPoint = endPoints.replaceAll('{', ':').replaceAll('}', '');
  final RegExp regExp = pathToRegExp(endPoint);

  return regExp.hasMatch(path);
}
