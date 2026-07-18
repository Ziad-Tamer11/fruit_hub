import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/auth/presentation/view/login_view.dart';
import 'package:fruit_hub/feature/auth/presentation/view/sign_up_view.dart';
import 'package:fruit_hub/feature/best_selling_fruits/presentation/view/best_selling_fruits_view.dart';
import 'package:fruit_hub/feature/home/presentation/view/home_view.dart';
import 'package:fruit_hub/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit_hub/feature/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case BestSellingFruitsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const BestSellingFruitsView(),
      );
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
