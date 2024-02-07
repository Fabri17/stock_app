import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/constants.dart';
import 'home_widgets.dart';

import '../../../blocs/blocs.dart';

class StockWatchList extends StatefulWidget {
  const StockWatchList({super.key});

  @override
  State<StockWatchList> createState() => _StockWatchListState();
}

class _StockWatchListState extends State<StockWatchList> {
  @override
  void initState() {
    super.initState();
    context.read<AlertBloc>().getAlerts();
    context.read<AlertBloc>().closeConnection();
  }

  @override
  void dispose() {
    context.read<AlertBloc>().close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "Watchlist",
              style: Styles.heading5(),
            ),
            const Spacer(),
            InkWell(
              onTap: () => context.push('/add-alert'),
              child: Text(
                "Add Alert",
                style: Styles.paragraphOne(),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.add,
              size: 18,
            ),
          ],
        ),
        const SizedBox(height: 24),
        BlocBuilder<AlertBloc, AlertState>(
          builder: (context, state) {
            final alerts = state.alerts;

            if (alerts.isEmpty) {
              return const StockWatchListEmptyView();
            }

            return Column(
              children: alerts
                  .map(
                    (alert) => StockWatchListItem(alert: alert),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
