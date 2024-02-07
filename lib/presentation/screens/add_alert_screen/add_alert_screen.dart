import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/styles.dart';

import '../../../domain/entities/entities.dart';
import '../../blocs/blocs.dart';
import '../../widgets/text_input.dart';
import 'widgets/add_alert_widgets.dart';

class AddAlertScreen extends StatefulWidget {
  const AddAlertScreen({super.key});

  @override
  State<AddAlertScreen> createState() => _AddAlertScreenState();
}

class _AddAlertScreenState extends State<AddAlertScreen> {
  final TextEditingController _priceController = TextEditingController();

  String? _selectedStock;

  @override
  Widget build(BuildContext context) {
    final alertBloc = context.read<AlertBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Alert',
          style: Styles.heading6(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StocksDropdownWidget(
              onStockSelected: (stock) {
                _selectedStock = stock;
              },
            ),
            const SizedBox(height: 16),
            TextInput(
              labelText: "Price Alert",
              keyboardType: TextInputType.number,
              controller: _priceController,
            ),
            const SizedBox(height: 8),
            Text(
              "Price Alert is the price at which you want to be notified.",
              style: Styles.captionOne(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => _performAddAlert(alertBloc),
                child: Text(
                  "Add Alert",
                  style: Styles.subtitleTwo(),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  _performAddAlert(AlertBloc alertBloc) async {
    if (_selectedStock == null) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          content: Text(
            "Stock Symbol is required",
            style: Styles.subtitleTwo(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
            ),
          ],
        ),
      );
      return;
    }

    if (_priceController.text.isEmpty || _priceController.text == "0") {
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          content: Text(
            "Price Alert is required and cannot be 0",
            style: Styles.subtitleTwo(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
            ),
          ],
        ),
      );
      return;
    }

    final price = double.tryParse(_priceController.text);
    if (price == null) {
      ScaffoldMessenger.of(context).showMaterialBanner(
        MaterialBanner(
          content: Text(
            "Price Alert must be a valid number",
            style: Styles.subtitleTwo(),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              },
            ),
          ],
        ),
      );
      return;
    }

    final alert = Alert(
      stockSymbol: _selectedStock!,
      alertPrice: price,
    );

    alertBloc.addAlert(alert).then(
      (_) {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Alert added successfully",
              style: Styles.subtitleTwo(),
            ),
          ),
        );
      },
    );
  }
}
