import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';

class StockWatchListEmptyView extends StatelessWidget {
  const StockWatchListEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CustomColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(
            Icons.insert_chart_outlined,
            size: 48,
            color: CustomColors.black500.withOpacity(0.6),
          ),
          const SizedBox(height: 8),
          Text(
            "You don't have any stocks yet",
            style: Styles.subtitleTwo(),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Add a stock to your watchlist to see it here.",
            style: Styles.paragraphTwo(
              color: CustomColors.black500.withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
