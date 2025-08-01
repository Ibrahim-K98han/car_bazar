import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_text.dart';

class PurposeSelector extends StatefulWidget {

  const PurposeSelector({Key? key, }) : super(key: key);

  @override
  _PurposeSelectorState createState() => _PurposeSelectorState();
}

class _PurposeSelectorState extends State<PurposeSelector> {
  final List<int> _selectedIndices = []; // Track selected indices

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(
          text: "Select Purpose",
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
        Utils.verticalSpace(10.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(5, (index) {
             
                // Determine selection state and background color
                final isSelected = _selectedIndices.contains(index);
                final backgroundColor = isSelected
                    ? primaryColor
                    : (index == 0 ? Colors.transparent : Colors.white);

                return GestureDetector(
                  onTap: () {
                   
                  },
                  child: Padding(
                    padding: Utils.only(right: 10.0),
                    child: Container(
                      padding: Utils.symmetric(h: 10.0, v: 6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45.0),
                        color: backgroundColor,
                        border: Border.all(color: borderColor),
                      ),
                      child: CustomText(
                        text: 'color', // Show color name
                        color: isSelected ? whiteColor : Colors.black,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}

