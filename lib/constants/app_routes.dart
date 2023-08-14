import 'package:flutter/material.dart';
import 'package:job_search_app/constants/named_routes.dart';
import 'package:job_search_app/features/auth/presentation/screens/forgot_password.dart';
import 'package:job_search_app/features/auth/presentation/screens/login_screen.dart';
import 'package:job_search_app/features/auth/presentation/screens/register_screen.dart';
import 'package:job_search_app/features/auth/presentation/screens/reset_password.dart';
import 'package:job_search_app/features/home/home_screen.dart';
import 'package:job_search_app/utils/splash_screen.dart';
import 'package:job_search_app/utils/success_screen.dart';
import 'package:job_search_app/features/auth/presentation/screens/verify_code.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, WidgetBuilder> routes() {
    return {
      NamedRoutes.splashScreen: (context) => const SplashScreen(),
      NamedRoutes.logIn: (context) => const LogIn(),
      NamedRoutes.registerScreen: (context) => const RegisterScreen(),
      NamedRoutes.forgotPassword: (context) => const ForgotPassword(),
      NamedRoutes.successScreen: (context) => const SuccessScreen(),
      NamedRoutes.resetPassword: (context) => ResetPassword(),
      NamedRoutes.verifyCode: (context) => const VerifyCode(),
      NamedRoutes.homeScreen: (context) => const HomeScreen(),
    };
  }
}
