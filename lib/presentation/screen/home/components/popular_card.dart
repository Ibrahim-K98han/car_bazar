
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../routes/route_names.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/custom_text.dart';

class PopularCarCard extends StatefulWidget {
  const PopularCarCard({super.key});

  @override
  State<PopularCarCard> createState() => _PopularCarCardState();
}

class _PopularCarCardState extends State<PopularCarCard> {
  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteNames.detailsCarScreen,);
      },
      child: Container(
        height: size.height*0.28,
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height*0.14,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      )),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: CustomImage(
                        path: KImages.addCar,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                    right: 10.0,
                    top: 10.0,
                    child: GestureDetector(
                      onTap: (){
                       
                      },
                      child: Container(
                        padding: Utils.all(value: 8.0),
                        decoration:const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFEEF2F6),
                        ),
                        child: CustomImage(
                          path:  KImages.loveIcon,
                          height: 17.0,
                          width: 20.0,
                        ),
                      ),
                    ))
              ],
            ),
            Padding(
              padding: Utils.all(value: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.verticalSpace(2.0),
                  CustomText(
                    text: 'name',
                    fontSize: 10.0,
                    color: sTextColor,
                  ),
                  Utils.verticalSpace(6.0),
                  CustomText(
                    text: 'ffff',
                    fontWeight: FontWeight.w600,
                    maxLine: 2,
                  ),
                  Utils.verticalSpace(6.0),
                  CustomText(
                    text: '455',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}