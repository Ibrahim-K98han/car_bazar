import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_form.dart';

class ContactusScreen extends StatefulWidget {
  const ContactusScreen({super.key});

  @override
  State<ContactusScreen> createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Contact Us"),
      body: Padding(
        padding: Utils.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomForm(
                label: 'Name',
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name here'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Utils.verticalSpace(10.0),
              CustomForm(
                label: 'Subject',
                child: TextFormField(
                  controller: subjectController,
                  decoration: const InputDecoration(hintText: 'subject'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Utils.verticalSpace(10.0),
              CustomForm(
                label: 'Email',
                child: TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'email'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Utils.verticalSpace(10.0),
              CustomForm(
                label: 'Message',
                child: TextFormField(
                  maxLines: 4,
                  controller: messageController,
                  decoration: const InputDecoration(hintText: 'message'),
                  keyboardType: TextInputType.text,
                ),
              ),
              Utils.verticalSpace(20.0),
              PrimaryButton(text: "Send Now", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
