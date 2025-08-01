import 'package:car_bazar/utils/k_images.dart';
import 'package:car_bazar/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/constraints.dart';
import '../../../../../utils/utils.dart';
import '../../../../widgets/circle_image.dart';

class ProfilePictureView extends StatelessWidget {
  const ProfilePictureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleImage(image: KImages.profileImage),
          Positioned(
            right: 6.0,
            bottom: 5.0,
            child: GestureDetector(
              onTap: () async {
                final img = await Utils.pickSingleImage();
                if (img != null && img.isNotEmpty) {}
              },
              child: const CircleAvatar(
                maxRadius: 16.0,
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: whiteColor,
                  size: 20.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
