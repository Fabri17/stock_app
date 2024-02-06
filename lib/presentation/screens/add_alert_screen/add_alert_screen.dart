import 'package:flutter/material.dart';
import '../../../core/constants/styles.dart';

import '../../widgets/text_input.dart';

class AddAlertScreen extends StatefulWidget {
  const AddAlertScreen({super.key});

  @override
  State<AddAlertScreen> createState() => _AddAlertScreenState();
}

class _AddAlertScreenState extends State<AddAlertScreen> {
  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 16),
            const TextInput(
              labelText: "Price Alert",
              keyboardType: TextInputType.number,
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
                onPressed: () {},
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
}
