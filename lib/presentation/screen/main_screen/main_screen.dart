
import 'package:car_bazar/presentation/screen/all_car_screen/all_car_screen.dart';
import 'package:car_bazar/presentation/screen/home/home_screen.dart';
import 'package:car_bazar/presentation/screen/save_screen/save_screen.dart';
import 'package:car_bazar/widgets/exit_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../more_screen/more_screen.dart';
import 'component/bottom_navigation_bar.dart';
import 'component/main_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _homeController = MainController();
  late List<Widget> screens;

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const AllCarScreen(),
      const SaveScreen(),
      const MoreScreen(),
    ];

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(context: context, builder: (context) => const ExitDialog());
        return true;
      },
      child: Scaffold(
        body: StreamBuilder<int>(
          initialData: 0,
          stream: _homeController.naveListener.stream,
          builder: (context, AsyncSnapshot<int> snapshot) {
            int item = snapshot.data ?? 0;
            return screens[item];
          },
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
