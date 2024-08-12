import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/Presentation/UI/Home/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islamiapp/Presentation/UI/Intro/intro.dart';
 // Assuming you have a Home screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;

    Future.delayed(const Duration(seconds: 3), () {
      if (isFirstTime) {
        prefs.setBool('isFirstTime', false);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Intro()));
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) =>  Home()));
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/PNG/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.06,
          left: screenWidth * 0.15,
          child: Image.asset(
            'assets/PNG/Mosque-01.png',
            width: screenWidth * 0.7,
          ),
        ),
        Positioned(
          right: screenWidth * 0.05,
          child: Image.asset(
            'assets/PNG/Glow.png',
            width: screenWidth * 0.2,
          ),
        ),
        Positioned(
          top: screenHeight * 0.25,
          left: 0,
          child: Image.asset(
            'assets/PNG/Shape-07.png',
            width: screenWidth * 0.18,
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.11,
          right: 0,
          child: Image.asset(
            'assets/PNG/Shape-04.png',
            width: screenWidth * 0.18,
          ),
        ),
        Center(
          child: SvgPicture.asset(
            'assets/SVG/logo2.svg',
            width: screenWidth * 0.42,
            color: const Color(0xffC0A37C),
          ),
        ),
        Positioned(
          bottom: screenHeight * 0.34,
          left: screenWidth * 0.32,
          child: Image.asset(
            'assets/PNG/Islami.png',
            width: screenWidth * 0.38,
          ),
        ),
      ],
    );
  }
}
