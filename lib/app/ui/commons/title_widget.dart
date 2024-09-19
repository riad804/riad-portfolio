import 'package:flutter/material.dart';
import 'package:portfolio_client/library/resource/app_typography.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.blue,
        width: 2,
      ))),
      child: Text(title, style: AppText.h3b),
    );
  }
}
