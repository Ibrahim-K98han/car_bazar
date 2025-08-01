import 'package:car_bazar/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../routes/route_names.dart';
import '../../../utils/constraints.dart';
import '../../../utils/k_images.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_image.dart';
import '../../../widgets/custom_text.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(title: "Menu", visibleLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: Utils.symmetric(),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(color: borderColor),
                ),
                child: Padding(
                  padding: Utils.symmetric(v: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'fff',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Utils.verticalSpace(16.0),
                      DrawerItem(
                        icon: KImages.user,
                        title: 'fdfdf',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.profileScreen,
                          );
                        },
                      ),
                      DrawerItem(
                        icon: KImages.star,
                        title: 'dfdf',
                        onTap: () {
                          Navigator.pushNamed(context, RouteNames.reviewScreen);
                        },
                      ),
                      DrawerItem(
                        icon: KImages.editProfile,
                        title: 'dfdf',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.editProfileScreen,
                          );
                        },
                      ),
                      DrawerItem(
                        isVisibleBorder: false,
                        icon: KImages.lock,
                        title: 'dfdf',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.changePassword,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Utils.verticalSpace(20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(color: borderColor),
                ),
                child: Padding(
                  padding: Utils.symmetric(v: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'dfdf',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        Utils.verticalSpace(16.0),

                        DrawerItem(
                          icon: KImages.addCar,
                          title: 'fdf',
                          onTap: () {},
                        ),
                        DrawerItem(
                          icon: KImages.addCar,
                          title: 'fdf',
                          onTap: () {},
                        ),
                        DrawerItem(
                          icon: KImages.addCar,
                          title: 'fdf',
                          onTap: () {},
                        ),
                        DrawerItem(
                          icon: KImages.addCar,
                          title: 'fdf',
                          onTap: () {},
                        ),
                        DrawerItem(
                          icon: KImages.addCar,
                          title: 'fdf',
                          onTap: () {},
                        ),

                        // DrawerItem(
                        //     isVisibleBorder: false,
                        //     icon: KImages.transaction,
                        //     title: Utils.translatedText(
                        //         context, Language.transactionInvoice),
                        //     onTap: () {
                        //       Navigator.pushNamed(
                        //           context, RouteNames.transactionScreen);
                        //     }),
                      ],
                    ),
                  ),
                ),
              ),
              Utils.verticalSpace(20.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(color: borderColor),
                ),
                child: Padding(
                  padding: Utils.symmetric(v: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: ' fdfd',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        Utils.verticalSpace(16.0),
                        DrawerItem(
                          icon: KImages.language,
                          title: 'dfdf',
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteNames.languageScreen,
                            );
                          },
                        ),

                        DrawerItem(
                          isVisibleBorder: false,
                          icon: KImages.appInfo,
                          title: 'dfdf',
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  backgroundColor: whiteColor,
                                  child: Padding(
                                    padding: Utils.symmetric(v: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const CustomImage(
                                                  path: KImages.appIcon,
                                                ),
                                                Utils.horizontalSpace(10.0),
                                                const CustomText(
                                                  text: "CARBAZ",
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: Utils.all(value: 4.0),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red,
                                                ),
                                                child: const Icon(
                                                  Icons.close,
                                                  color: whiteColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Utils.verticalSpace(20.0),
                                        const CustomText(
                                          text: "App Info",
                                          fontSize: 18.0,
                                        ),
                                        Utils.verticalSpace(20.0),
                                        const CustomText(
                                          text: "Name: ${'Carbaz'}",
                                          fontSize: 18.0,
                                        ),
                                        const CustomText(
                                          text: "Version: ${'2.0'}",
                                          fontSize: 18.0,
                                        ),
                                        const CustomText(
                                          text: "Last Update: ${'20 Apr 2025'}",
                                          fontSize: 18.0,
                                        ),
                                        const CustomText(
                                          text:
                                              "Developed By: ${'QuomodoSoft'}",
                                          fontSize: 18.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Utils.verticalSpace(20.0),
              GestureDetector(
                onTap: () {
                  // if (Utils.isLoggedIn(context)) {
                  //   showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return Dialog(
                  //         backgroundColor: whiteColor,
                  //         insetPadding: Utils.symmetric(),
                  //         child: Padding(
                  //           padding: Utils.symmetric(h: 24.0, v: 32.0),
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             mainAxisSize: MainAxisSize.min,
                  //             children: [
                  //               const CustomImage(path: KImages.logout),
                  //               Utils.verticalSpace(18.0),
                  //               const CustomText(
                  //                 text: "Logout",
                  //                 fontSize: 18.0,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //               Utils.verticalSpace(10.0),
                  //               const CustomText(
                  //                 text:
                  //                     "Are you sure you want to log out from Carsbnb?",
                  //                 fontSize: 16.0,
                  //                 color: sTextColor,
                  //                 textAlign: TextAlign.center,
                  //               ),
                  //               Utils.verticalSpace(20.0),
                  //               Row(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 children: [
                  //                   GestureDetector(
                  //                     onTap: () {
                  //                       Navigator.pop(context);
                  //                     },
                  //                     child: Container(
                  //                       decoration: BoxDecoration(
                  //                         borderRadius: BorderRadius.circular(
                  //                           4.0,
                  //                         ),
                  //                         color: whiteColor,
                  //                         border: Border.all(
                  //                           color: borderColor,
                  //                         ),
                  //                       ),
                  //                       child: Padding(
                  //                         padding: Utils.symmetric(
                  //                           h: 30.0,
                  //                           v: 16.0,
                  //                         ),
                  //                         child: const CustomText(
                  //                           text: "Cancel",
                  //                           fontSize: 16.0,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                   Utils.horizontalSpace(14.0),
                  //                   BlocListener<LoginBloc, LoginStateModel>(
                  //                     listener: (context, state) {
                  //                       if (state.loginState
                  //                           is LoginStateLogoutLoaded) {
                  //                         Navigator.pushNamedAndRemoveUntil(
                  //                           context,
                  //                           RouteNames.loginScreen,
                  //                           (route) => false,
                  //                         );
                  //                       }
                  //                     },
                  //                     child: GestureDetector(
                  //                       onTap: () {
                  //                         context.read<LoginBloc>().add(
                  //                           const LoginEventLogout(),
                  //                         );
                  //                       },
                  //                       child: Container(
                  //                         decoration: BoxDecoration(
                  //                           borderRadius: BorderRadius.circular(
                  //                             4.0,
                  //                           ),
                  //                           color: redColor,
                  //                         ),
                  //                         child: Padding(
                  //                           padding: Utils.symmetric(
                  //                             h: 30.0,
                  //                             v: 16.0,
                  //                           ),
                  //                           child: const CustomText(
                  //                             text: "Logout",
                  //                             color: whiteColor,
                  //                             fontSize: 16.0,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   );
                  // } else {
                  //   Utils.showSnackBarWithLogin(context);
                  // }
                },
                child: Container(
                  width: double.infinity,
                  padding: Utils.symmetric(h: 24.0, v: 14.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: redColor),
                  ),
                  child: CustomText(
                    text: 'lo',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    textAlign: TextAlign.center,
                    color: redColor,
                  ),
                ),
              ),
              Utils.verticalSpace(20.0),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isVisibleBorder = true,
    this.version = false,
    this.isAuth = true,
  });

  final String icon;
  final String title;
  final bool isVisibleBorder;
  final bool version;
  final VoidCallback onTap;
  final bool isAuth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(v: 20.0, h: 0.0).copyWith(top: 0.0, bottom: 0.0),
      child: Column(
        children: [
          if (isAuth) ...[
            GestureDetector(
              onTap:() {
                
              },
                 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomImage(
                        path: icon,
                        fit: BoxFit.cover,
                        height: 26,
                        color: const Color(0xFF0D274E),
                      ),
                      Utils.horizontalSpace(12.0),
                      CustomText(
                        text: title,
                        color: const Color(0xFF0D274E),
                        fontSize: 16.0,
                      ),
                    ],
                  ),
                  version
                      ? const CustomText(
                        text: '1.0.0',
                        color: blackColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      )
                      : const SizedBox(),
                ],
              ),
            ),
            isVisibleBorder
                ? Container(
                  height: 1.0,
                  width: double.infinity,
                  margin: Utils.only(right: 20.0, top: 12.0, bottom: 12.0),
                  color: borderColor,
                )
                : const SizedBox(),
          ] else ...[
            GestureDetector(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CustomImage(
                        path: icon,
                        fit: BoxFit.cover,
                        height: 26,
                        color: const Color(0xFF0D274E),
                      ),
                      Utils.horizontalSpace(12.0),
                      CustomText(
                        text: title,
                        color: const Color(0xFF0D274E),
                        fontSize: 16.0,
                      ),
                    ],
                  ),
                  version
                      ? const CustomText(
                        text: '1.0.0',
                        color: blackColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      )
                      : const SizedBox(),
                ],
              ),
            ),
            isVisibleBorder
                ? Container(
                  height: 1.0,
                  width: double.infinity,
                  margin: Utils.only(right: 20.0, top: 12.0, bottom: 12.0),
                  color: borderColor,
                )
                : const SizedBox(),
          ],
        ],
      ),
    );
  }
}
