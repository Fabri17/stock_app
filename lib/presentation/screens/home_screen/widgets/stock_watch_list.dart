import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/styles.dart';

import 'stock_watch_list_empty_view.dart';

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
          ],
        ),
        const SizedBox(height: 16),
        const StockWatchListEmptyView(),
      ],
    );
  }
}
