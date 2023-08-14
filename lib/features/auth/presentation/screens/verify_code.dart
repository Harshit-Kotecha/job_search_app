import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:job_search_app/features/auth/data/controllers/auth_functions.dart';
import 'package:job_search_app/features/auth/presentation/widgets/login_button.dart';
import 'package:job_search_app/features/widgets/otp_button.dart';
import 'package:job_search_app/features/widgets/svg_banner.dart';
import 'package:job_search_app/themes/font_styles.dart';
import 'package:job_search_app/constants/strings.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final TextEditingController _field1 = TextEditingController();
  final TextEditingController _field2 = TextEditingController();
  final TextEditingController _field3 = TextEditingController();
  final TextEditingController _field4 = TextEditingController();
  final TextEditingController _field5 = TextEditingController();
  final TextEditingController _field6 = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  // TO SHOW LOADER
  // ignore: unused_field
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final String? realOtp =
        ModalRoute.of(context)?.settings.arguments as String?;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 96,
              ),
              const SvgBanner(),
              const SizedBox(
                height: 21.73,
              ),
              const Text(
                'Verify Code',
                textAlign: TextAlign.center,
                style: FontStyles.boldStyle,
              ),
              const SizedBox(
                height: 17,
              ),
              const Text(
                StaticText.enterOtpOnPhone,
                textAlign: TextAlign.center,
                style: FontStyles.lightStyle,
              ),
              const SizedBox(
                height: 120,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OtpButton(controller: _field1, autoFocus: true),
                  OtpButton(controller: _field2, autoFocus: false),
                  OtpButton(controller: _field3, autoFocus: false),
                  OtpButton(controller: _field4, autoFocus: false),
                  OtpButton(controller: _field5, autoFocus: false),
                  OtpButton(controller: _field6, autoFocus: false),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              LoginButton(
                loginText: StaticText.verifyCode,
                onTapButton: () async {
                  setState(() {
                    _isLoading = true;
                  });

                  await AuthFunctions.onVerifyCode(
                    otp: getOtp(),
                    realOtp: realOtp,
                    context: context,
                    auth: auth,
                  );

                  setState(() {
                    _isLoading = false;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String getOtp() {
    final String otp = _field1.text +
        _field2.text +
        _field3.text +
        _field4.text +
        _field5.text +
        _field6.text;

    return otp.trim();
  }
}
