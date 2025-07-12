// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:ez_intl/ez_intl.dart';

// Project imports:
import '../params/api_error_params.dart';
import '../params/singleton_dialog_params.dart';
import '../bloc/ez_bloc.dart';
import '../error/api_error.dart';
import '../error/error_codes.dart';
import 'single_dialog.dart';

class ApiErrorDialog {
  static Future<void> show(final ApiErrorParams apiErrorParams) {
    return SingletonAlertDialog.instance.show(
      apiErrorParams.context,
      apiErrorParams.error?.code == ErrorCodes.unknownError.toString() ||
              apiErrorParams.error?.message == null
          ? apiErrorParams.context.l10n.unknown
          : apiErrorParams.error?.message,
      //placeholder to make a dialog mapper for other error code
      SingletonDialogParams(
        onPressOK: () {
          handleAPIExceptionCase(apiErrorParams.context, apiErrorParams.error);
        },
      ),
    );
  }

  static void handleAPIExceptionCase(
    final BuildContext context,
    final ApiError? error,
  ) {
    // Do something with response data
    switch (error?.code) {
      case '${ErrorCodes.tokenExpired}':
        {
          //TODO
          // context.read<AuthenticationBloc>().add(AuthenticationLoggedOut());
          break;
        }
      default:
        break;
    }
  }
}
