import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mintit/utils/colors.dart';
import 'package:mintit/utils/error_message.dart';
import 'package:mintit/utils/size_config.dart';
import 'package:mintit/viewmodels/raning_view_list_model.dart';
import 'package:mintit/views/home/HomeViewPage.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        //  alignment: Alignment.center,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight! * 0.16,
          ),
          Image.asset(
            'assets/images/logo_2.png',
          ),
          buildCard()
        ],
      ),
    );
  }

  Widget buildCard() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          //logo & text

          SizedBox(
            height: SizeConfig.screenHeight! * 0.05,
          ),
          richText(24),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.01,
          ),
          const Text("Introduce Yourself"),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.1,
          ),

          //firstname & lastname textField

          firstnameTextField(),

          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          lastnameTextField(),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.05,
          ),

          //remember & forget text
          SizedBox(
            height: SizeConfig.screenHeight! * 0.05,
          ),

          //sign in button
          loginButton(),
        ],
      ),
    );
  }

  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        style: GoogleFonts.inter(
          fontSize: fontSize,
          color: Colors.black,
        ),
        children: const [
          TextSpan(
            text: 'Let’s Get Familiar',
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget firstnameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "First name",
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.01,
          ),
          TextFormField(
            controller: firstnameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return kfirstnameNullError;
              }
              if (!nameValidatorRegExp.hasMatch(value)) {
                return knameError;
              }
              return null;
            },
            style: GoogleFonts.inter(
              fontSize: 18.0,
              color: ColorsApp.kcursorColor,
            ),
            maxLines: 1,
            keyboardType: TextInputType.name,
            cursorColor: ColorsApp.kcursorColor,
            decoration: InputDecoration(
              hintText: 'Enter your firstName',
              hintStyle: GoogleFonts.inter(
                fontSize: 16.0,
                color: ColorsApp.kcursorColor.withOpacity(0.5),
              ),
              filled: true,
              fillColor: firstnameController.text.isEmpty
                  ? ColorsApp.kSecondaryColor
                  : Colors.transparent,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: firstnameController.text.isEmpty
                        ? ColorsApp.kbordorColor
                        : ColorsApp.kbordorcursorColor,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: ColorsApp.kbordorcursorColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget lastnameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Last name",
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.01,
          ),
          TextFormField(
            controller: lastnameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value!.isEmpty) {
                return klastnameNullError;
              }
              if (!nameValidatorRegExp.hasMatch(value)) {
                return knameError;
              }
              return null;
            },
            style: GoogleFonts.inter(
              fontSize: 18.0,
              color: ColorsApp.kcursorColor,
            ),
            maxLines: 1,
            keyboardType: TextInputType.name,
            cursorColor: ColorsApp.kcursorColor,
            decoration: InputDecoration(
              hintText: 'Enter your lastName',
              hintStyle: GoogleFonts.inter(
                fontSize: 16.0,
                color: ColorsApp.kcursorColor.withOpacity(0.5),
              ),
              filled: true,
              fillColor: firstnameController.text.isEmpty
                  ? ColorsApp.kSecondaryColor
                  : Colors.transparent,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: firstnameController.text.isEmpty
                        ? ColorsApp.kbordorColor
                        : ColorsApp.kbordorcursorColor,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: ColorsApp.kbordorcursorColor,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginButton() {
    return TextButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();

            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeViewPage(
                        firstnameController.text, lastnameController.text)));

            // Navigator.pushNamed(context, HomeViewPage.routeName);
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: SizeConfig.screenHeight! / 13,
          width: SizeConfig.screenWidth! * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            gradient: ColorsApp.kbackgroundGradientColor,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4C2E84).withOpacity(0.2),
                offset: const Offset(0, 15.0),
                blurRadius: 60.0,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'NEXT',
                style: GoogleFonts.inter(
                  fontSize: 20.0,
                  color: ColorsApp.kSecondaryColor,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const Icon(
                Icons.arrow_right,
                color: ColorsApp.kSecondaryColor,
              )
            ],
          ),
        ));
  }
}
