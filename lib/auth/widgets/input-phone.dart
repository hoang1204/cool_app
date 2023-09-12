import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputPhone extends StatelessWidget {
  InputPhone({
    super.key,
    required this.controller,
    required this.hint,
  });

  TextEditingController? controller;
  String? hint;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty || value.length < 10) {
          return 'Phone invalidate';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.3122410774),
          borderSide: const BorderSide(
            color: Color(0xffc0c0c0),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.3122410774),
          borderSide: const BorderSide(
            color: Color(0xffc0c0c0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.3122410774),
          borderSide: const BorderSide(color: Colors.black),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.3122410774),
          borderSide: const BorderSide(
            color: Color(0xffc0c0c0),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      ),
    );
  }
}
