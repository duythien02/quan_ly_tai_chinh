// Flutter imports:
// ignore_for_file: lines_longer_than_80_chars

import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:ez_intl/ez_intl.dart';
import 'package:flutter/material.dart';

enum DragTarget { hour, minute }

class DragTimePicker extends StatefulWidget {
  const DragTimePicker({
    super.key,
    this.initialTime,
    required this.onTimeChanged,
    this.is24HourFormat = true,
    this.hourInterval = 1,
    this.minuteInterval = 1,
  });

  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay> onTimeChanged;
  final bool is24HourFormat;
  final int hourInterval;
  final int minuteInterval;

  @override
  State<DragTimePicker> createState() => _DragTimePickerState();
}

class _DragTimePickerState extends State<DragTimePicker> {
  late TimeOfDay _selectedTime;
  late bool _isAm;
  DragTarget _activeDragTarget = DragTarget.hour;
  int _previousMinuteOnDrag = -1;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime ?? TimeOfDay.now();
    if (!widget.is24HourFormat) {
      _isAm = _selectedTime.hour < 12;
    }
  }

  void _onTimeChanged(final TimeOfDay newTime) {
    setState(() {
      _selectedTime = newTime;
      if (!widget.is24HourFormat) {
        _isAm = newTime.hour < 12;
      }
    });
    widget.onTimeChanged(newTime);
  }

  void _toggleAmPm(final bool selectAsAm) {
    if (_isAm == selectAsAm) {
      return; // No change
    }

    int currentHour = _selectedTime.hour;
    if (selectAsAm) {
      // PM to AM
      if (currentHour >= 12) {
        currentHour -= 12;
      }
    } else {
      // AM to PM
      if (currentHour < 12) {
        currentHour += 12;
      }
    }
    _onTimeChanged(TimeOfDay(hour: currentHour, minute: _selectedTime.minute));
  }

  void _handleClockDragUpdate(
    final Offset localPosition,
    final double clockDimension,
  ) {
    final center = Offset(clockDimension / 2, clockDimension / 2);
    final dx = localPosition.dx - center.dx;
    final dy = localPosition.dy - center.dy;

    var angle = math.atan2(dy, dx) + math.pi / 2;
    if (angle < 0) {
      angle += 2 * math.pi;
    }

    if (_activeDragTarget == DragTarget.hour) {
      final double rawHourOnClock = (angle / (2 * math.pi)) * 12;
      int hourOnClock =
          (rawHourOnClock / widget.hourInterval).round() * widget.hourInterval;

      // Normalize hourOnClock to be 1-12 for clock face representation for ANGLE logic
      // This represents the position on a standard 12-hour clock face.
      if (hourOnClock == 0 && dy < 0) {
        hourOnClock = 12; // Top of the clock
      } else if (hourOnClock > 12) {
        hourOnClock = 12; // Cap at 12
      } else if (hourOnClock == 0 && dy >= 0) {
        hourOnClock = (widget.hourInterval <= 6 && widget.hourInterval > 0)
            ? widget.hourInterval
            : 6; // Bottom half snap
      }
      if (hourOnClock == 0) {
        hourOnClock = 12; // Should be 12 if landed on 0 after interval snapping
      }
      if (hourOnClock < 1 && widget.hourInterval == 1) {
        hourOnClock = 1;
      } else if (hourOnClock < widget.hourInterval && widget.hourInterval > 1) {
        hourOnClock = widget.hourInterval;
      }

      int newHourIn24Format;
      if (widget.is24HourFormat) {
        final double distance = math.sqrt(dx * dx + dy * dy);
        final double clockRadius = clockDimension / 2;
        final bool targetingInnerRing =
            distance < (clockRadius * 0.65); // Threshold

        if (targetingInnerRing) {
          // User is aiming for inner ring (12-23)
          // hourOnClock is 1-12 from the angle. Convert to 12-23 range.
          // If hourOnClock is 12 (top), it means 12 PM.
          // If hourOnClock is 1, it means 13 (1 PM).
          // ... If hourOnClock is 11, it means 23 (11 PM).
          if (hourOnClock == 12) {
            newHourIn24Format = 12;
          } else {
            newHourIn24Format = hourOnClock + 12;
          }
        } else {
          // User is aiming for outer ring (00-11)
          // hourOnClock is 1-12 from the angle. Convert to 00-11 range.
          // If hourOnClock is 12 (top), it means 00 (midnight).
          // If hourOnClock is 1, it means 1 (1 AM).
          // ... If hourOnClock is 11, it means 11 (11 AM).
          if (hourOnClock == 12) {
            newHourIn24Format = 0;
          } else {
            newHourIn24Format = hourOnClock;
          }
        }
      } else {
        // 12-hour mode (existing logic)
        newHourIn24Format = hourOnClock;
        if (_isAm) {
          if (hourOnClock == 12) {
            newHourIn24Format = 0;
          }
        } else {
          if (hourOnClock < 12) {
            newHourIn24Format += 12;
          }
        }
      }
      _onTimeChanged(
        TimeOfDay(hour: newHourIn24Format, minute: _selectedTime.minute),
      );
    } else if (_activeDragTarget == DragTarget.minute) {
      final double rawMinute = (angle / (2 * math.pi)) * 60;
      int newMinute =
          (rawMinute / widget.minuteInterval).round() * widget.minuteInterval;
      newMinute = newMinute % 60;

      int currentHour24 = _selectedTime.hour;

      if (_previousMinuteOnDrag != -1) {
        if (_previousMinuteOnDrag > 45 && newMinute < 15) {
          currentHour24 = (currentHour24 + 1) % 24;
        } else if (_previousMinuteOnDrag < 15 && newMinute > 45) {
          currentHour24 = (currentHour24 - 1 + 24) % 24;
        }
      }
      _previousMinuteOnDrag = newMinute;

      _onTimeChanged(TimeOfDay(hour: currentHour24, minute: newMinute));
    }
  }

  @override
  Widget build(final BuildContext context) {
    final String hourString = widget.is24HourFormat
        ? _selectedTime.hour.toString().padLeft(2, '0')
        : (_selectedTime.hourOfPeriod == 0 ? 12 : _selectedTime.hourOfPeriod)
            .toString()
            .padLeft(2, '0');
    final String minuteString = _selectedTime.minute.toString().padLeft(2, '0');

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _activeDragTarget = DragTarget.hour;
                  });
                },
                child: _TimeDisplayPart(
                  text: hourString,
                  isActive: _activeDragTarget == DragTarget.hour,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  ':',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _activeDragTarget = DragTarget.minute;
                  });
                },
                child: _TimeDisplayPart(
                  text: minuteString,
                  isActive: _activeDragTarget == DragTarget.minute,
                ),
              ),
              if (!widget.is24HourFormat)
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _AmPmButton(
                        label: context.l10n.morning,
                        isSelected: _isAm,
                        onPressed: () => _toggleAmPm(true),
                      ),
                      const SizedBox(height: 4),
                      _AmPmButton(
                        label: context.l10n.afternoon,
                        isSelected: !_isAm,
                        onPressed: () => _toggleAmPm(false),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LayoutBuilder(
              builder: (final context, final constraints) {
                final double clockDimension =
                    math.min(constraints.maxWidth, constraints.maxHeight);
                return GestureDetector(
                  onPanUpdate: (final details) {
                    _handleClockDragUpdate(
                      details.localPosition,
                      clockDimension,
                    );
                  },
                  onPanStart: (final details) {
                    _previousMinuteOnDrag = -1; // Reset on new drag start
                    _handleClockDragUpdate(
                      details.localPosition,
                      clockDimension,
                    );
                  },
                  onPanEnd: (final details) {
                    _previousMinuteOnDrag = -1; // Reset after drag
                  },
                  child: CustomPaint(
                    size: Size(clockDimension, clockDimension),
                    painter: ClockPainter(
                      context: context,
                      time: _selectedTime,
                      is24HourFormat: widget.is24HourFormat,
                      activeTarget: _activeDragTarget,
                      hourInterval: widget.hourInterval,
                      minuteInterval: widget.minuteInterval,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// CustomPainter for the analog clock
class ClockPainter extends CustomPainter {
  ClockPainter({
    required this.time,
    required this.context,
    required this.is24HourFormat,
    required this.activeTarget,
    required this.hourInterval,
    required this.minuteInterval,
  });
  final TimeOfDay time;
  final BuildContext context;
  final bool is24HourFormat;
  final DragTarget activeTarget;
  final int hourInterval;
  final int minuteInterval;

  @override
  void paint(final Canvas canvas, final Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Clock face background
    final clockPaint = Paint()..color = Colors.grey[200]!;
    canvas.drawCircle(center, radius, clockPaint);

    // Outline
    final outlinePaint = Paint()
      ..color = Colors.grey[350]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(center, radius, outlinePaint);

    if (activeTarget == DragTarget.hour) {
      _drawHourMarkers(canvas, size, center, radius);
      _drawHourHighlight(context, canvas, size, center, radius);
    } else {
      // activeTarget == DragTarget.minute
      _drawMinuteMarkers(canvas, size, center, radius);
      _drawMinuteHighlight(canvas, size, center, radius);
    }

    // Draw hands and center dot (common to both modes)
    _drawHands(canvas, size, center, radius);
  }

  void _drawHourMarkers(
    final Canvas canvas,
    final Size size,
    final Offset center,
    final double radius,
  ) {
    const outerTextStyle = TextStyle(
      color: Colors.black87,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
    const innerTextStyle = TextStyle(
      // Defined for consistency, even if only used in 24h mode
      color: Colors.black54,
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
    final tickPaint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 2;
    final longTickPaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 3;

    // Draw Ticks (standard 12 positions for all modes)
    for (int i = 1; i <= 12; i++) {
      final angle = (i / 12.0) * 2 * math.pi - (math.pi / 2);
      final isMajorTick = i % 3 == 0;
      final tickStartFactor = isMajorTick ? 0.85 : 0.9;
      const tickEndFactor = 0.95;

      final tickStartX = center.dx + radius * tickStartFactor * math.cos(angle);
      final tickStartY = center.dy + radius * tickStartFactor * math.sin(angle);
      final tickEndX = center.dx + radius * tickEndFactor * math.cos(angle);
      final tickEndY = center.dy + radius * tickEndFactor * math.sin(angle);
      canvas.drawLine(
        Offset(tickStartX, tickStartY),
        Offset(tickEndX, tickEndY),
        isMajorTick ? longTickPaint : tickPaint,
      );
    }

    // Draw Numbers based on format
    if (is24HourFormat) {
      // Outer Numbers (00-11)
      for (int hourVal = 0; hourVal <= 11; hourVal++) {
        // Determine the 1-12 clock position for angle calculation
        // hourVal 0 is at 12's position, 1 at 1's position, ..., 11 at 11's position
        final int angleClockPosition = (hourVal == 0) ? 12 : hourVal;
        final angle = (angleClockPosition / 12.0) * 2 * math.pi - (math.pi / 2);
        final String text = hourVal.toString().padLeft(2, '0');

        final textSpan = TextSpan(text: text, style: outerTextStyle);
        final textPainter = TextPainter(
          text: textSpan,
          textAlign: TextAlign.center,
          textDirection: ui.TextDirection.ltr,
        );
        textPainter.layout();
        final numberX =
            center.dx + radius * 0.75 * math.cos(angle) - textPainter.width / 2;
        final numberY = center.dy +
            radius * 0.75 * math.sin(angle) -
            textPainter.height / 2;
        textPainter.paint(canvas, Offset(numberX, numberY));
      }

      // Inner Numbers (12-23)
      for (int hourVal = 12; hourVal <= 23; hourVal++) {
        // Determine the 1-12 clock position for angle calculation
        // hourVal 12 is at 12's position, 13 at 1's position, ..., 23 at 11's position
        final int angleClockPosition = (hourVal == 12) ? 12 : (hourVal % 12);
        final angle = (angleClockPosition / 12.0) * 2 * math.pi - (math.pi / 2);
        final String text = hourVal.toString();

        final textSpan = TextSpan(text: text, style: innerTextStyle);
        final textPainter = TextPainter(
          text: textSpan,
          textAlign: TextAlign.center,
          textDirection: ui.TextDirection.ltr,
        );
        textPainter.layout();
        final numberX = center.dx +
            radius * 0.55 * math.cos(angle) - // Inner radius
            textPainter.width / 2;
        final numberY = center.dy +
            radius * 0.55 * math.sin(angle) - // Inner radius
            textPainter.height / 2;
        textPainter.paint(canvas, Offset(numberX, numberY));
      }
    } else {
      // 12-hour format
      // Outer Numbers (1-12)
      for (int hourVal = 1; hourVal <= 12; hourVal++) {
        final angle = (hourVal / 12.0) * 2 * math.pi - (math.pi / 2);
        final String text = hourVal.toString();

        final textSpan = TextSpan(text: text, style: outerTextStyle);
        final textPainter = TextPainter(
          text: textSpan,
          textAlign: TextAlign.center,
          textDirection: ui.TextDirection.ltr,
        );
        textPainter.layout();
        final numberX =
            center.dx + radius * 0.75 * math.cos(angle) - textPainter.width / 2;
        final numberY = center.dy +
            radius * 0.75 * math.sin(angle) -
            textPainter.height / 2;
        textPainter.paint(canvas, Offset(numberX, numberY));
      }
    }
  }

  void _drawHourHighlight(
    final BuildContext context,
    final Canvas canvas,
    final Size size,
    final Offset center,
    final double radius,
  ) {
    final int currentHour24 = time.hour; // Actual 0-23 hour
    double highlightRingRadiusFactor;
    int clockFaceHourForAngle; // The 1-12 value used for positioning on the clock face

    if (is24HourFormat) {
      if (currentHour24 >= 0 && currentHour24 <= 11) {
        // Outer ring: 0-11
        highlightRingRadiusFactor = 0.75; // Outer ring radius factor
        clockFaceHourForAngle =
            (currentHour24 == 0) ? 12 : currentHour24; // 0 is at 12's position
      } else {
        // Inner ring: 12-23
        highlightRingRadiusFactor = 0.55; // Inner ring radius factor
        clockFaceHourForAngle = (currentHour24 == 12)
            ? 12
            : (currentHour24 % 12); // 12 is at 12's position, 13 at 1's, etc.
      }
    } else {
      // 12-hour format
      highlightRingRadiusFactor = 0.75; // Outer ring for 12h mode
      clockFaceHourForAngle = time.hourOfPeriod;
      if (clockFaceHourForAngle == 0) {
        clockFaceHourForAngle = 12; // 12 AM or 12 PM
      }
    }

    final angle = (clockFaceHourForAngle / 12.0) * 2 * math.pi - (math.pi / 2);
    final highlightDotRadius = radius * 0.15;
    final highlightX =
        center.dx + radius * highlightRingRadiusFactor * math.cos(angle);
    final highlightY =
        center.dy + radius * highlightRingRadiusFactor * math.sin(angle);
    final highlightPaint = Paint()
      ..color = Theme.of(context).colorScheme.primary.withValues(alpha: 0.5);
    canvas.drawCircle(
      Offset(highlightX, highlightY),
      highlightDotRadius,
      highlightPaint,
    );
  }

  void _drawMinuteMarkers(
    final Canvas canvas,
    final Size size,
    final Offset center,
    final double radius,
  ) {
    final textStyle = TextStyle(
      color: Colors.black87,
      fontSize: minuteInterval <= 5 ? 12 : 14,
      fontWeight: FontWeight.w600,
    );
    final tickPaint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 1.5;
    final longTickPaint = Paint()
      ..color = Colors.black87
      ..strokeWidth = 2.5;

    for (int i = 0; i < 60; i += minuteInterval) {
      final angle = (i / 60.0) * 2 * math.pi - (math.pi / 2);
      final isMajorTick = i % 15 == 0; // Longer ticks for 0, 15, 30, 45
      final showNumber =
          i % 5 == 0; // Show numbers for every 5th minute if interval allows

      final tickStartFactor = isMajorTick ? 0.85 : 0.9;
      const tickEndFactor = 0.95;
      final tickStartX = center.dx + radius * tickStartFactor * math.cos(angle);
      final tickStartY = center.dy + radius * tickStartFactor * math.sin(angle);
      final tickEndX = center.dx + radius * tickEndFactor * math.cos(angle);
      final tickEndY = center.dy + radius * tickEndFactor * math.sin(angle);
      canvas.drawLine(
        Offset(tickStartX, tickStartY),
        Offset(tickEndX, tickEndY),
        isMajorTick ? longTickPaint : tickPaint,
      );

      if (showNumber || minuteInterval > 5) {
        // Ensure numbers are shown if interval is large
        final textSpan =
            TextSpan(text: i.toString().padLeft(2, '0'), style: textStyle);
        final textPainter = TextPainter(
          text: textSpan,
          textAlign: TextAlign.center,
          textDirection: ui.TextDirection.ltr,
        );
        textPainter.layout();
        final numberX =
            center.dx + radius * 0.75 * math.cos(angle) - textPainter.width / 2;
        final numberY = center.dy +
            radius * 0.75 * math.sin(angle) -
            textPainter.height / 2;
        textPainter.paint(canvas, Offset(numberX, numberY));
      }
    }
  }

  void _drawMinuteHighlight(
    final Canvas canvas,
    final Size size,
    final Offset center,
    final double radius,
  ) {
    final minuteAngle = (time.minute / 60.0) * 2 * math.pi - (math.pi / 2);
    final highlightRadius =
        radius * 0.12; // Slightly smaller highlight for minutes
    final highlightX = center.dx + radius * 0.75 * math.cos(minuteAngle);
    final highlightY = center.dy + radius * 0.75 * math.sin(minuteAngle);
    final highlightPaint = Paint()
      ..color = Theme.of(context).colorScheme.primary.withValues(alpha: 0.5);
    canvas.drawCircle(
      Offset(highlightX, highlightY),
      highlightRadius,
      highlightPaint,
    );
  }

  void _drawHands(
    final Canvas canvas,
    final Size size,
    final Offset center,
    final double radius,
  ) {
    // Hour hand
    final hourHandPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;
    double currentHourForHand = time.hour % 12 + time.minute / 60.0;
    if (currentHourForHand == 0) {
      currentHourForHand = 12;
    }
    final hourAngle = (currentHourForHand / 12.0) * 2 * math.pi - (math.pi / 2);
    final hourHandLength = radius * 0.5;
    final hourHandX = center.dx + hourHandLength * math.cos(hourAngle);
    final hourHandY = center.dy + hourHandLength * math.sin(hourAngle);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandPaint);

    // Minute hand
    final minuteHandPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;
    final minuteAngle = (time.minute / 60.0) * 2 * math.pi - (math.pi / 2);
    final minuteHandLength = radius * 0.75;
    final minuteHandX = center.dx + minuteHandLength * math.cos(minuteAngle);
    final minuteHandY = center.dy + minuteHandLength * math.sin(minuteAngle);
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), minuteHandPaint);

    // Center dot
    final centerDotPaint = Paint()..color = Colors.red;
    canvas.drawCircle(center, radius * 0.05, centerDotPaint);
  }

  @override
  bool shouldRepaint(covariant final ClockPainter oldDelegate) {
    return oldDelegate.time != time ||
        oldDelegate.is24HourFormat != is24HourFormat ||
        oldDelegate.activeTarget != activeTarget ||
        oldDelegate.hourInterval != hourInterval ||
        oldDelegate.minuteInterval != minuteInterval;
  }
}

// Helper widget for displaying Hour/Minute parts
class _TimeDisplayPart extends StatelessWidget {
  const _TimeDisplayPart({required this.text, required this.isActive});
  final String text;
  final bool isActive;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)
            : Colors.grey.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold,
          color:
              isActive ? Theme.of(context).colorScheme.primary : Colors.black,
        ),
      ),
    );
  }
}

// Helper widget for AM/PM buttons
class _AmPmButton extends StatelessWidget {
  const _AmPmButton({
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: 60,
      height: 40,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected
              ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.3)
              : Colors.transparent,
          side: BorderSide(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.black54,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
