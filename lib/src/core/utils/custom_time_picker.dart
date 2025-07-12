// Flutter imports:
// ignore_for_file: lines_longer_than_80_chars

import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

import 'drag_time_picker.dart';
import 'input_time_picker.dart';
import 'wheel_time_picker.dart';

enum TimePickerMode {
  wheel,
  drag,
  input,
}

Future<TimeOfDay?> showCustomTimePicker({
  required final BuildContext context,
  final TimeOfDay? initialTime,
  final bool showHour = true,
  final bool showMinute = true,
  final bool is24HourFormat = true,
  final int hourInterval = 1,
  final int minuteInterval = 1,
  final int secondInterval = 1,
  final String? title,
}) {
  // This will hold the time selected within the dialog, initialized with initialTime.
  TimeOfDay? dialogSelectedTime = initialTime ?? TimeOfDay.now();

  return showDialog<TimeOfDay?>(
    context: context,
    builder: (final BuildContext dialogContext) {
      // Initial mode for the dialog
      TimePickerMode currentMode = TimePickerMode.wheel;

      return StatefulBuilder(
        builder: (final BuildContext context, final StateSetter setState) {
          void updateSelectedTime(final TimeOfDay newTime) {
            // This internal update doesn't require setState for dialogSelectedTime itself,
            // as it's used when the dialog is popped.
            // However, if a picker needs to reflect this change immediately (e.g. a shared display),
            // then setState might be needed here or within the picker.
            dialogSelectedTime = newTime;
          }

          // Determine dialog title based on mode
          String currentTitle;
          if (currentMode == TimePickerMode.input) {
            currentTitle = title ?? context.l10n.enterTime;
          } else {
            // For Wheel and Drag
            currentTitle = title ?? context.l10n.selectTime;
          }

          Widget pickerContent;
          switch (currentMode) {
            case TimePickerMode.wheel:
              pickerContent = WheelTimePicker(
                initialTime: dialogSelectedTime,
                onTimeChanged: updateSelectedTime,
                showHour: showHour,
                showMinute: showMinute,
                is24HourFormat: is24HourFormat,
                hourInterval: hourInterval,
                minuteInterval: minuteInterval,
                secondInterval: secondInterval,
              );
              break;
            case TimePickerMode.drag:
              pickerContent = DragTimePicker(
                initialTime: dialogSelectedTime,
                onTimeChanged: updateSelectedTime,
                is24HourFormat: is24HourFormat,
                hourInterval: hourInterval,
                minuteInterval: minuteInterval,
              );
              break;
            case TimePickerMode.input:
              pickerContent = InputTimePicker(
                initialTime: dialogSelectedTime,
                onTimeChanged: updateSelectedTime,
                is24HourFormat: is24HourFormat,
              );
              break;
          }

          return AlertDialog(
            title: Text(
              currentTitle,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            content: SizedBox(
              width: double.maxFinite, // Ensure dialog tries to be wide enough
              child: pickerContent,
            ),
            actionsPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            actionsAlignment: MainAxisAlignment.spaceBetween, // Align actions
            actions: <Widget>[
              Row(
                // Group mode switch icons
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.settings_backup_restore,
                      color: currentMode == TimePickerMode.wheel
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                    tooltip: context.l10n.switchToWheelMode,
                    onPressed: () {
                      setState(() {
                        currentMode = TimePickerMode.wheel;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.swipe,
                      color: currentMode == TimePickerMode.drag
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                    tooltip: context.l10n.switchToDragMode,
                    onPressed: () {
                      setState(() {
                        currentMode = TimePickerMode.drag;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.keyboard,
                      color: currentMode == TimePickerMode.input
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                    tooltip: context.l10n.switchToInputMode,
                    onPressed: () {
                      setState(() {
                        currentMode = TimePickerMode.input;
                      });
                    },
                  ),
                ],
              ),
              Row(
                // Group Cancel and OK buttons
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    child: Text(
                      context.l10n.okButton,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext).pop(dialogSelectedTime);
                    },
                  ),
                  TextButton(
                    child: Text(
                      context.l10n.cancelButton,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(dialogContext)
                          .pop(); // Return null on cancel
                    },
                  ),
                ],
              ),
            ],
          );
        },
      );
    },
  );
}
