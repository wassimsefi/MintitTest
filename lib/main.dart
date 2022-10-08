import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/utils/routes.dart';
import 'package:mintit/viewmodels/raning_view_list_model.dart';
import 'package:mintit/views/SplashScreenViewPage.dart';
import 'package:mintit/views/home/HomeViewPage.dart';
import 'package:mintit/views/models/user.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // theme: customLightTheme(),
      initialRoute: SplashScreenViewPage.routeName,
      routes: routes,
    );
  }
}
