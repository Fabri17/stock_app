import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../../data/models/stock.dart';

import '../../../../core/utils/utils.dart';

class StockWatchListItem extends StatelessWidget {
  const StockWatchListItem({super.key, required this.stock});

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: CustomColors.black500.withOpacity(0.2),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
