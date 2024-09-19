import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_client/app/navigation/app_route.dart';

class SplashScreenViewModel {
  void gotoHomeScreen(BuildContext context) {
    context.go(AppRoute.main);
  }
}
