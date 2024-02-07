import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_app/core/constants/constants.dart';

class StockWatchList extends StatefulWidget {
  const StockWatchList({super.key});

  @override
  State<StockWatchList> createState() => _StockWatchListState();
}

class _StockWatchListState extends State<StockWatchList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Watchlist",
              style: Styles.heading6(),
            ),
            const Spacer(),
            InkWell(
              onTap: () => context.push('/add-alert'),
              child: Text(
                "Add Alert",
                style: Styles.paragraphTwo(),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.add,
              size: 16,
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
