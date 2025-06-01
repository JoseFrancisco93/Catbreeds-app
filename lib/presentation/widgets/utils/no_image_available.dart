import 'package:flutter/material.dart';

class NoImageAvailable extends StatelessWidget {
  const NoImageAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.pets, size: 56, color: Colors.grey),
            SizedBox(height: 8),
            Text(
              "No image available",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
