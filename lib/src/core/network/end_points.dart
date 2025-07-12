// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EndPoints {
  EndPoints._();
  //login
  static const String login = '/v1/auth/sign-in';
  static const String loginGetOrg = '/v1/org';
  static const String loginLoginWithOrg = '/v1/auth/sign-on';
  static const String loginCheckInvitation = '/v1/account/invitation';
  static const String loginAcceptInvitation = '/v1/account/invitation/accept';

  //register
  static const String register = '/v1/account';
  static const String registerGetOtp = '/v1/auth/verification/email';

  //account/ setting
  static const String account = '/v1/userinfo';
  static const String accountPasswordChange = '/v1/auth/change-password';
  static const String forgotPassword = '/v1/auth/recover-password';
  static const String accountAvatarUpdate = '/v1/userinfo/avatar';
  static const String accountAvatarGet = '/v1/userinfo/avatar';
  static const String accountGetNotifications = '/v1/notification/employee';
  static const String accountMarkAllNotificationsRead =
      '/v1/notification/notification/read';

  //attendance
  static const String logHours = '/v1/attendance';
  static const String syncOfflineData = '/v1/attendance/sync';
  static const String logHoursUnscheduledCheckIn = '/v1/attendance/checkin';
  static const String logHoursCheckIn = '/v1/attendance/{shiftId}/checkin';
  static const String logHoursCheckOut = '/v1/attendance/{shiftId}/checkout';
  static const String logHoursBreakIn = '/v1/attendance/{shiftId}/breakin';
  static const String logHoursBreakOut = '/v1/attendance/{shiftId}/breakout';
  static const String logHoursCreate = '/v1/attendance';
  static const String logHoursUpdate = '/v1/attendance/{shiftId}';
  static const String logHoursDelete = '/v1/attendance/{shiftId}';
  static const String requestApproval = '/v1/attendance/{shiftId}/request';

  //workplace * project
  static const String logHoursOfficeLoad = '/v1/workplace/simple-offices';
  static const String logHoursWorksiteLoad = '/v1/workplace/simple-worksites';
  static const String logHoursProjectLoad = '/v1/project/simple-project-info';
  static const String projectData = '/v1/project/nonpaging';

  //worksite manage
  static const String worksiteManagerWorksiteLoad =
      '/v1/project/managed-project';
  static const String worksiteManagerWorksiteDataLoad =
      '/v1/attendance/projects/{projectId}';
  static const String worksiteManagerApprove =
      '/v1/attendance/{shiftId}/approve';
  static const String worksiteManagerWorksiteReportLoad =
      '/v1/project/{projectId}/daily-report';
  static const String worksiteManagerWorksiteReportCreate =
      '/v1/project/{projectId}/daily-report';
  static const String worksiteManagerWorksiteReportUpdate =
      '/v1/project/daily-report/{reportId}';

  //request manage
  static const String requestsForUserLoad = '/v1/request/by-au';
  static const String requestsForApproverLoad = '/v1/request/by-approver';
  static const String requestByIdLoad = '/v1/request/{id}';
  static const String requestCreate = '/v1/request';
  static const String requestUpdate = '/v1/request/{id}';
  static const String requestCancel = '/v1/request/{id}/cancel';
  static const String requestApprove = '/v1/request/{id}/approve';
  static const String requestReject = '/v1/request/{id}/reject';
  static const String requestDelete = '/v1/request/{id}';

  //request related
  static const String dayOffRequestUnitLoad = '/v1/common/units/request';
  static const String dayOffRequestRequestTypeLoad = '/v1/common/request-types';
  static const String dayOffRequestDayOffTypeLoad = '/v1/common/leave-types';

  //monthly attendance
  static const String getHoliday = '/v1/eventcalendar/date';
  static const String requestApprovalMonthlyAttendance =
      '/v1/monthlyattendance/approval';
  //dashboard manager
  static const String dashboardManager = '/v1/project/summary';
  static const String detailProjectCost = '/v1/cost/inputcostitem';
  static const String detailProjectCostCategoryLoad = '/v1/cost/category';
  static const String accountManagerCheck = '/v1/employee/current/manager';
  static const String detailProjectCostConstructionLoad =
      '/v1/construction/project/{id}';
  static const String detailProjectCostCreateNewInvoice = '/v1/cost/inputcost';
  static const String detailProjectCostEditInputCostItem =
      '/v1/cost/inputcostitem';
  static const String detailProjectCostGetCostItem =
      '/get-cost-item-detail-project-cost';
  static const String detailProjectCostGetCostVendor =
      '/get-cost-vendor-detail-project-cost';

  static const String alternativeApprover = '/v1/employee/approval-authority';
}

String getDotEnv(final String key) {
  return dotenv.get(key);
}
