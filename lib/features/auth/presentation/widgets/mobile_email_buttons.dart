import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:job_search_app/constants/strings.dart';
import 'package:job_search_app/themes/color_styles.dart';
import 'package:job_search_app/constants/dimensions.dart';
import 'package:job_search_app/constants/assets_location.dart';
import 'package:job_search_app/features/auth/presentation/widgets/text_fields.dart';
import 'package:job_search_app/features/auth/data/controllers/validation.dart';

class PassMailButton extends StatefulWidget {
  const PassMailButton({super.key, required this.resetController});

  final TextEditingController resetController;

  @override
  State<PassMailButton> createState() => _PassMailButtonState();
}

class _PassMailButtonState extends State<PassMailButton> {
  bool isMobile = false;
  bool isEmail = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Country _country = Country(
    phoneCode: '91',
    countryCode: '91',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'India',
    example: 'India',
    displayName: 'India',
    displayNameNoCountryCode: 'India',
    e164Key: '',
  );

  // final TextEditingController emailController;
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: scaleHeight(
            47,
            context,
          ),
          decoration: BoxDecoration(
            color: ColorStyles.forgotMailPassColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: scaleWidth(
                7,
                context,
              ),
              vertical: scaleHeight(
                6,
                context,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: scaleHeight(
                      43,
                      context,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        scaleRadius(
                          16,
                          context,
                        ),
                      ),
                      color: isEmail
                          ? Colors.white
                          : ColorStyles.forgotMailPassColor,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Change state of buttons here
                        setState(() {
                          isMobile = false;
                          isEmail = true;
                        });
                      },
                      child: const Center(
                        child: Text(
                          StaticText.email,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: scaleHeight(
                      43,
                      context,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        scaleRadius(16, context),
                      ),
                      color: isMobile
                          ? Colors.white
                          : ColorStyles.forgotMailPassColor,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Change state of buttons here
                        setState(() {
                          isMobile = true;
                          isEmail = false;
                        });
                      },
                      child: const Center(
                        child: Text(
                          StaticText.mobileNumber,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: scaleHeight(
            48,
            context,
          ),
        ),
        if (isEmail == true)
          CustomTextField(
            hintText: 'E-mail',
            textIcon: Assets.mailOutlineSvg,
            isPassword: false,
            textType: TextInputType.emailAddress,
            controller: TextEditingController(),
            isErrorfull: false,
            inputType: InputType.email,
            formKey: _formKey,
          ),
        if (isMobile)
          TextField(
            cursorColor: Colors.black,
            keyboardType: TextInputType.phone,
            controller: mobileController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: scaleWidth(
                  24,
                  context,
                ),
                vertical: scaleHeight(
                  16,
                  context,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  scaleRadius(
                    10,
                    context,
                  ),
                ),
              ),

              // This is not applying color
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(scaleRadius(10, context)),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              prefixStyle: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              hintText: '',
              prefixIcon: Padding(
                padding: EdgeInsets.all(
                  scaleWidth(10, context),
                ),
                child: InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      countryListTheme: CountryListThemeData(
                        bottomSheetHeight: scaleHeight(400, context),
                      ),
                      onSelect: (value) {
                        setState(
                          () {
                            _country = value;
                          },
                        );
                      },
                    );
                  },
                  child: Text(
                    '+ ${_country.phoneCode}',
                    style: TextStyle(
                      fontSize: scaleHeight(16, context),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
