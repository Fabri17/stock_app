import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi there! 👋",
                style: Styles.heading4(),
              ),
              const SizedBox(height: 8),
              Text(
                "Welcome to Stock App",
                style: Styles.paragraphOne(),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => context.push('/graph'),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: CustomColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.stacked_line_chart,
              size: 24,
              color: CustomColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
