import 'package:flutter/material.dart';
import 'package:fruit_hub/feature/auth/presentation/view/auth_view.dart';
import 'package:fruit_hub/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit_hub/feature/splash/presentation/view/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case AuthView.routeName:
      return MaterialPageRoute(builder: (context) => const AuthView());
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
