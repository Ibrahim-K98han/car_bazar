
import 'package:car_bazar/presentation/screen/home/components/popular_card.dart';
import 'package:car_bazar/widgets/custom_image.dart';
import 'package:car_bazar/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';
import '../../../../routes/route_names.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';

class PopularCarScreen extends StatelessWidget {
  const PopularCarScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double childAspectRatio = size.width / (size.height / 1.46);
    return MultiSliver(
      children: <Widget>[
        // SliverToBoxAdapter(
        //   child: TitleAndNavigator(
        //     title: Utils.translatedText(context, Language.carListing),
        //     press: () {
        //       context.read<AllCarsCubit>().clearFilters();
        //       Navigator.pushNamed(context, RouteNames.allCarScreen);
        //     },
        //   ),
        // ),
        Utils.verticalSpace(14.0),
         SliverToBoxAdapter(
              child: Column(
            children: [
              const CustomImage(
                path: KImages.emptyImage,
                height: 150,
              ),
              Utils.verticalSpace(20.0),
               CustomText(
                text: 'No',
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ],
          )),
      ],
    );
  }
}


