import 'package:flutter/material.dart';

class BoldTextItem {
  final String text;
  final VoidCallback? onTap;
  final TextStyle? style;

  BoldTextItem({
    required this.text,
    this.onTap,
    this.style,
  });
}
