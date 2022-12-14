import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/utils/size_config.dart';

class SplashScreenViewPage extends StatefulWidget {
  static const String routeName = "/splash_screen";
  const SplashScreenViewPage({super.key});

  @override
  State<SplashScreenViewPage> createState() => _SplashScreenViewPageState();
}

class _SplashScreenViewPageState extends State<SplashScreenViewPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, '/login_screen');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: ColorsApp.kbackgroundGradientColor,
        ),
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(412),
              horizontal: getProportionateScreenWidth(64)),
          child: SvgPicture.asset(
            'assets/svg/logo_app.svg',
          ),
        ),
      ),
    );
  }
}
