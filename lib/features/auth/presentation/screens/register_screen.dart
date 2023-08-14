import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search_app/features/auth/data/controllers/auth_functions.dart';
import 'package:job_search_app/features/auth/presentation/widgets/continue_with.dart';
import 'package:job_search_app/features/auth/presentation/widgets/login_button.dart';
import 'package:job_search_app/features/auth/presentation/widgets/text_fields.dart';
import 'package:job_search_app/features/widgets/vetical_space.dart';
import 'package:job_search_app/features/widgets/welcome_text.dart';
import 'package:job_search_app/constants/assets_location.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/constants/strings.dart';
import 'package:job_search_app/features/auth/data/controllers/validation.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isErrorName = false;
  bool isErrorEmail = false;
  bool isErrorPassword = false;
  bool isErrorConfirmPassword = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            scaleWidth(24, context),
            0,
            scaleWidth(24, context),
            0,
          ),
          child: ListView(
            children: [
              VerticalSpace(value: 63, ctx: context),
              // * SPLASH IMG
              Row(
                children: [
                  SvgPicture.asset(Assets.splashSvg),
                ],
              ),
              VerticalSpace(value: 8, ctx: context),
              // * Welcome text
              const WelcomeText(
                welcomePath: Assets.thumbsUpSvg,
                welcomeText: StaticText.registration,
              ),
              VerticalSpace(value: 32, ctx: context),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: StaticText.fullName,
                      textIcon: Assets.profileSvg,
                      isPassword: false,
                      textType: TextInputType.name,
                      controller: _nameController,
                      isErrorfull: isErrorName,
                      inputType: InputType.name,
                      formKey: _formKey,
                    ),
                    VerticalSpace(value: 16, ctx: context),
                    CustomTextField(
                      hintText: StaticText.email,
                      textIcon: Assets.mailOutlineSvg,
                      isPassword: false,
                      textType: TextInputType.emailAddress,
                      controller: _emailController,
                      isErrorfull: isErrorEmail,
                      inputType: InputType.email,
                      formKey: _formKey,
                    ),
                    VerticalSpace(value: 16, ctx: context),
                    CustomTextField(
                      hintText: StaticText.password,
                      textIcon: Assets.passwordSvg,
                      isPassword: true,
                      textType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      isErrorfull: isErrorPassword,
                      inputType: InputType.password,
                      formKey: _formKey,
                    ),
                    VerticalSpace(value: 16, ctx: context),
                    CustomTextField(
                      hintText: StaticText.confirmPassword,
                      textIcon: Assets.passwordSvg,
                      isPassword: true,
                      textType: TextInputType.visiblePassword,
                      controller: _confirmPasswordController,
                      isErrorfull: isErrorConfirmPassword,
                      inputType: InputType.confirmPassword,
                      formKey: _formKey,
                    ),
                    // if (isErrorPassword)
                    //   const ValidationError(errorText: "Passwords don't match"),
                    VerticalSpace(value: 32, ctx: context),
                    LoginButton(
                      loginText: StaticText.register,
                      onTapButton: () => AuthFunctions.registerUser(
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        nameController: _nameController,
                        formKey: _formKey,
                        context: context,
                      ),
                    ),
                  ],
                ),
              ),

              VerticalSpace(
                value: 48,
                ctx: context,
              ),
              const ContinueWithOtherAccounts(
                isLogin: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
