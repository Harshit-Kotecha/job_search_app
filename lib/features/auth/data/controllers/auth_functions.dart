import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_search_app/constants/route_functions.dart';
import '../../../../constants/named_routes.dart';
import '../../../../constants/strings.dart';
import 'validation.dart';
import '../../../widgets/failure_snack_bar.dart';
import '../services/firebase/auth_service.dart';

class AuthFunctions {
  AuthFunctions._();

  // Function to login user
  static Future<void> loginUser({
    required TextEditingController emailController,
    required TextEditingController passWordController,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    // Remove focus from keyboard
    FocusManager.instance.primaryFocus?.unfocus();

    // Validation of inputs
    if (formKey.currentState!.validate() == false) {
      // emailController.text = passWordController.text = '';

      return;
    }

    // Use firebase for authentication
    final String? message = await AuthService().login(
      email: emailController.text,
      password: passWordController.text,
    );
    if (message != null && message.contains(ErrorText.success)) {
      emailController.text = passWordController.text = '';

      AppRoute.offNamedUntil(NamedRoutes.mainScreen);
    } else if (message!.contains(ErrorText.invalidEmail) ||
        message.contains(ErrorText.userNotFound)) {
      failureBar(StaticText.userNotFound, context);
    } else if (message.contains(ErrorText.wrongPassword)) {
      failureBar(ErrorText.wrongPassword, context);
      // emailController.text = passWordController.text = '';
    } else {
      failureBar(ErrorText.invalidCredentials, context);
      // emailController.text = passWordController.text = '';
    }
  }

  // REGISTER USER
  static Future<void> registerUser({
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
    required TextEditingController nameController,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate() == false ||
        passwordController.text != confirmPasswordController.text) {
      // emailController.text = passwordController.text =
      //     confirmPasswordController.text = nameController.text = '';
      failureBar(ErrorText.passwordsNotMatch, context);
      return;
    }
    // Firebase Authentication
    final String? message = await AuthService().registration(
      email: emailController.text,
      password: passwordController.text,
    );

    if (passwordController.text == confirmPasswordController.text &&
        nameController.text.isNotEmpty &&
        message != null &&
        message.contains(ErrorText.success)) {
      emailController.text = passwordController.text =
          confirmPasswordController.text = nameController.text = '';

      // Navigator.pushNamedAndRemoveUntil(
      //   context,
      //   NamedRoutes.homeScreen,
      //   (route) => false,
      // );
      AppRoute.offNamedUntil(NamedRoutes.mainScreen);
    } else if (message!.contains(ErrorText.emailInUse)) {
      failureBar(ErrorText.emailInUse, context);
    } else if (message.contains(ErrorText.operationNotAllowed)) {
      failureBar(ErrorText.operationNotAllowed, context);
    } else if (message.contains(ErrorText.weakPassword)) {
      failureBar(ErrorText.weakPassword, context);
    } else {
      failureBar(ErrorText.invalidCredentials, context);
      emailController.text = passwordController.text =
          confirmPasswordController.text = nameController.text = '';
    }
  }

  // VERIFY CODE
  static Future<void> onVerifyCode({
    required String otp,
    required String? realOtp,
    required BuildContext context,
    required FirebaseAuth auth,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();

    try {
      if (otp.length != 6 || realOtp == null) {
        failureBar(ErrorText.enterCorrectOtp, context);
        return;
      }
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: realOtp,
        smsCode: otp,
      );

      await auth.signInWithCredential(credential);
      AppRoute.offNamedUntil(NamedRoutes.homeScreen);
    } catch (e) {
      failureBar(ErrorText.enterCorrectOtp, context);
      return;
    }
  }

  static Future<void> signOutUser(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    AppRoute.offNamedUntil(NamedRoutes.logIn);
  }

  // SENDING OTP
  static Future<void> onClickSendCode({
    required TextEditingController mobileController,
    required BuildContext context,
  }) async {
    if (mobileController.text.length != 10) {
      failureBar(StaticText.invalidPhoneNo, context);
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();

    await AuthService().registerUserWithPhone(
      mobileController.text,
      context,
    );
  }

  // VALIDATE TEXT FIELD
  static String validateTextField(String? value, InputType inputType) {
    switch (inputType) {
      case InputType.email:
        {
          if (value == null) {
            return "";
          } else if (!Validation.isValidEmail(value)) {
            return value.isEmpty
                ? ErrorText.emptyEmail
                : ErrorText.enterValidEmail;
          }
          break;
        }
      case InputType.password || InputType.confirmPassword:
        {
          if (value == null || value.isEmpty) {
            return "";
          } else if (value.length < 8) {
            return ErrorText.shortLength;
          } else if (!RegExp(r'[^\w\s]').hasMatch(value)) {
            return ErrorText.specialCharacter;
          } else if (!RegExp(r'[a-z]').hasMatch(value)) {
            return ErrorText.lowerCase;
          } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
            return ErrorText.upperCase;
          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
            return ErrorText.containNumber;
          }
          break;
        }
      case InputType.name:
        {
          if (!Validation.isValidName(value!)) {
            return ErrorText.enterValidName;
          }
          break;
        }
      default:
        return "";
    }
    return "";
  }
}
