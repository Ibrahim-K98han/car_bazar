import 'package:car_bazar/routes/route_names.dart';
import 'package:car_bazar/utils/constraints.dart';
import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/custom_form.dart';
import 'package:car_bazar/widgets/custom_image.dart';
import 'package:car_bazar/widgets/custom_text.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: '', visibleLeading: true),
      backgroundColor: scaffoldBgColor,
      body: ListView(
        padding: Utils.symmetric(),
        children: [
          Utils.verticalSpace(size.height * 0.08),
          const CustomImage(path: KImages.forgotPassword),
          Utils.verticalSpace(10.0),
          CustomForm(
            label: 'Email',
            child: TextFormField(
              decoration: const InputDecoration(hintText: 'email here'),
              keyboardType: TextInputType.emailAddress,
            ),
          ),

          const CustomText(
            text: "Forgot Password",
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(16.0),

          Utils.verticalSpace(30.0),
          PrimaryButton(
            text: "Send Code",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.forgotPasswordOtpScreen,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
