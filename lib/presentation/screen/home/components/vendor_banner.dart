import 'package:car_bazar/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/data_provider/remote_url.dart';
import '../../../../data/model/home/home_model.dart';
import '../../../../logic/bloc/login/login_bloc.dart';
import '../../../../routes/route_names.dart';
import '../../../../utils/constraints.dart';
import '../../../../utils/k_images.dart';
import '../../../../utils/language_string.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_image.dart';
import '../../../../widgets/primary_button.dart';

class VendorBannerView extends StatelessWidget {
  const VendorBannerView({super.key, required this.joinDealer});

  final JoinDealer joinDealer;

  @override
  Widget build(BuildContext context) {
    final login = context.read<LoginBloc>();
    return SliverPadding(
      padding: Utils.symmetric(h: 0.0, v: 0.0),
      sliver: SliverToBoxAdapter(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
                child: CustomImage(
                  path: RemoteUrls.imageUrl(joinDealer.image),
                  fit: BoxFit.cover,
                  height: 190.0,
                  width: double.infinity,
                )),
            Positioned(
                top: 24.0,
                left: 50.0,
                right: 50.0,
                child: CustomText(
                  text: joinDealer.shortTitle,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                  color: whiteColor,
                  textAlign: TextAlign.center,
                )),
            Positioned(
                top: 60.0,
                left: 50.0,
                right: 50.0,
                child: CustomText(
                  text: joinDealer.title,
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: whiteColor,
                  textAlign: TextAlign.center,
                )),
            Positioned(
              bottom: 24.0,
              right: 100.0,
              left: 100.0,
              child: GestureDetector(
                onTap: (){
                  if(login.isLoggedIn){
                    Utils.showSnackBar(context, "You are already Vendor");
                  }else{
                    Navigator.pushNamed(context, RouteNames.registrationScreen);
                  }
                },
                child: Container(
                  padding: Utils.symmetric(h: 26.0, v: 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: primaryColor),
                  child:  CustomText(
                    text: Utils.translatedText(context, Language.becomeADealer),
                    color: whiteColor,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/// final
