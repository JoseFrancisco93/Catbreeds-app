import 'package:catbreeds_app/presentation/models/bold_text_item.dart';
import 'package:flutter/material.dart';

class BoldRowText extends StatelessWidget {
  final List<BoldTextItem> items;
  final MainAxisAlignment alignment;
  final double? fontSize;
  final Color? color;

  const BoldRowText({
    Key? key,
    required this.items,
    this.alignment = MainAxisAlignment.spaceBetween,
    this.fontSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize ?? 16,
      color: color ?? Colors.black,
    );

    return Row(
      mainAxisAlignment: alignment,
      children: items.map((item) {
        final style = item.style ?? defaultStyle;
        Widget textWidget = Text(item.text, style: style);

        if (item.onTap != null) {
          textWidget = GestureDetector(
            onTap: item.onTap,
            child: Text(
              item.text,
              style: style.copyWith(
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          );
        }

        return Flexible(child: textWidget);
      }).toList(),
    );
  }
}
