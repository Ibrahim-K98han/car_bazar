import 'package:car_bazar/presentation/screen/home/components/banner_slider_section.dart';
import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import 'components/brand_screen.dart';
import 'components/feature_rent_car.dart';
import 'components/home_app_bar.dart';
import 'components/popular_car_screen.dart';
import 'components/slider_section.dart';
import 'components/top_dealer_section.dart';
import 'components/vendor_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoadedHomeData());
  }
}

class LoadedHomeData extends StatelessWidget {
  const LoadedHomeData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000012),
            blurRadius: 30,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: CustomScrollView(
        slivers: [
          const HomeAppBar(),
          SliderSection(),
          BrandScreen(),
          SliverToBoxAdapter(child: Utils.verticalSpace(26.0)),
          FeatureCarScreen(),
          SliverToBoxAdapter(child: Utils.verticalSpace(26.0)),
          SliverToBoxAdapter(child: BannerSliderSection()),
          SliverToBoxAdapter(child: Utils.verticalSpace(26.0)),
          TopDealerSection(),
          SliverToBoxAdapter(child: Utils.verticalSpace(26.0)),
          VendorBannerView(),
          SliverToBoxAdapter(child: Utils.verticalSpace(26.0)),
          PopularCarScreen(),
          SliverToBoxAdapter(child: Utils.verticalSpace(26.0)),
        ],
      ),
    );
  }
}
