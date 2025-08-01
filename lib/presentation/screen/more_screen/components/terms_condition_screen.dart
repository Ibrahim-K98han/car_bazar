import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/fetch_error_text.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({super.key});

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Terms and Condition"),
      body: Padding(
        padding: Utils.symmetric(v: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HtmlWidget(
                'fff',
                customStylesBuilder: (element) {
                  if (element.localName == 'p') {
                    return {'color': '#6B6C6C'}; // Change paragraph color here
                  }
                  return null;
                },
                textStyle: const TextStyle(
                  color: Colors.black,
                ), // Change default text color here
              ),
            ],
          ),
        ),
      ),
    );
  }
}
