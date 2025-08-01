import 'package:car_bazar/utils/k_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              ...List.generate(5, (index) {
                return Padding(
                  padding: Utils.only(right: 16.0),
                  child: Container(
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: CustomImage(
                        path: KImages.addCar,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
