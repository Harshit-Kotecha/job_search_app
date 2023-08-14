import 'package:flutter/material.dart';

class OtpButton extends StatelessWidget {
  const OtpButton({
    super.key,
    required this.controller,
    required this.autoFocus,
  });

  final TextEditingController controller;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 40,
      child: TextField(
        cursorColor: Theme.of(context).primaryColor,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 2,
            vertical: 2,
          ),
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        onChanged: (value) {
          // if()
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
