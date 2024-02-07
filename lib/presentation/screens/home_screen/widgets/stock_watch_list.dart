import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/styles.dart';

import '../../../../domain/entities/entities.dart';
import '../../../blocs/blocs.dart';
import 'stock_watch_list_empty_view.dart';

class StockWatchList extends StatefulWidget {
  const StockWatchList({super.key});

  @override
  State<StockWatchList> createState() => _StockWatchListState();
}

class _StockWatchListState extends State<StockWatchList> {
  @override
  Widget build(BuildContext context) {
    final alertBloc = context.watch<AlertBloc>();

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
        FutureBuilder(
          future: alertBloc.getAlerts(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Alert>> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text("Failed to load alerts"),
              );
            }

            if (snapshot.hasData && snapshot.data!.isEmpty) {
              return const StockWatchListEmptyView();
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final alert = snapshot.data![index];
                return ListTile(
                  title: Text(alert.stockSymbol),
                  subtitle: Text(alert.alertPrice.toString()),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
