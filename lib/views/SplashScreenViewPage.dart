import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/utils/size_config.dart';
import 'package:mintit/views/login/LoginViewPage.dart';
import 'package:splashscreen/splashscreen.dart';

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
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginViewPage()));
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
