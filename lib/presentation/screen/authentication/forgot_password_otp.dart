import 'package:car_bazar/routes/route_names.dart';
import 'package:car_bazar/utils/constraints.dart';
import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/custom_image.dart';
import 'package:car_bazar/widgets/custom_text.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  const ForgotPasswordOtpScreen({super.key});

  @override
  State<ForgotPasswordOtpScreen> createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "", visibleLeading: true),
      body: Padding(
        padding: Utils.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Utils.verticalSpace(20.0),
              const CustomImage(
                path: KImages.otpImage,
                height: 120,
                width: 160,
              ),
              Utils.verticalSpace(50.0),
              const CustomText(
                text: "Check your Email",
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
              ),
              Utils.verticalSpace(26.0),
              const CustomText(
                text:
                    "You should soon receive an email allowing you to send your mail. Please make sure to check your spam and trash if you can't find the email.",
                color: sTextColor,
                textAlign: TextAlign.center,
              ),
              Utils.verticalSpace(30.0),
              Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                  height: Utils.vSize(60.0),
                  width: Utils.hSize(60.0),
                  textStyle: GoogleFonts.roboto(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (String code) {},
                onCompleted: (String code) {
                  if (code.length == 6) {
                  } else {
                    Utils.errorSnackBar(context, "enter 6 digit");
                  }
                },
              ),
              Utils.verticalSpace(40.0),
              PrimaryButton(text: 'Send Code', onPressed: () {
                Navigator.pushNamed(context, RouteNames.newPasswordScreen);
              }),
              Utils.verticalSpace(30.0),
              const CustomText(
                text: "Did’t receive the email?",
                fontSize: 20.0,
              ),
              GestureDetector(
                onTap: () {},
                child: const CustomText(
                  text: "Click to resend",
                  fontSize: 20.0,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
