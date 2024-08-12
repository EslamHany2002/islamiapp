import 'package:flutter/material.dart';

class Sabhuh extends StatefulWidget {
  const Sabhuh({super.key});

  @override
  State<Sabhuh> createState() => _SabhuhState();
}

class _SabhuhState extends State<Sabhuh> {
  double angle = 0.0;
  int currentIndex = 0;
  int counter = 0;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله اكبر",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PNG/Tas Background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.055, // adjusted value
            left: MediaQuery.of(context).size.width * 0.15, // adjusted value
            child: Image.asset(
              'assets/PNG/Mosque-01.png',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.128, // adjusted value
            left: MediaQuery.of(context).size.width * 0.16, // adjusted value
            child: Image.asset(
              'assets/PNG/Islami.png',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.255, // adjusted value

            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              // color: Colors.red,
              child: Text(
                "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "janna",
                  fontSize: MediaQuery.of(context).size.width * 0.08,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.07, // adjusted value
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.475, // adjusted value
                    child: Image.asset(
                      "assets/PNG/sebha body2.png",
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.09, // adjusted value
                    // right: MediaQuery.of(context).size.width * 0.08, // adjusted value
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            onClick();
                          });
                        },
                        child: Transform.rotate(
                          angle: angle,
                          child: Image.asset(
                            "assets/PNG/SebhaBody 1.png",
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.2, // adjusted value
                    // left: MediaQuery.of(context).size.width * 0.3, // adjusted value
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width ,
                      // color: Colors.red,
                      child: Text(
                        azkar[currentIndex],
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "janna",
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.15, // adjusted value
                    // left: MediaQuery.of(context).size.width * 0.3, // adjusted value
                    child: Container(
                      alignment: Alignment.center,
                      // color: Colors.red,
                      width: MediaQuery.of(context).size.width ,
                      child: Text(
                        counter.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "janna",
                          fontSize: MediaQuery.of(context).size.width * 0.08,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onClick() {
    setState(() {
      counter++;
      angle--;
      if (counter == 33) {
        currentIndex++;
        counter = 0;
      }
      if (currentIndex > azkar.length - 1) {
        currentIndex = 0;
      }
    });
  }
}