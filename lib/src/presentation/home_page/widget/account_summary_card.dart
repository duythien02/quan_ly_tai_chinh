// lib/src/presentation/home_page/widget/account_summary_card.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../domain/entities/entities.dart';

class AccountSummaryCard extends StatelessWidget {
  const AccountSummaryCard({
    super.key,
    this.account,
  });

  final AccountDocs? account;

  @override
  Widget build(final BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final currencyFormatter = NumberFormat.currency(
      locale: locale,
      symbol: '₫',
    );

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.account_balance_wallet_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  account?.accountName ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Số dư
            Text(
              'Tổng số dư',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withValues(alpha: 0.8),
              ),
            ),
            Text(
              currencyFormatter.format(account?.currentBalance ?? 0),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            // Vạch ngăn cách
            Divider(color: Colors.black.withValues(alpha: 0.2)),
            const SizedBox(height: 16),
            // Thu nhập và Chi tiêu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIncomeExpenseItem(
                  title: 'Thu nhập',
                  amount: account?.totalIncome ?? 0,
                  color: const Color(0xFF4CAF50), // Màu xanh lá cây
                  icon: Icons.arrow_downward_rounded,
                  currencyFormatter: currencyFormatter,
                ),
                _buildIncomeExpenseItem(
                  title: 'Chi tiêu',
                  amount: account?.totalExpense ?? 0,
                  color: const Color(0xFFF44336), // Màu đỏ
                  icon: Icons.arrow_upward_rounded,
                  currencyFormatter: currencyFormatter,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncomeExpenseItem({
    required final String title,
    required final double amount,
    required final Color color,
    required final IconData icon,
    required final NumberFormat currencyFormatter,
  }) {
    return Row(
      children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.white.withValues(alpha: 0.9),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withValues(alpha: 0.8),
              ),
            ),
            Text(
              currencyFormatter.format(amount),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
