// lib/src/presentation/home_page/widget/transaction_chart_section.dart

import 'package:ez_ui/ez_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

import '../../../domain/entities/entities.dart';

class TransactionChartSection extends StatefulWidget {
  const TransactionChartSection({
    super.key,
    required this.rangeKey,
    required this.listTransactionSummaryDocs,
  });
  final String rangeKey;
  final List<TransactionSummaryDocs?> listTransactionSummaryDocs;

  @override
  State<TransactionChartSection> createState() =>
      _TransactionChartSectionState();
}

class _TransactionChartSectionState extends State<TransactionChartSection> {
  List<FlSpot> _generateSampleData() {
    int days = 7;
    if (widget.rangeKey == '1_month') {
      days = 30;
    } else if (widget.rangeKey == '3_months') {
      days = 90;
    }

    if (widget.listTransactionSummaryDocs.length < days) {
      return [];
    }

    return List.generate(days, (final index) {
      final transactionSummary = widget.listTransactionSummaryDocs[index];
      final double totalAmount = (transactionSummary?.totalIncome ?? 0) -
          (transactionSummary?.totalExpense ?? 0);
      return FlSpot(index.toDouble(), totalAmount);
    });
  }

  @override
  Widget build(final BuildContext context) {
    final chartData = _generateSampleData();

    if (chartData.isEmpty) {
      return const ShimmerLoading7();
    }

    final yValues = chartData.map((final spot) => spot.y).toList();
    final minY = yValues.reduce(min);
    final maxY = yValues.reduce(max);

    final verticalPadding = (maxY - minY).abs() * 0.2;
    final finalMinY = minY - (verticalPadding > 0 ? verticalPadding : 100000);
    final finalMaxY = maxY + (verticalPadding > 0 ? verticalPadding : 100000);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(right: 16, left: 8),
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(),
                  topTitles: const AxisTitles(),
                  bottomTitles: _bottomTitles(chartData.length),
                  leftTitles: _leftTitles(finalMinY, finalMaxY),
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: chartData.length.toDouble() - 1,
                minY: finalMinY,
                maxY: finalMaxY,
                lineBarsData: [
                  _mainLineBarData(chartData),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartBarData _mainLineBarData(final List<FlSpot> spots) {
    final primaryColor = Theme.of(context).primaryColor;
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      gradient: LinearGradient(
        colors: [primaryColor.withValues(alpha: 0.8), primaryColor],
      ),
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          colors: [
            primaryColor.withValues(alpha: 0.3),
            primaryColor.withValues(alpha: 0.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  AxisTitles _leftTitles(final double minY, final double maxY) {
    final interval = (maxY - minY) / 5;

    return AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        reservedSize: 55,
        interval: interval > 0 ? interval : null,
        getTitlesWidget: (final value, final meta) {
          if (value == meta.max || value == meta.min) {
            return const SizedBox.shrink();
          }

          final formatter = NumberFormat.compactSimpleCurrency(
            locale: 'vi_VN',
            decimalDigits: 0,
          );

          return Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Text(
              formatter.format(value),
              style: const TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.right,
            ),
          );
        },
      ),
    );
  }

  AxisTitles _bottomTitles(final int totalDays) => AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          interval: (totalDays / 3).floor().toDouble(),
          getTitlesWidget: (final value, final meta) {
            final now = DateTime.now();
            final date =
                now.subtract(Duration(days: (totalDays - 1) - value.toInt()));
            final String text = DateFormat('dd/MM').format(date);

            return SideTitleWidget(
              axisSide: meta.axisSide,
              child: Text(
                text,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            );
          },
        ),
      );
}
