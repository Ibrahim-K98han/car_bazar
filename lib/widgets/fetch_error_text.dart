import 'package:car_bazar/utils/constraints.dart';
import 'package:car_bazar/widgets/custom_text.dart' show CustomText;
import 'package:flutter/cupertino.dart';

class FetchErrorText extends StatelessWidget {
  const FetchErrorText(
      {super.key, required this.text, this.textColor = redColor});

  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: text,
      color: textColor,
      fontSize: 14.0,
    );
  }
}
