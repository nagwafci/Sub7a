import 'package:flutter/material.dart';

class Count extends StatelessWidget {
  final String count;
  const Count({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        count,
        style: const TextStyle(
          fontFamily: "arb",
          fontSize: 20,
        ),
      ),
    );
  }
}
