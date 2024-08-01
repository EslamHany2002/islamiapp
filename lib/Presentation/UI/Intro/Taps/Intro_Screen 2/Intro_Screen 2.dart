import 'package:flutter/material.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';

class IntroSecondScreen extends StatelessWidget {
  const IntroSecondScreen({super.key});

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
              'assets/PNG/kabba.png',
              width: size.width * 0.88,
            ),
          ),
          Positioned(
            bottom: size.height * 0.225,
            left: size.width * 0.44 - size.width * 0.185,
            child: Text(
              "Welcome To Islami",
              style: TextStyle(
                fontFamily: "Janna",
                fontSize: size.width * 0.06,
                color: MyTheme.gold,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.15,
            left: size.width * 0.5 - size.width * 0.37,
            child: Text.rich(
              TextSpan(
                text: 'We Are Very Excited To Have You In\n',
                style: TextStyle(
                  color: MyTheme.gold,
                  fontSize: size.width * 0.045,
                  fontFamily: "Janna",
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Our Community',
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
