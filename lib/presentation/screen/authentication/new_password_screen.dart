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

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: '', visibleLeading: true),
      backgroundColor: scaffoldBgColor,
      body: ListView(
        padding: Utils.symmetric(),
        children: [
          Utils.verticalSpace(size.height * 0.06),
          const CustomImage(
            path: KImages.setPasswordImage,
            height: 140,
            width: 130,
          ),
          Utils.verticalSpace(size.height * 0.06),
          const CustomText(
            text: "Create New Password",
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(16.0),
          CustomForm(
            label: "New Password",
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,

              decoration: InputDecoration(
                hintText: 'password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility_outlined, color: greyColor),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          Utils.verticalSpace(10.0),
          CustomForm(
            label: "Confirm New Password",
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,

              decoration: InputDecoration(
                hintText: 'password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility_outlined, color: greyColor),
                  onPressed: () {},
                ),
              ),
            ),
          ),

          Utils.verticalSpace(30.0),
          PrimaryButton(
            text: "Create New",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteNames.loginScreen,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
