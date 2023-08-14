import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search_app/features/auth/data/controllers/auth_functions.dart';
import 'package:job_search_app/themes/color_styles.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/features/auth/data/controllers/validation.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textIcon,
    required this.isPassword,
    required this.textType,
    required this.controller,
    required this.isErrorfull,
    required this.inputType,
    required this.formKey,
  });

  final String hintText;
  final String textIcon;
  final bool isPassword;
  final TextInputType textType;
  final TextEditingController controller;
  final bool isErrorfull;
  final InputType inputType;
  final GlobalKey<FormState> formKey;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: Colors.black,
      keyboardType: widget.textType,
      validator: (value) {
        final String errMsg =
            AuthFunctions.validateTextField(value, widget.inputType);
        return errMsg.isEmpty ? null : errMsg;
      },
      obscureText: widget.isPassword && !isPasswordVisible,
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom +
            scaleHeight(
              48,
              context,
            ),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: scaleWidth(24, context),
          vertical: scaleHeight(16, context),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            scaleRadius(10, context),
          ),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        prefixStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(
            10,
          ),
          child: SvgPicture.asset(
            widget.textIcon,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                },
                icon: isPasswordVisible
                    ? const Icon(
                        Icons.visibility,
                        color: ColorStyles.darkTitleColor,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: ColorStyles.lightGreyColor,
                      ),
              )
            : const SizedBox(
                height: 0,
                width: 0,
              ),
      ),
    );
  }
}
