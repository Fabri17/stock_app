import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/utils/utils.dart';
import '../../../../domain/entities/alert.dart';

class StockWatchListItem extends StatelessWidget {
  const StockWatchListItem({super.key, required this.alert});

  final Alert alert;

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
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.stockSymbol,
                  style: Styles.subtitleOne(),
                ),
                const SizedBox(height: 4),
                Text(
                  "Alert Price: ${Formatters.currency(alert.alertPrice)}",
                  style: Styles.subtitleTwo(),
                ),
              ],
            ),
          ),
          Text(
            alert.lastPrice == 0
                ? "Loading..."
                : Formatters.currency(alert.lastPrice),
            style: Styles.subtitleOne(),
          ),
        ],
      ),
    );
  }
}
