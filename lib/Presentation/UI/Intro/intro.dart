import 'package:flutter/material.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/Presentation/UI/Home/HomePage.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Quran/Quran.dart';
import 'package:islamiapp/Presentation/UI/Intro/Taps/Intro_Screen%201/Intro_Screen%201.dart';
import 'package:islamiapp/Presentation/UI/Intro/Taps/Intro_Screen%204/Intro_Screen%204.dart';
import 'package:islamiapp/Presentation/UI/Intro/Taps/Intro_Screen%205/Intro_Screen%205.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Taps/Intro_Screen 2/Intro_Screen 2.dart';
import 'Taps/Intro_Screen 3/Intro_Screen 3.dart';


class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController _controller = PageController();
  bool onLastPage = false;
  bool onFirstPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: MyTheme.background,
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 4);
                  onFirstPage = (index == 0);
                });
              },
              children: const [
                IntroFirstScreen(),
                IntroSecondScreen(),
                IntroThirdScreen(),
                IntroForthScreen(),
                IntroFiveScreen(),
              ],
            ),
            // Container(
            //   alignment: const Alignment(0.75, -0.85),
            //   child: onLastPage
            //       ? GestureDetector(onTap: () {}, child: const Text(""))
            //       : GestureDetector(
            //       onTap: () {
            //         _controller.jumpToPage(2);
            //       },
            //       child: const Text("Skip", style: TextStyle(fontSize: 18))),
            // ),
            Container(
                alignment: const Alignment(0, 0.93),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    onFirstPage
                        ? GestureDetector(onTap: () {}, child: const Text(""))
                        : GestureDetector(
                        onTap: () {
                          _controller.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                          // _controller.jumpToPage(2);
                        },
                        child: const Text(
                          "Back",
                          style: TextStyle(fontSize: 18,color: MyTheme.gold),
                        )),
                    SmoothPageIndicator(
                        controller: _controller,
                        count: 5,
                        effect: const ExpandingDotsEffect(dotColor: MyTheme.gold,activeDotColor: MyTheme.gold)),
                    onLastPage
                        ? GestureDetector(
                        onTap: () async{
                          // final prefs = await SharedPreferences.getInstance();
                          // await prefs.setBool('isFirstTime', false);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return Home();
                            }),
                          );
                        },
                        child: const Text(
                          "Finish",
                          style: TextStyle(fontSize: 18,color: MyTheme.gold),
                        ))
                        : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(fontSize: 18,color: MyTheme.gold),
                        )),
                  ],
                ))
          ],
        ));
  }
}