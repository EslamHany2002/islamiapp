import 'package:flutter/material.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/models/Suras.dart';

class QuranPage extends StatefulWidget {
  final String fileName;
  final String suraNameArabic;
  final String suraNameEnglish;

  QuranPage({
    super.key,
    required this.fileName,
    required this.suraNameEnglish,
    required this.suraNameArabic,
  });

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  final FileManager _fileManager = FileManager();
  int index = 0;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: MyTheme.background,
      appBar: AppBar(
        backgroundColor: MyTheme.background,
        // titleSpacing: size.width * 0.24,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyTheme.gold),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Center(
        //   child: Text(
        //     widget.suraNameEnglish,
        //     style: const TextStyle(color: MyTheme.gold, fontFamily: "janna"),
        //   ),
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
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                widget.suraNameArabic,
                style: const TextStyle(
                  color: MyTheme.gold,
                  fontFamily: "janna",
                  fontSize: 24,
                ),
              ),
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
            top: 120,
            left: 0,
            right: 0,
            bottom: 110,
            child: FutureBuilder<String>(
              future: _fileManager.loadFile(widget.fileName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  List<String> lines = snapshot.data!.split('\n').map((line) => line.trim()).toList();
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: ListView.builder(
                      itemCount: lines.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 15.0, left: 18, right: 18),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: MyTheme.gold),
                            ),
                            child: Center(
                              child: Text(
                                '[${index + 1}] ${lines[index]}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: MyTheme.gold,
                                  fontFamily: "janna",
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
