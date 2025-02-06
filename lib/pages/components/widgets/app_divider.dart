import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? thickness;

  const AppDivider({
    super.key,
    this.padding,
    this.color,
    this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: padding ?? EdgeInsets.zero),
        Divider(
          thickness: thickness ?? 16,
          color: color ?? Colors.grey.shade300,
        ),
      ],
    );
    ;
  }
}
