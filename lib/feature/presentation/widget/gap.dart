import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double gap;
  const Gap({super.key, this.gap = 12.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: gap,
      height: gap,
    );
  }
}
