import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:fruit_hub/feature/home/presentation/view/widgets/main_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: (index) {
          currentViewIndex = index;
          setState(() {});
        },
      ),
      body: SafeArea(child: MainViewBody(currentViewIndex: currentViewIndex)),
    );
  }
}
