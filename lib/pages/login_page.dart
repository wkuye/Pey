import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  final int index = 0;
  final int registerIndex = 1;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final primaryColor = AdaptiveTheme.of(context).theme.primaryColor;
    final indicatorColor = AdaptiveTheme.of(context).theme.indicatorColor;
    final buttonColor = AdaptiveTheme.of(context).theme.cardColor;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(themeBool ? aboutToLight : aboutTo),
              fit: BoxFit.cover)),
      child: Column(
        children: [
          const Spacer(
            flex: 13,
          ),
          Image.asset(pey),
          const Spacer(
            flex: 5,
          ),
          Material(
              type: MaterialType.transparency,
              child: Text(
                aboutText1,
                style: TextStyle(color: primaryColor, fontSize: 30),
              )),
          const Spacer(
            flex: 2,
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, '/loginScreen', (route) => true,
                arguments: index),
            child: Container(
              height: size.height / 15,
              width: size.width / 1.1,
              decoration: BoxDecoration(
                  color: const Color(onBoardingButtonColor),
                  borderRadius: BorderRadius.circular(10)),
              child: const Material(
                  type: MaterialType.transparency,
                  child: Center(
                      child: Text(
                    loginText,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ))),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Material(
                  type: MaterialType.transparency,
                  child: Text(
                    aboutText2,
                    style: TextStyle(color: primaryColor, fontSize: 18),
                  )),
              Material(
                  type: MaterialType.transparency,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/loginScreen', (route) => true,
                            arguments: registerIndex);
                      },
                      child: const Text(
                        aboutText3,
                        style: TextStyle(
                            color: Color(registerColor), fontSize: 18),
                      ))),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: Divider(
                color: indicatorColor,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              )),
              Material(
                  type: MaterialType.transparency,
                  child: Text(
                    or,
                    style: TextStyle(color: indicatorColor, fontSize: 15),
                  )),
              Flexible(
                  child: Divider(
                color: indicatorColor,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ))
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            height: size.height / 13.5,
            width: size.width / 1.08,
            decoration: BoxDecoration(
              color: buttonColor,
                border:themeBool? Border.all():null,
                borderRadius: BorderRadius.circular(15)),
            child:  Material(
                type: MaterialType.transparency,
                child: Center(
                    child: Text(
                  appleText,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))),
          ),
          const Spacer(),
          Container(
            height: size.height / 13.5,
            width: size.width / 1.08,
            decoration: BoxDecoration(
                color: buttonColor,
                border:themeBool? Border.all():null,
                borderRadius: BorderRadius.circular(15)),
            child:Material(
                type: MaterialType.transparency,
                child: Center(
                    child: Text(
                  googleText,
                  style: TextStyle(
                      color:primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))),
          ),
          const Spacer(),
          Container(
            height: size.height / 13.5,
            width: size.width / 1.08,
            decoration: BoxDecoration(
               color: buttonColor,
                border:themeBool? Border.all():null,
                borderRadius: BorderRadius.circular(15)),
            child:  Material(
                type: MaterialType.transparency,
                child: Center(
                    child: Text(
                  facebookText,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ))),
          ),
          const Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }
}
