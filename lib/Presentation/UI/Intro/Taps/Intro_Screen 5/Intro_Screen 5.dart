import 'package:flutter/material.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';

class IntroFiveScreen extends StatelessWidget {
  const IntroFiveScreen({super.key});

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
              'assets/PNG/radio.png',
              width: size.width * 0.5,
            ),
          ),
          Positioned(
            bottom: size.height * 0.21,
            left: size.width * 0.47 - size.width * 0.2,
            child: Text(
              "Holy Quran Radio",
              style: TextStyle(
                fontFamily: "Janna",
                fontSize: size.width * 0.06,
                color: MyTheme.gold,
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.1,
            left: size.width * 0.47 - size.width * 0.3,
            child: Text.rich(
              TextSpan(
                text: 'You can listen to the Holy Quran\n',
                style: TextStyle(
                  color: MyTheme.gold,
                  fontSize: size.width * 0.045,
                  fontFamily: "Janna",
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Radio through the application for\n',
                  ),
                  TextSpan(
                    text: 'free and easily',
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
