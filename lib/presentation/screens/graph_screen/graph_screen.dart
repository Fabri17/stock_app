import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stocks Graph',
          style: Styles.heading6(),
        ),
      ),
    );
  }
}
