import 'package:flutter/material.dart';
import '../../../widgets/text_input.dart';

import 'add_alert_widgets.dart';

class StocksDropdownWidget extends StatefulWidget {
  const StocksDropdownWidget({
    super.key,
    required this.onStockSelected,
  });

  final Function(String?) onStockSelected;

  @override
  State<StocksDropdownWidget> createState() => _StocksDropdownWidgetState();
}

class _StocksDropdownWidgetState extends State<StocksDropdownWidget> {
  final TextEditingController _stockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextInput(
        controller: _stockController,
        labelText: 'Select a stock',
        readOnly: true,
        onTap: () => _showStocksDialog(context),
      ),
    );
  }

  _showStocksDialog(BuildContext context) {
    showBottomSheet(
      context: context,
      enableDrag: true,
      builder: (context) {
        return SelectStockDialog(
          onStockSelected: (stock) {
            _stockController.text = stock ?? '';
            widget.onStockSelected(stock);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
