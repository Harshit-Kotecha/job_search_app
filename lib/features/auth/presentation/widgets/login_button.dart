import 'package:flutter/material.dart';
import 'package:job_search_app/constants/dimensions.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.loginText,
    required this.onTapButton,
  });

  final String loginText;
  final Function onTapButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapButton(),
      child: Container(
        width: width(context),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .copyWith(
                primaryColor: const Color(
                  0xFF356899,
                ),
              )
              .primaryColor,
          borderRadius: BorderRadius.circular(
            scaleRadius(5, context),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[50]!,
              blurRadius: scaleRadius(10, context),
              spreadRadius: scaleRadius(4, context),
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(48, context),
            vertical: scaleHeight(16, context),
          ),
          child: Text(
            loginText,
            style: TextStyle(
              fontFamily: 'NotoSans',
              fontSize: scaleWidth(16, context),
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
