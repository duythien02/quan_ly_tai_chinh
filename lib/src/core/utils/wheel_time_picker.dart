// Flutter imports:
// ignore_for_file: lines_longer_than_80_chars

import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

class WheelTimePicker extends StatefulWidget {
  const WheelTimePicker({
    super.key,
    this.initialTime,
    required this.onTimeChanged,
    this.showHour = true,
    this.showMinute = true,
    this.showSecond = false,
    this.is24HourFormat = true,
    this.hourInterval = 1,
    this.minuteInterval = 1,
    this.secondInterval = 1,
  })  : assert(hourInterval > 0 && hourInterval <= (is24HourFormat ? 23 : 12)),
        assert(minuteInterval > 0 && minuteInterval <= 59),
        assert(secondInterval > 0 && secondInterval <= 59);

  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay> onTimeChanged;
  final bool showHour;
  final bool showMinute;
  final bool showSecond;
  final bool is24HourFormat;
  final int hourInterval;
  final int minuteInterval;
  final int secondInterval;

  @override
  State<WheelTimePicker> createState() => _WheelTimePickerState();
}

class _WheelTimePickerState extends State<WheelTimePicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late FixedExtentScrollController _secondController;
  late FixedExtentScrollController _amPmController;

  late int _selectedHour; // In 24-hour format
  late int _selectedMinute;
  late int _selectedSecond;
  late int _selectedAmPm; // 0 for AM, 1 for PM

  final List<int> _hours = [];
  final List<int> _minutes = [];
  final List<int> _seconds = [];
  final List<String> _amPm = ['AM', 'PM'];

  @override
  void initState() {
    super.initState();

    final now = TimeOfDay.now();
    final initialTime = widget.initialTime ?? now;

    _selectedHour = initialTime.hour;
    _selectedMinute = initialTime.minute;
    _selectedSecond = 0;
    _selectedAmPm = _selectedHour < 12 ? 0 : 1;

    _generateLists();
    _initializeControllers();
    _updateSelectedTime();
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _secondController.dispose();
    _amPmController.dispose();
    super.dispose();
  }

  void _initializeControllers() {
    int initialHourIndex = 0;
    if (widget.showHour) {
      // Calculate the initial display hour (1-12 or 0-23)
      final int initialDisplayHour = widget.is24HourFormat
          ? _selectedHour
          : (_selectedHour % 12 == 0 ? 12 : _selectedHour % 12);

      // Find the index of this display hour in the _hours list
      initialHourIndex = _hours.indexOf(initialDisplayHour);
      // Ensure index is valid, default to 0 if not found
      if (initialHourIndex < 0) {
        initialHourIndex = 0;
      }
    }

    int initialMinuteIndex = 0;
    if (widget.showMinute) {
      initialMinuteIndex = _minutes.indexOf(_selectedMinute);
      if (initialMinuteIndex < 0) {
        initialMinuteIndex = 0;
      }
    }

    int initialSecondIndex = 0;
    if (widget.showSecond) {
      initialSecondIndex = _seconds.indexOf(_selectedSecond);
      if (initialSecondIndex < 0) {
        initialSecondIndex = 0;
      }
    }

    // Determine the initial AM/PM index
    _selectedAmPm = _selectedHour < 12 ? 0 : 1;

    _hourController =
        FixedExtentScrollController(initialItem: initialHourIndex);
    _minuteController =
        FixedExtentScrollController(initialItem: initialMinuteIndex);
    _secondController =
        FixedExtentScrollController(initialItem: initialSecondIndex);
    _amPmController = FixedExtentScrollController(initialItem: _selectedAmPm);

    // Add listeners to update selected time and trigger rebuild on scroll
    if (widget.showHour && _hours.isNotEmpty) {
      _hourController.addListener(() {
        // Debounce or check if scrolling has stopped if needed for performance
        _updateSelectedTime();
      });
    }
    if (widget.showMinute && _minutes.isNotEmpty) {
      _minuteController.addListener(() {
        _updateSelectedTime();
      });
    }
    if (widget.showSecond && _seconds.isNotEmpty) {
      _secondController.addListener(() {
        _updateSelectedTime();
      });
    }
    if (!widget.is24HourFormat && widget.showHour && _amPm.isNotEmpty) {
      _amPmController.addListener(() {
        _updateSelectedTime();
      });
    }
  }

  void _generateLists() {
    _hours.clear();
    if (widget.showHour) {
      final int maxHour = widget.is24HourFormat ? 23 : 12;
      final int minHour = widget.is24HourFormat ? 0 : 1;
      for (int i = minHour; i <= maxHour; i += widget.hourInterval) {
        _hours.add(i);
      }
      // Ensure initial hour is in the list if it's not already due to interval
      if (!_hours.contains(
            widget.is24HourFormat
                ? _selectedHour
                : (_selectedHour % 12 == 0 ? 12 : _selectedHour % 12),
          ) &&
          minHour <= maxHour) {
        final int initialDisplayHour = widget.is24HourFormat
            ? _selectedHour
            : (_selectedHour % 12 == 0 ? 12 : _selectedHour % 12);
        // Find the closest valid hour if the initial hour isn't an exact interval match
        int closestHour = minHour;
        for (int i = minHour; i <= maxHour; i += widget.hourInterval) {
          if ((i - initialDisplayHour).abs() <
              (closestHour - initialDisplayHour).abs()) {
            closestHour = i;
          }
        }
        if (!_hours.contains(closestHour)) {
          _hours.add(closestHour);
        }
        _hours.sort(); // Keep the list sorted
      }
      if (_hours.isEmpty && minHour <= maxHour) {
        _hours.add(minHour);
      }
    }

    _minutes.clear();
    if (widget.showMinute) {
      for (int i = 0; i <= 59; i += widget.minuteInterval) {
        _minutes.add(i);
      }
      // Ensure initial minute is in the list if it's not already due to interval
      if (!_minutes.contains(_selectedMinute) && _minutes.isNotEmpty) {
        int closestMinute = 0;
        for (int i = 0; i <= 59; i += widget.minuteInterval) {
          if ((i - _selectedMinute).abs() <
              (closestMinute - _selectedMinute).abs()) {
            closestMinute = i;
          }
        }
        if (!_minutes.contains(closestMinute)) {
          _minutes.add(closestMinute);
        }
        _minutes.sort();
      }
      if (_minutes.isEmpty) {
        _minutes.add(0);
      }
    }

    _seconds.clear();
    if (widget.showSecond) {
      for (int i = 0; i <= 59; i += widget.secondInterval) {
        _seconds.add(i);
      }
      // Ensure initial second is in the list if it's not already due to interval
      if (!_seconds.contains(_selectedSecond) && _seconds.isNotEmpty) {
        int closestSecond = 0;
        for (int i = 0; i <= 59; i += widget.secondInterval) {
          if ((i - _selectedSecond).abs() <
              (closestSecond - _selectedSecond).abs()) {
            closestSecond = i;
          }
        }
        if (!_seconds.contains(closestSecond)) {
          _seconds.add(closestSecond);
        }
        _seconds.sort();
      }
      if (_seconds.isEmpty) {
        _seconds.add(0);
      }
    }
  }

  void _updateSelectedTime() {
    // Update selected hour based on the hour controller's selected item
    int currentHour = _selectedHour; // Default to current if picker not shown
    if (widget.showHour && _hours.isNotEmpty && _hourController.hasClients) {
      final selectedDisplayHour =
          _hours[_hourController.selectedItem % _hours.length];
      if (widget.is24HourFormat) {
        currentHour = selectedDisplayHour;
      } else {
        // Convert 12-hour format to 24-hour format considering AM/PM
        final isPm = (_amPmController.hasClients
                ? _amPmController.selectedItem
                : _selectedAmPm) ==
            1;
        if (selectedDisplayHour == 12) {
          // 12 AM is 0, 12 PM is 12
          currentHour = isPm ? 12 : 0;
        } else {
          currentHour = isPm ? selectedDisplayHour + 12 : selectedDisplayHour;
        }
      }
    }

    // Update selected minute based on the minute controller's selected item
    int currentMinute =
        _selectedMinute; // Default to current if picker not shown
    if (widget.showMinute &&
        _minutes.isNotEmpty &&
        _minuteController.hasClients) {
      currentMinute =
          _minutes[_minuteController.selectedItem % _minutes.length];
    }

    // Update selected second based on the second controller's selected item
    int currentSecond =
        _selectedSecond; // Default to current if picker not shown
    if (widget.showSecond &&
        _seconds.isNotEmpty &&
        _secondController.hasClients) {
      currentSecond =
          _seconds[_secondController.selectedItem % _seconds.length];
    }

    // Only update state and notify parent if the time has actually changed
    if (currentHour != _selectedHour ||
        currentMinute != _selectedMinute ||
        currentSecond != _selectedSecond) {
      setState(() {
        _selectedHour = currentHour;
        _selectedMinute = currentMinute;
        _selectedSecond = currentSecond;
        _selectedAmPm =
            _selectedHour < 12 ? 0 : 1; // Keep AM/PM in sync with 24hr hour
      });
      // Notify the parent widget (TimeOfDay doesn't include seconds)
      widget.onTimeChanged(
        TimeOfDay(hour: _selectedHour, minute: _selectedMinute),
      );
    }
  }

  Widget _buildPickerColumn(
    final FixedExtentScrollController controller,
    final List<dynamic> items,
    final String? unit,
    final ValueChanged<int> onChanged,
  ) {
    if (items.isEmpty) {
      return const SizedBox.shrink(); // Don't build if no items
    }

    // Determine if this is the hour column to apply different formatting
    final isHourColumn =
        unit == (widget.is24HourFormat ? 'h' : null) && widget.showHour;

    return Expanded(
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 40,
        physics: const FixedExtentScrollPhysics(),
        // We handle updates via controller listeners now, not here
        // onSelectedItemChanged: onChanged,
        childDelegate: ListWheelChildLoopingListDelegate(
          children: items.map<Widget>((final item) {
            // Determine if this item is currently centered based on the controller's selected item
            final bool isSelected;
            final currentItemValue = item; // Store item value for tap handler

            if (controller.hasClients) {
              isSelected =
                  items[controller.selectedItem % items.length] == item;
            } else {
              // If controller is not yet attached, highlight based on initial selected time
              if (isHourColumn) {
                final int initialDisplayHour = widget.is24HourFormat
                    ? _selectedHour
                    : (_selectedHour % 12 == 0 ? 12 : _selectedHour % 12);
                isSelected = item == initialDisplayHour;
              } else if (unit == 'm') {
                isSelected = item == _selectedMinute;
              } else if (unit == 's') {
                isSelected = item == _selectedSecond;
              } else {
                isSelected = false; // Should not happen for time columns
              }
            }

            return GestureDetector(
              onTap: () async {
                if (controller.hasClients) {
                  final tappedIndex = items.indexOf(currentItemValue);
                  if (tappedIndex != -1) {
                    controller.animateToItem(
                      tappedIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                }
              },
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: isSelected
                      ? BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        )
                      : null,
                  child: Text(
                    isHourColumn
                        ? item.toString()
                        : item.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontSize: 20,
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.black87,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildAmPmPicker() {
    if (widget.is24HourFormat || !widget.showHour) {
      return const SizedBox.shrink();
    }

    String toLocaleString(final String value) {
      if (value == 'AM') {
        return context.l10n.morning;
      } else if (value == 'PM') {
        return context.l10n.afternoon;
      }
      return value;
    }

    return Expanded(
      child: ListWheelScrollView(
        controller: _amPmController,
        itemExtent: 40,
        physics: const FixedExtentScrollPhysics(),
        // We handle updates via controller listeners now, not here
        // onSelectedItemChanged: (final index) {
        //   setState(() {
        //     _selectedAmPm = index;
        //     _updateSelectedTime();
        //   });
        // },
        children: _amPm.map((final val) {
          final bool isSelected;
          final currentAmPmValue = val; // Store value for tap handler

          if (_amPmController.hasClients) {
            isSelected = _amPm[_amPmController.selectedItem %
                    _amPm
                        .length] == // Ensure modulo for safety, though _amPm is small
                val;
          } else {
            // If controller is not yet attached, highlight based on initial selected AM/PM
            isSelected = (val == 'AM' &&
                    _selectedAmPm ==
                        0) || // Compare with 'AM'/'PM' before localization
                (val == 'PM' && _selectedAmPm == 1);
          }

          return GestureDetector(
            onTap: () async {
              if (_amPmController.hasClients) {
                final tappedIndex = _amPm.indexOf(currentAmPmValue);
                if (tappedIndex != -1) {
                  _amPmController.animateToItem(
                    tappedIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              }
            },
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: isSelected
                    ? BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      )
                    : null,
                child: Text(
                  toLocaleString(val),
                  style: TextStyle(
                    fontSize: 20,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black87,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    // We might need to regenerate lists if parameters like intervals or 24hr format change
    // during the widget's lifetime (e.g., if the parent widget rebuilds with different parameters).
    // A more robust approach would be to handle this in didUpdateWidget,
    // but for simplicity, we regenerate here. Be mindful of performance if lists are very large.
    _generateLists();

    // Re-initialize controllers if they haven't been, or if the lists were empty
    // and now have items (e.g., if showHour/Minute/Second was false then true)
    // We check hasClients to see if the controller is attached to a ListWheelScrollView
    if (!_hourController.hasClients && _hours.isNotEmpty && widget.showHour) {
      // Need to dispose old controllers if they exist before creating new ones, but initState handles initial creation
      // For updates via didUpdateWidget, dispose would be needed. Here, we assume initial build or list population.
      _initializeControllers(); // Re-initialize controllers if lists become non-empty and pickers are shown
    }
    if (!_minuteController.hasClients &&
        _minutes.isNotEmpty &&
        widget.showMinute) {
      _initializeControllers();
    }
    if (!_secondController.hasClients &&
        _seconds.isNotEmpty &&
        widget.showSecond) {
      _initializeControllers();
    }
    // AM/PM controller always exists if showHour is true and not 24hr format, but re-initializing handles potential disposal/recreation needs if parameters change
    if (!_amPmController.hasClients &&
        !widget.is24HourFormat &&
        widget.showHour &&
        _amPm.isNotEmpty) {
      _initializeControllers();
    }

    return SizedBox(
      height: 200, // Adjust height as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.showHour)
            _buildPickerColumn(
              _hourController,
              _hours,
              widget.is24HourFormat ? 'h' : null,
              // No longer needed here, handled by listener in _initializeControllers
              (final index) {},
            ),
          if (widget.showHour &&
              widget.showMinute &&
              _hours.isNotEmpty &&
              _minutes.isNotEmpty)
            const Text(
              ':',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Separator color
              ),
            ),
          if (widget.showMinute)
            _buildPickerColumn(
              _minuteController,
              _minutes,
              'm',
              // No longer needed here, handled by listener in _initializeControllers
              (final index) {},
            ),
          if (widget.showMinute &&
              widget.showSecond &&
              _minutes.isNotEmpty &&
              _seconds.isNotEmpty)
            const Text(
              ':',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Separator color
              ),
            ),
          if (widget.showSecond)
            _buildPickerColumn(
              _secondController,
              _seconds,
              's',
              // No longer needed here, handled by listener in _initializeControllers
              (final index) {},
            ),
          if (!widget.is24HourFormat &&
              widget.showHour &&
              _hours
                  .isNotEmpty) // Only show AM/PM if not 24hr format and hour is shown
            _buildAmPmPicker(),
        ],
      ),
    );
  }
}
