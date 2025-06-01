
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String hintText;
  final void Function(String) onChanged;

  const SearchBar({
    Key? key,
    this.hintText = "Find...",
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: const Icon(Icons.search),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: const BorderSide(
              color: Colors.black,
              width: 3,
            ),
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
