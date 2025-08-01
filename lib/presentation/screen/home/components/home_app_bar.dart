import 'package:car_bazar/routes/route_names.dart';
import 'package:car_bazar/utils/k_images.dart';
import 'package:car_bazar/widgets/circle_image.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  late String image;
  late String name;
  late String email;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // print('nameeeeeeeee: ${loginBloc.userInformation!.user!.name}');
    // print('nameeee222: $name');
    return SliverAppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: Utils.vSize(130.0),
      backgroundColor: const Color(0xFF405FF2),
      pinned: true,
      flexibleSpace: Stack(
        fit: StackFit.loose,
        clipBehavior: Clip.none,
        children: [
          FlexibleSpaceBar(
            background: Padding(
              padding: EdgeInsets.only(top: 55.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: CircleImage(
                              image: KImages.addCar,
                              size: 56.0,
                            ),
                          ),
                          Utils.horizontalSpace(8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                maxLine: 2,
                                text: "Guest",
                                fontSize: 16.0,
                                color: whiteColor,
                                fontFamily: bold700,
                              ),
                              Utils.verticalSpace(4.0),
                              const CustomText(
                                text: 'Welcome back !',
                                fontSize: 12.0,
                                color: whiteColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: whiteColor.withOpacity(0.5),
                                ),
                              ),
                              child: Padding(
                                padding: Utils.all(value: 16.0),
                                child: const CustomImage(path: KImages.compare),
                              ),
                            ),
                            Positioned(
                              top: -10,
                              right: -4,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: whiteColor,
                                ),
                                child: Padding(
                                  padding: Utils.all(value: 8.0),
                                  child: CustomText(text: '0'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: -44.0,
            left: 20.0,
            right: 20.0,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.allCarScreen);
            
              },
              child: Container(
                height: Utils.vSize(56.0),
                width: Utils.mediaQuery(context).width,
                margin: Utils.symmetric(v: 16.0, h: 0.0),
                padding: Utils.only(
                  left: 20.0,
                  right: 6.0,
                  top: 6.0,
                  bottom: 6.0,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: Utils.borderRadius(),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff0000000).withOpacity(0.12),
                      blurRadius: 40.0,
                      offset: const Offset(0, 2),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const CustomImage(path: KImages.search),
                        CustomText(text: 'Search here...', color: sTextColor),
                      ],
                    ),
                    Container(
                      padding: Utils.all(value: 13.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: const Color(0xFF0D274E),
                      ),
                      child: const CustomImage(
                        path: KImages.searchIcon,
                        height: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
