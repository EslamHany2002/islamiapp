import 'package:flutter/material.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/models/Hadeeth.dart';

class HadithDetailPage extends StatelessWidget {
  final Hadeth hadeth;

  const HadithDetailPage({Key? key, required this.hadeth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyTheme.background,
      appBar: AppBar(
        backgroundColor: MyTheme.background,
        titleSpacing: size.width * 0.24,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyTheme.gold),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Text(
        //   hadeth.title,
        //   style: TextStyle(color: MyTheme.gold, fontFamily: "janna"),
        // ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: -70,
            left: size.width * 0 - 80,
            child: Image.asset(
              'assets/PNG/Mask group.png',
              width: 280,
            ),
          ),
          Positioned(
            top: -70,
            right: size.width * 0 - 80,
            child: Image.asset(
              'assets/PNG/Mask group2.png',
              width: 280,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Image.asset(
              'assets/PNG/Mosque-02.png',
              width: MediaQuery.of(context).size.width * 1,
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                hadeth.title,
                style: const TextStyle(
                  color: MyTheme.gold,
                  fontFamily: "janna",
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            bottom: 110,
            child: ListView(children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  hadeth.content,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: "janna",
                    color: MyTheme.gold,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
