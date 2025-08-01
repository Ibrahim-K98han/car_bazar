import 'package:car_bazar/utils/k_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';

class BannerSliderSection extends StatefulWidget {
  const BannerSliderSection({super.key});

  @override
  State<BannerSliderSection> createState() => _BannerSliderSectionState();
}

class _BannerSliderSectionState extends State<BannerSliderSection> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            //SliverToBoxAdapter(child: Utils.verticalSpace(size.height * 0.06)),
           // Utils.verticalSpace(size.height * 0.05),
            Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 132.0,
                    viewportFraction: 1.0,
                    initialPage: _currentIndex,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlayCurve: Curves.easeInOut,
                    enlargeCenterPage: true,
                    onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  ),
                  items:[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      //margin: Utils.symmetric(h: 10.0),
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CustomImage(
                          path: KImages.addCar,
                          fit: BoxFit.fill,
                        ),
                        // child: Image.network(e.image),
                      ),
                    )
                  ]
                ),
                Positioned(
                    bottom: 10.0,
                    left: 0.0,
                    right: 0.0,
                    child: _buildDotIndicator()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void callbackFunction(int index, CarouselPageChangedReason reason) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildDotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
            (index) {
          final i = _currentIndex == index;
          return AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: Utils.vSize(6.0),
            width: Utils.hSize(i ? 24.0 : 6.0),
            margin: Utils.only(right: 4.0),
            decoration: BoxDecoration(
              color: i ? whiteColor : whiteColor,
              borderRadius: BorderRadius.circular(i ? 50.0 : 5.0),
              //shape: i ? BoxShape.rectangle : BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
