import 'package:flutter/material.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';

class IntroThirdScreen extends StatelessWidget {
  const IntroThirdScreen({super.key});

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
              'assets/PNG/welcome.png',
              width: size.width * 0.7,
            ),
          ),
          Positioned(
            bottom: size.height * 0.21,
            left: size.width * 0.44 - size.width * 0.185,
            child: Text(
              "Reading the Quran",
              style: TextStyle(
                fontFamily: "Janna",
                fontSize: size.width * 0.06,
                color: MyTheme.gold,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.14,
            left: size.width * 0.485 - size.width * 0.31,
            child: Text.rich(
              TextSpan(
                text: 'Read, and your Lord is the Most\n',
                style: TextStyle(
                  color: MyTheme.gold,
                  fontSize: size.width * 0.045,
                  fontFamily: "Janna",
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Generous',
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
