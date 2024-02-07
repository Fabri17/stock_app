import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_app/core/constants/constants.dart';

import '../../../blocs/blocs.dart';

class SelectStockDialog extends StatelessWidget {
  const SelectStockDialog({super.key, required this.onStockSelected});

  final Function(String?) onStockSelected;

  @override
  Widget build(BuildContext context) {
    final stocksBloc = context.watch<StocksBloc>();

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Text(
                    'Select a stock to add an alert for',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          FutureBuilder(
            initialData: stocksBloc.state.stocks,
            future: stocksBloc.fetchStockSymbols(AppConstants.defaultExchange),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: Styles.paragraphOne(),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: stocksBloc.state.stocks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        stocksBloc.state.stocks[index].symbol ?? '',
                        style: Styles.heading6(),
                      ),
                      subtitle: Text(
                        stocksBloc.state.stocks[index].description ?? '',
                        style: Styles.paragraphTwo(),
                      ),
                      onTap: () => onStockSelected(
                        stocksBloc.state.stocks[index].symbol,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
