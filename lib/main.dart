import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/utils/routes.dart';
import 'package:mintit/views/SplashScreenViewPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(ColorsApp.kPrimaryColor);

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
