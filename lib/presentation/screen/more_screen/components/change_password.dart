import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/custom_form.dart';
import 'package:car_bazar/widgets/custom_image.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/fetch_error_text.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Change Password"),
      body: ListView(
        padding: Utils.symmetric(),
        children: [
          const CustomImage(path: KImages.changePassword, height: 200),
          Utils.verticalSpace(40.0),
          CustomForm(
            label: 'Current Password',
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,

              decoration: InputDecoration(
                hintText: 'Password here',
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility_outlined, color: blackColor),
                  onPressed: () {},
                ),
              ),
            ),
          ),

          Utils.verticalSpace(14.0),
          CustomForm(
            label: 'New Password',
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,

              decoration: InputDecoration(
                hintText: 'Password here',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_outlined, color: blackColor),
                ),
              ),
            ),
          ),
          Utils.verticalSpace(14.0),
          CustomForm(
            label: 'Confirm Password',
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,

              decoration: InputDecoration(
                hintText: 'Password here',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility_outlined, color: blackColor),
                ),
              ),
            ),
          ),
          Utils.verticalSpace(22.0),
          PrimaryButton(text: "Create New", onPressed: () {}),
        ],
      ),
    );
  }
}
