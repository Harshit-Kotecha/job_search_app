import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:job_search_app/features/auth/presentation/widgets/login_button.dart';
import 'package:job_search_app/features/auth/presentation/widgets/text_fields.dart';
import 'package:job_search_app/features/widgets/vetical_space.dart';
import 'package:job_search_app/constants/assets_location.dart';
import 'package:job_search_app/themes/font_styles.dart';
import 'package:job_search_app/constants/strings.dart';
import 'package:job_search_app/features/auth/data/controllers/validation.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              VerticalSpace(value: 74.73, ctx: context),
              SvgPicture.asset(Assets.splashSvg),
              VerticalSpace(value: 21.73, ctx: context),
              const Text(
                StaticText.resetPassword,
                style: FontStyles.boldStyle,
                textAlign: TextAlign.center,
              ),
              VerticalSpace(value: 16, ctx: context),
              const Text(
                StaticText.resetPasswordFullText,
                style: FontStyles.lightStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 128.27,
              ),
              CustomTextField(
                hintText: StaticText.newPassword,
                textIcon: Assets.passwordSvg,
                isPassword: true,
                textType: TextInputType.visiblePassword,
                controller: _newPasswordController,
                isErrorfull: false,
                inputType: InputType.password,
                formKey: _formKey,
              ),
              VerticalSpace(value: 16, ctx: context),
              CustomTextField(
                hintText: StaticText.confirmNewPassword,
                textIcon: Assets.passwordSvg,
                isPassword: true,
                textType: TextInputType.visiblePassword,
                controller: _confirmNewPasswordController,
                isErrorfull: false,
                inputType: InputType.confirmPassword,
                formKey: _formKey,
              ),
              VerticalSpace(value: 128, ctx: context),
              LoginButton(
                loginText: StaticText.resetPassword,
                onTapButton: () {},
              ),
              VerticalSpace(value: 48, ctx: context),
            ],
          ),
        ),
      ),
    );
  }
}
