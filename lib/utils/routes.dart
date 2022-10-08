import 'package:flutter/material.dart';
import 'package:mintit/views/SplashScreenViewPage.dart';
import 'package:mintit/views/home/HomeViewPage.dart';
import 'package:mintit/views/login/LoginViewPage.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreenViewPage.routeName: (context) => const SplashScreenViewPage(),
  LoginViewPage.routeName: (context) => const LoginViewPage(),
  // HomeViewPage.routeName: (context) =>  HomeViewPage(),
};
