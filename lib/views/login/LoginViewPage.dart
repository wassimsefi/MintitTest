import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/views/login/components/LoginBody.dart';

import '../../utils/size_config.dart';

class LoginViewPage extends StatelessWidget {
  static const String routeName = "/login_screen";

  const LoginViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      backgroundColor: ColorsApp.kSecondaryColor,
      body: LoginBody(),
    );
  }
}
