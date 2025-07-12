// Flutter imports:
// ignore_for_file: lines_longer_than_80_chars

import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTimePicker extends StatefulWidget {
  const InputTimePicker({
    super.key,
    this.initialTime,
    required this.onTimeChanged,
    this.is24HourFormat = true,
  });

  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay> onTimeChanged;
  final bool is24HourFormat;

  @override
  State<InputTimePicker> createState() => _InputTimePickerState();
}

class _InputTimePickerState extends State<InputTimePicker> {
  late TimeOfDay _currentTime;
  late TextEditingController _hourController;
  late TextEditingController _minuteController;
  late FocusNode _hourFocusNode;
  late FocusNode _minuteFocusNode;

  bool _isAm = true; // True for AM, false for PM
  String? _lastHourValue;
  String? _lastMinuteValue;

  @override
  void initState() {
    super.initState();
    _currentTime = widget.initialTime ?? TimeOfDay.now();
    _isAm = _currentTime.hour < 12;

    _hourController = TextEditingController(
      text: _formatHour(_currentTime.hour),
    );
    _minuteController = TextEditingController(
      text: _currentTime.minute.toString().padLeft(2, '0'),
    );

    _lastHourValue = _hourController.text;
    _lastMinuteValue = _minuteController.text;

    _hourFocusNode = FocusNode();
    _minuteFocusNode = FocusNode();

    _hourFocusNode.addListener(() {
      if (_hourFocusNode.hasFocus) {
        _lastHourValue = _hourController.text; // Store value before clearing
        _hourController.clear();
      } else {
        // Lost focus
        if (_hourController.text.isEmpty) {
          _hourController.text = _lastHourValue ??
              _formatHour(_currentTime.hour); // Restore if empty
        }
        _updateTime(); // Process the final value (typed or restored)
      }
    });

    _minuteFocusNode.addListener(() {
      if (_minuteFocusNode.hasFocus) {
        _lastMinuteValue =
            _minuteController.text; // Store value before clearing
        _minuteController.clear();
      } else {
        // Lost focus
        if (_minuteController.text.isEmpty) {
          _minuteController.text = _lastMinuteValue ??
              _currentTime.minute
                  .toString()
                  .padLeft(2, '0'); // Restore if empty
        }
        _updateTime(); // Process the final value (typed or restored)
      }
    });

    // Ensure the parent is notified of the initial time.
    WidgetsBinding.instance.addPostFrameCallback((final _) {
      if (mounted) {
        widget.onTimeChanged(_currentTime);
      }
    });
  }

  String _formatHour(final int hour) {
    if (widget.is24HourFormat) {
      return hour.toString().padLeft(2, '0');
    } else {
      if (hour == 0 || hour == 12) {
        return '12'; // Midnight or Noon
      }
      return (hour % 12).toString().padLeft(2, '0');
    }
  }

  void _updateTime() {
    int hour = int.tryParse(_hourController.text) ?? _currentTime.hour;
    final int minute =
        int.tryParse(_minuteController.text) ?? _currentTime.minute;

    if (!widget.is24HourFormat) {
      if (_isAm && hour == 12) {
        // 12 AM
        hour = 0;
      } else if (!_isAm && hour != 12) {
        // PM (not 12 PM)
        hour = hour + 12;
      } else if (!_isAm && hour == 12) {
        // 12 PM
        hour = 12;
      }
    }

    // Validate hour and minute
    hour = hour.clamp(0, 23);
    final newTime = TimeOfDay(hour: hour, minute: minute.clamp(0, 59));

    if (_currentTime != newTime) {
      setState(() {
        _currentTime = newTime;
      });
      widget.onTimeChanged(newTime);
    }
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    _hourFocusNode.dispose();
    _minuteFocusNode.dispose();
    super.dispose();
  }

  Widget _buildTimeTextField(
    final TextEditingController controller,
    final FocusNode focusNode,
    final bool isHour,
  ) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: focusNode.hasFocus
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                width: focusNode.hasFocus ? 2 : 1,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: TextFormField(
              controller: controller,
              focusNode: focusNode,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 40, color: Colors.black),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(2),
              ],
              onChanged: (final String value) {
                _updateTime();
                if (isHour && value.length == 2) {
                  FocusScope.of(context).requestFocus(_minuteFocusNode);
                }
              },
              onTap: () {
                // Already handled by focus listener to clear
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmPmSelector() {
    if (widget.is24HourFormat) {
      return const SizedBox.shrink();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildAmPmButton(context.l10n.morning, true),
        const SizedBox(height: 2),
        _buildAmPmButton(context.l10n.afternoon, false),
      ],
    );
  }

  Widget _buildAmPmButton(final String text, final bool isCurrentlyAm) {
    final bool isActive = _isAm == isCurrentlyAm;
    return InkWell(
      onTap: () {
        if (_isAm != isCurrentlyAm) {
          setState(() {
            _isAm = isCurrentlyAm;
          });
          _updateTime();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)
              : Colors.grey.shade200,
          border: Border.all(
            color:
                isActive ? Theme.of(context).colorScheme.primary : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive
                ? Theme.of(context).colorScheme.primary
                : Colors.black54,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTimeTextField(
              _hourController,
              _hourFocusNode,
              true,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                ':',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            _buildTimeTextField(
              _minuteController,
              _minuteFocusNode,
              false,
            ),
            if (!widget.is24HourFormat) ...[
              const SizedBox(width: 16),
              _buildAmPmSelector(),
            ],
          ],
        ),
      ),
    );
  }
}
