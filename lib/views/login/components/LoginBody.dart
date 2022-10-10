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
            height: getProportionateScreenHeight(144),
          ),
          imageLogin(),
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
            height: getProportionateScreenHeight(48),
          ),
          richText(24),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          const Text("Introduce Yourself"),
          SizedBox(
            height: getProportionateScreenHeight(153),
          ),

          //firstname & lastname textField

          firstnameTextField(),
          SizedBox(
            height: getProportionateScreenHeight(23),
          ),
          lastnameTextField(),

          //remember & forget text
          SizedBox(
            height: getProportionateScreenHeight(99),
          ),
          //sign in button
          loginButton(),
        ],
      ),
    );
  }

  Widget imageLogin() {
    return Image.asset(
      'assets/images/logo_2.png',
      width: getProportionateScreenWidth(153),
      height: getProportionateScreenHeight(38),
    );
  }

  Widget richText(double fontSize) {
    return const Text(
      'Let’s Get Familiar',
      style: TextStyle(
          fontFamily: 'Rounded', fontWeight: FontWeight.w700, fontSize: 30),
    );
  }

  Widget firstnameTextField() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(48)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "First name",
            style: TextStyle(
                fontFamily: 'Rounded',
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          SizedBox(
            height: getProportionateScreenHeight(8),
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
            style: const TextStyle(
                fontFamily: 'Rounded',
                fontWeight: FontWeight.w400,
                fontSize: 15),
            maxLines: 1,
            keyboardType: TextInputType.name,
            cursorColor: ColorsApp.kcursorColor,
            decoration: InputDecoration(
              hintText: 'Enter your firstName',
              hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
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
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(48)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Last name",
            style: TextStyle(
                fontFamily: 'Rounded',
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          SizedBox(
            height: getProportionateScreenHeight(8),
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
            style: const TextStyle(
                fontFamily: 'Rounded',
                fontWeight: FontWeight.w400,
                fontSize: 15),
            maxLines: 1,
            keyboardType: TextInputType.name,
            cursorColor: ColorsApp.kcursorColor,
            decoration: InputDecoration(
              hintText: 'Enter your lastName',
              hintStyle: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
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
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(102)),
      child: TextButton(
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
            height: getProportionateScreenHeight(55),
            width: getProportionateScreenWidth(209),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              gradient: ColorsApp.kbackgroundGradientColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'NEXT',
                  style: TextStyle(
                      fontFamily: 'Rounded',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: ColorsApp.kSecondaryColor),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.arrow_right,
                  color: ColorsApp.kSecondaryColor,
                )
              ],
            ),
          )),
    );
  }
}
