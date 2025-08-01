import 'package:car_bazar/utils/constraints.dart';
import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/custom_form.dart';
import 'package:car_bazar/widgets/custom_text.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../routes/route_names.dart';
import '../../../utils/utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: '', visibleLeading: true),
      backgroundColor: const Color(0xFFEEF2F6),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: size.height * 0.8,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                color: whiteColor,
              ),
              child: ListView(
                padding: Utils.symmetric(v: 20.0),
                children: [
                  const CustomText(
                    text: "Sign Up to your Account",
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  Utils.verticalSpace(16.0),
                  CustomForm(
                    label: 'Name',
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Name here'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Please enter an Name',
                        ),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Utils.verticalSpace(10.0),
                  CustomForm(
                    label: 'Email',
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'email here'),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.email(
                          errorText: 'Please enter an email',
                        ),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Utils.verticalSpace(10.0),
                  CustomForm(
                    label: "Password",
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'password',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility_outlined,
                            color: blackColor,
                          ),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.password(
                          maxLength: 12,
                          errorText: 'Please enter an password',
                        ),
                      ]),
                    ),
                  ),
                  Utils.verticalSpace(16.0),
                  CustomForm(
                    label: "Confirm Password",
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,

                      decoration: InputDecoration(
                        hintText: 'password',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility_outlined,
                            color: blackColor,
                          ),
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.password(
                          maxLength: 12,
                          errorText: 'Please enter an password',
                        ),
                      ]),
                    ),
                  ),

                  Utils.verticalSpace(30.0),
                  PrimaryButton(
                    text: "Sign Up",
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNames.otpScreen,
                        (route) => false,
                      );
                    },
                  ),
                  Utils.verticalSpace(18.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "Don't have an account? ",
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: blackColor,
                        height: 1.6,
                      ),
                      GestureDetector(
                        onTap:
                            () => Navigator.pushNamed(
                              context,
                              RouteNames.loginScreen,
                            ),
                        child: const CustomText(
                          text: 'Sign In',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          fontFamily: bold700,
                          color: primaryColor,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
