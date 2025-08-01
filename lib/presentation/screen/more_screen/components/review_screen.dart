import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/circle_image.dart';
import '../../../../widgets/custom_text.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Review'),
      body: LoadedReview(),
    );
  }
}

class LoadedReview extends StatelessWidget {
  const LoadedReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000012),
            blurRadius: 30,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: AllReviewCard(),
          );
        },
        itemCount: 5,
      ),
    );
  }
}

class AllReviewCard extends StatelessWidget {
  const AllReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: whiteColor,
      ),
      child: Padding(
        padding: Utils.all(value: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleImage(image: '', size: 40.0),
            Utils.horizontalSpace(12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'ff',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 7,
                            width: 7,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: textColor,
                            ),
                          ),
                          Utils.horizontalSpace(8.0),
                          CustomText(
                            text: '',
                            fontSize: 10.0,
                            color: sTextColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  // CustomText(
                  //   text: review.comment,
                  //   fontSize: 14,
                  //   maxLine: 3,
                  //   color: sTextColor,
                  // ),
                  ReadMoreText(
                    Utils.htmlTextConverter(''),
                    trimLength: 110,
                    trimCollapsedText: 'See More',
                    moreStyle: const TextStyle(
                      fontSize: 14.0,
                      color: textColor,
                      height: 1.6,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 16.0,
                      color: redColor,
                      height: 1.6,
                    ),
                    style: const TextStyle(fontSize: 14.0, color: blackColor),
                  ),
                  Utils.verticalSpace(12.0),
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Padding(
                          padding: Utils.only(right: 6.5),
                          child: const CustomImage(
                            path: KImages.starIcon,
                            height: 12.0,
                            width: 12.0,
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.all(value: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleImage(image: '', size: 40.0),
          Utils.horizontalSpace(12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'jj',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        // const CustomText(
                        //   text: "Reply",
                        //   fontSize: 10,
                        //   color: textColor,
                        // ),
                        // Utils.horizontalSpace(8.0),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: textColor,
                          ),
                        ),
                        Utils.horizontalSpace(8.0),
                        CustomText(
                          text: Utils.formatDateTime('6'),
                          fontSize: 10.0,
                          color: sTextColor,
                        ),
                      ],
                    ),
                  ],
                ),
                CustomText(
                  text: 'g',
                  fontSize: 14,
                  maxLine: 3,
                  color: sTextColor,
                ),
                Utils.verticalSpace(12.0),
                Row(
                  children: [
                    ...List.generate(5, (index) {
                      return Padding(
                        padding: Utils.only(right: 6.5),
                        child: const CustomImage(
                          path: KImages.starIcon,
                          height: 12.0,
                          width: 12.0,
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
