import 'package:flutter/material.dart';

class CommonAppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? height;
  const CommonAppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
