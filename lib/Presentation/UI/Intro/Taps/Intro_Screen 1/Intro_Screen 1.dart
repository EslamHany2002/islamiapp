import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';

class IntroFirstScreen extends StatelessWidget {
  const IntroFirstScreen({super.key});

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
              'assets/PNG/Welcome2.png',
              width: size.width * 0.85,
            ),
          ),
          // Positioned(
          //   bottom: size.height * 0.22,
          //   left: size.width * 0.25,
          //   child: Text(
          //     "Choose Language",
          //     style: TextStyle(
          //       fontFamily: "Janna",
          //       fontSize: size.width * 0.06,
          //       color: MyTheme.gold,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: size.height * 0.22,
          //   left: size.width * 0.25,
          //   child: Text(
          //     "Choose Language",
          //     style: TextStyle(
          //       fontFamily: "Janna",
          //       fontSize: size.width * 0.06,
          //       color: MyTheme.gold,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: size.height * 0.15,
          //   left: size.width * 0.5 - size.width * 0.125,
          //   child: AnimatedToggleSwitch.rolling(
          //     values: const ["en", "ar"],
          //     height: size.height * 0.05,
          //     style: ToggleStyle(
          //       borderRadius: BorderRadius.circular(15),
          //       backgroundColor: Colors.transparent,
          //       borderColor: MyTheme.gold,
          //       indicatorColor: MyTheme.gold,
          //     ),
          //     current: 'en',
          //     spacing: 10,
          //     iconBuilder: (value, foreground) {
          //       if (value == "en") {
          //         return Flag(Flags.united_kingdom);
          //       } else {
          //         return Flag(Flags.egypt);
          //       }
          //     },
          //     // Uncomment and implement the onChanged callback
          //     // onChanged: (value) => localProvider.isEn()
          //     //     ? localProvider.changeLocal("ar")
          //     //     : localProvider.changeLocal("en"),
          //     borderWidth: 2,
          //   ),
          // ),
        ],
      ),
    );
  }
}
