import 'package:flutter/material.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';

class IntroForthScreen extends StatelessWidget {
  const IntroForthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyTheme.background,
      body: Stack(
        children: [
          Positioned(
            top: size.height * 0.055,
            left: size.width * 0.15,
            child: Image.asset(
              'assets/PNG/Mosque-01.png',
              width: size.width * 0.7,
            ),
          ),
          Positioned(
            top: size.height * 0.128,
            left: size.width * 0.16,
            child: Image.asset(
              'assets/PNG/Islami.png',
              width: size.width * 0.7,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/PNG/bearish.png',
              width: size.width * 0.7,
            ),
          ),
          Positioned(
            bottom: size.height * 0.22,
            left: size.width * 0.51 - size.width * 0.1,
            child: Text(
              "Bearish",
              style: TextStyle(
                fontFamily: "Janna",
                fontSize: size.width * 0.06,
                color: MyTheme.gold,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.15,
            left: size.width * 0.46 - size.width * 0.3,
            child: Text.rich(
              TextSpan(
                text: 'Praise the name of your Lord, the\n',
                style: TextStyle(
                  color: MyTheme.gold,
                  fontSize: size.width * 0.045,
                  fontFamily: "Janna",
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Most High',
                    style: TextStyle(
                      color: MyTheme.gold,
                      fontSize: size.width * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
