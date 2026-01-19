import 'package:flutter/material.dart';
import 'package:music_player/common/helpers/is_dark_mode.dart';

class CommonTextfield extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final bool? obscureText;
  const CommonTextfield({
    super.key,
    required this.labelText,
    required this.controller,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: EdgeInsets.all(30),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: context.isDarkMode ? Colors.white54 : Colors.black54,
          ),
        ),
      ),
    );
  }
}
