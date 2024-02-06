import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';
import '../../../blocs/blocs.dart';

class StockWatchListEmptyView extends StatelessWidget {
  const StockWatchListEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>().state;
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
            color: themeCubit.isDarkMode
                ? CustomColors.primary.withAlpha(300)
                : CustomColors.black500,
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
            style: Styles.paragraphTwo(),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
