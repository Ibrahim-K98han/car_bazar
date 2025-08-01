import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_text.dart';

class FeatureSelector extends StatefulWidget {

  const FeatureSelector({super.key, });

  @override
  _FeatureSelectorState createState() => _FeatureSelectorState();
}

class _FeatureSelectorState extends State<FeatureSelector> {
  final List<int> _selectedIndices = []; // Track selected indices

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Select Feature",
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        Utils.verticalSpace(10.0),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: List.generate(5, (index) {


            // Determine selection state and background color
            final isSelected = _selectedIndices.contains(index);
            final backgroundColor = isSelected
                ? primaryColor
                : (index == 0 ? Colors.transparent : Colors.white);

            return GestureDetector(
              onTap: () {
              
              },
              child: Container(
                padding: Utils.symmetric(h: 10.0, v: 6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45.0),
                  color: backgroundColor,
                  border: Border.all(color: borderColor),
                ),
                child: CustomText(
                  text: 'fe',
                  color: isSelected ? whiteColor : Colors.black,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}

