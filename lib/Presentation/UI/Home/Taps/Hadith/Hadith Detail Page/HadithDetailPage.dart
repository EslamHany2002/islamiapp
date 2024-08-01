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
          icon: Icon(Icons.arrow_back, color: MyTheme.gold),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          hadeth.title,
          style: TextStyle(color: MyTheme.gold, fontFamily: "janna"),
        ),
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
            left: size.width * 0.35,
            child: Center(
              child: Text(
                hadeth.title,
                style: TextStyle(
                  color: MyTheme.gold,
                  fontFamily: "janna",
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SizedBox(height: 20),
                    Text(
                      hadeth.content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "janna",
                        color: MyTheme.gold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
