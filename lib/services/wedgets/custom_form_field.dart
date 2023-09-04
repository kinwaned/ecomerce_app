import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key,
    required this.hintText,this.onChanged,this.keyboardKey
  });

  final String hintText;
  final void Function(String?)? onChanged;
  TextInputType? keyboardKey;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardKey,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }
}