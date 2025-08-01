import 'package:car_bazar/routes/route_names.dart';
import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:car_bazar/widgets/custom_text.dart';
import 'package:car_bazar/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/constraints.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/fetch_error_text.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  State<PurchaseHistoryScreen> createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Purchase History"),
      body: LoadedHistory(),

      bottomNavigationBar: Padding(
        padding: Utils.symmetric(h: 20.0, v: 20.0),
        child: PrimaryButton(
          text: "Upgrade Plan",
          onPressed: () {
            Navigator.pushNamed(context, RouteNames.subscriptionScreen);
          },
        ),
      ),
    );
  }
}

class LoadedHistory extends StatelessWidget {
  const LoadedHistory({super.key});

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
      child: Padding(
        padding: Utils.symmetric(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...List.generate(5, (index) {
                return Padding(
                  padding: Utils.only(bottom: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            backgroundColor: whiteColor,
                            insetPadding: const EdgeInsets.symmetric(
                              horizontal: 14.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  padding: Utils.symmetric(v: 10.0, h: 20.0),
                                  //width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3F7FC),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomText(
                                        text: "Purchase Details",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        textAlign: TextAlign.center,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: redColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      color: whiteColor,
                      padding: Utils.all(value: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'nana',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                          CustomText(text: '10', fontWeight: FontWeight.w500),
                          CustomText(
                            text: '',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: blackColor,
                          ),

                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              color: redColor,
                            ),
                            child: Padding(
                              padding: Utils.symmetric(h: 12.0, v: 6.0),
                              child: CustomText(text: 'gg', color: redColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class buildInfo extends StatelessWidget {
  const buildInfo({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: title, color: const Color(0xFF6B6C6C)),
            Flexible(
              child: CustomText(
                text: value,
                color: Color(0xFF0D274E),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                maxLine: 1,
              ),
            ),
          ],
        ),
        Utils.verticalSpace(10.0),
        Utils.horizontalLine(),
        Utils.verticalSpace(10.0),
      ],
    );
  }
}
