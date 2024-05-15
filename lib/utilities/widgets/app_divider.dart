import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final double thickness;
  final Color color;

  const AppDivider({
    Key? key,
    this.thickness = .5,
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Divider(
        thickness: thickness,
        color: color,
      ),
    );
  }
}
