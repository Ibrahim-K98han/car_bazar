import 'package:car_bazar/routes/route_names.dart';
import 'package:car_bazar/utils/constraints.dart';
import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/custom_image.dart';
import 'package:car_bazar/widgets/custom_text.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/fetch_error_text.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedPlanIndex = 1; // Set default selected plan to index 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Subscription"),
      body: LoadedPlan(),
    );
  }
}

class LoadedPlan extends StatelessWidget {
  const LoadedPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.verticalSpace(28.0),
          const CustomText(
            text: "Select Your Subscription Plan",
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(10.0),
          ...List.generate(5, (index) {
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: Utils.only(bottom: 16.0),
                child: Container(
                  padding: Utils.symmetric(h: 20.0, v: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: borderColor),
                    //color: isSelected ? const Color(0xFFE0E0E0) : Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              border: Border.all(
                                color: const Color(0xFF405FF2),
                              ),
                            ),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 14.0,
                            ),
                          ),
                          Utils.horizontalSpace(16.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'ff',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomText(
                                text: 'fff',
                                fontSize: 10.0,
                                color: const Color(0xFF6B6C6C),
                              ),
                            ],
                          ),
                        ],
                      ),
                      CustomText(
                        text: '22',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          Utils.verticalSpace(50.0),
          PrimaryButton(
            text: "Buy Now",
            onPressed: () {
              if (1 > 0) {
                Navigator.pushNamed(context, RouteNames.paymentScreen);
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: whiteColor,
                      child: Padding(
                        padding: Utils.symmetric(h: 24.0, v: 32.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const CustomText(
                              text: "Are you sure You want to buy a free plan?",
                              fontSize: 16,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                            ),
                            Utils.verticalSpace(20.0),
                            Row(
                              children: [
                                Expanded(
                                  child: PrimaryButton(
                                    text: "Cancel",
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    bgColor: redColor,
                                  ),
                                ),
                                Utils.horizontalSpace(14.0),
                                Expanded(
                                  child: PrimaryButton(
                                    text: "Sure",
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
            bgColor: const Color(0xFF405FF2),
          ),
        ],
      ),
    );
  }
}

class SubscriptionTab extends StatelessWidget {
  final String price;
  final String validity;
  final String maxListing;
  final String featuredCar;
  final String id;

  const SubscriptionTab({
    super.key,
    required this.price,
    required this.validity,
    required this.maxListing,
    required this.featuredCar,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Utils.symmetric(v: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeatureList(title: 'Duration', validity: validity),
          Utils.verticalSpace(8.0),
          FeatureList(title: 'Maximum Listings', validity: maxListing),
          Utils.verticalSpace(8.0),
          FeatureList(title: 'Number of Featured', validity: featuredCar),
          Utils.verticalSpace(8.0),
          const FeatureList(title: 'Listing Image', validity: 'Unlimited'),
          Utils.verticalSpace(8.0),
          Row(
            children: [
              Container(
                height: 20.0,
                width: 20.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEEF1FF),
                ),
                child: const Center(
                  child: CustomImage(
                    path: KImages.done,
                    height: 10.0,
                    color: Color(0xFF405FF2),
                  ),
                ),
              ),
              Utils.horizontalSpace(10.0),
              const CustomText(text: 'Features & Aminities', fontSize: 16.0),
            ],
          ),
          Utils.verticalSpace(8.0),
          Row(
            children: [
              Container(
                height: 20.0,
                width: 20.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFEEF1FF),
                ),
                child: const Center(
                  child: CustomImage(
                    path: KImages.done,
                    height: 10.0,
                    color: Color(0xFF405FF2),
                  ),
                ),
              ),
              Utils.horizontalSpace(10.0),
              const CustomText(text: '24/7 Hours Help', fontSize: 16.0),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureList extends StatelessWidget {
  const FeatureList({super.key, required this.title, required this.validity});

  final String title;
  final String validity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20.0,
          width: 20.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFEEF1FF),
          ),
          child: const Center(
            child: CustomImage(
              path: KImages.done,
              height: 10.0,
              color: Color(0xFF405FF2),
            ),
          ),
        ),
        Utils.horizontalSpace(10.0),
        CustomText(text: '$title : $validity', fontSize: 16.0),
      ],
    );
  }
}
