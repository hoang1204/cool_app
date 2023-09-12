import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class InputPassword extends StatelessWidget {
  const InputPassword({
    super.key,
    required this.passwordController,
    required this.isObsecured,
  });

  final TextEditingController passwordController;
  final RxBool isObsecured;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: passwordController,
        obscureText: isObsecured.value,
        validator: (value) {
          if (value!.isEmpty || value.length < 6) {
            return 'Password must be over 6 characters';
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: Obx(
            () => InkWell(
              onTap: () {
                isObsecured.value = !isObsecured.value;
              },
              child: Icon(
                isObsecured.value ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
            ),
          ),
          hintText: 'Enter your password',
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.3122410774),
            borderSide: const BorderSide(color: Color(0xffc0c0c0)),
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
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        ),
      ),
    );
  }
}
