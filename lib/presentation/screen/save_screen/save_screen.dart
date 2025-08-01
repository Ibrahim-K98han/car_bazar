import 'package:car_bazar/utils/constraints.dart';
import 'package:flutter/material.dart';
import '../../../utils/utils.dart';
import '../../../widgets/custom_text.dart';
import '../home/components/popular_card.dart';

class SaveScreen extends StatefulWidget {
  const SaveScreen({super.key});

  @override
  State<SaveScreen> createState() => _SaveScreenState();
}

class _SaveScreenState extends State<SaveScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    debugPrint('scrolling-called');
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels != 0.0) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:  CustomAppBar(
      //   title: Utils.translatedText(context, Language.wishlist),
      //   visibleLeading: false,
      //   titleCenter: true,
      // ),
      body: LoadedData(),
    );
  }
}

class LoadedData extends StatelessWidget {
  const LoadedData({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double childAspectRatio = size.width / (size.height / 1.47);
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
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            surfaceTintColor: scaffoldBgColor,
            backgroundColor: Colors.transparent,
            toolbarHeight: Utils.vSize(50.0),
            centerTitle: true,
            title: CustomText(
              text: 'fdf',
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: blackColor,
            ),
          ),
          SliverPadding(
            padding: Utils.only(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
              top: 10.0,
            ),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: childAspectRatio,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return PopularCarCard();
              }, childCount: 5),
            ),
          ),
        ],
      ),
    );
  }
}
