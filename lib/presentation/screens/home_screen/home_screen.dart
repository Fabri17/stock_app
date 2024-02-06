import 'package:flutter/material.dart';

import 'widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: const [
            HomeHeader(),
            SizedBox(height: 24),
            StockWatchList(),
          ],
        ),
      ),
    );
  }
}
