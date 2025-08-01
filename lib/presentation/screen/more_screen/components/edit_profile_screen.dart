import 'package:car_bazar/presentation/screen/more_screen/components/profile_picture_view.dart';
import 'package:car_bazar/utils/utils.dart';
import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/custom_form.dart';
import 'package:car_bazar/widgets/custom_text.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../../../widgets/fetch_error_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Profile Setting"),
      body: ListView(
        padding: Utils.symmetric(),
        children: [
          CustomForm(
            label: "Full Name",
            child: TextFormField(
              decoration: const InputDecoration(hintText: "full name"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: 'Please enter an Car Name',
                ),
              ]),
            ),
          ),
          Utils.verticalSpace(14.0),
          CustomForm(
            label: "Email",
            child: TextFormField(
              decoration: const InputDecoration(hintText: "email"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: 'Please enter an email',
                ),
              ]),
            ),
          ),
          Utils.verticalSpace(14.0),
          CustomForm(
            label: "Phone",
            child: TextFormField(
              decoration: const InputDecoration(hintText: "phone"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: 'Please enter an phone number',
                ),
              ]),
            ),
          ),
          Utils.verticalSpace(14.0),
          CustomForm(
            label: "Designation",
            child: TextFormField(
              decoration: const InputDecoration(hintText: "designation"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: 'Please enter an designation',
                ),
              ]),
            ),
          ),
          Utils.verticalSpace(14.0),
          CustomForm(
            label: "Address",
            child: TextFormField(
              decoration: const InputDecoration(hintText: "address"),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                  errorText: 'Please enter an address',
                ),
              ]),
            ),
          ),
          Utils.verticalSpace(20.0),
          const ProfilePictureView(),
          Utils.verticalSpace(20.0),
          const CustomText(
            text: "Banner Image",
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(10.0),
          // const ProfileBannerView(),
          Utils.verticalSpace(10.0),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: Utils.symmetric(v: 10.0),
        child: _submitButton(context),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return PrimaryButton(
      text: "Update Now",
      onPressed: () {
        if (_formKey.currentState!.validate()) {}
      },
    );
  }
}
