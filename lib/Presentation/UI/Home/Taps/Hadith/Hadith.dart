import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/models/Hadeeth.dart';
import 'Hadith%20Detail%20Page/HadithDetailPage.dart';

class Hadith extends StatefulWidget {
  const Hadith({super.key});

  @override
  State<Hadith> createState() => _HadithState();
}

class _HadithState extends State<Hadith> {
  List<Hadeth> allHadethList = [];
  List<Hadeth> filteredHadethList = [];

  @override
  void initState() {
    super.initState();
    loadHadethFile();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final searchFieldHeight = MediaQuery.of(context).size.height * 0.24; // Estimated height of the search field including padding

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PNG/Hadeth Screen.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.055, // adjusted value
            left: MediaQuery.of(context).size.width * 0.15, // adjusted value
            child: Image.asset(
              'assets/PNG/Mosque-01.png',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          Positioned(
            top: screenHeight * 0.128, // adjusted value
            left: MediaQuery.of(context).size.width * 0.16, // adjusted value
            child: Image.asset(
              'assets/PNG/Islami.png',
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.24,
            left: 16,
            right: 16,
            child: TextFormField(
              style: TextStyle(color: Color(0xffFEFFE8)),
              onChanged: (value) {
                setState(() {
                  filteredHadethList = allHadethList
                      .where((hadeth) => hadeth.title.toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                label: const Text(
                  "Hadith Name",
                  style: TextStyle(
                    color: MyTheme.gold,
                    fontFamily: "Janna",
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 12.0),
                  child: SvgPicture.asset(
                    'assets/SVG/book-album-svgrepo-com 1.svg',
                    width: 8,
                    color: MyTheme.gold,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 2,
                    color: MyTheme.gold,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 2,
                    color: MyTheme.gold,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 2,
                    color: MyTheme.gold,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10 + searchFieldHeight, // Start below the search field
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.030,
            child: filteredHadethList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : CarouselSlider.builder(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.55,
                autoPlay: false,
                enlargeCenterPage: false,
              ),
              itemCount: filteredHadethList.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final hadeth = filteredHadethList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HadithDetailPage(hadeth: hadeth),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 11.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyTheme.gold,
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: -70,
                          left: MediaQuery.of(context).size.width * 0 - 80,
                          child: Image.asset(
                            'assets/PNG/Mask group.png',
                            width: 280,
                            color: Colors.black,
                          ),
                        ),
                        Positioned(
                          top: -70,
                          right: MediaQuery.of(context).size.width * 0 - 80,
                          child: Image.asset(
                            'assets/PNG/Mask group2.png',
                            width: 280,
                            color: Colors.black,
                          ),
                        ),
                        Center(
                          child: Image.asset(
                            'assets/PNG/HadithCardBackGround.png',
                            color: Colors.black12,
                            width: MediaQuery.of(context).size.width * 0.65,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Image.asset(
                            'assets/PNG/Mosque-02.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                            color: Colors.black26,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                hadeth.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: "janna",
                                  color: MyTheme.background,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                truncateText(hadeth.content, 100),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "janna",
                                  color: MyTheme.background,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String truncateText(String text, int length) {
    if (text.length <= length) {
      return text;
    } else {
      return text.substring(0, length) + '....';
    }
  }

  void loadHadethFile() async {
    List<Hadeth> hadethList = [];
    String content = await rootBundle.loadString("assets/Suras/ahadith.txt");
    List<String> allHadethContent = content.split("#");
    for (int i = 0; i < allHadethContent.length; i++) {
      String singleHadeth = allHadethContent[i].trim();
      int indexOfFirstLine = singleHadeth.indexOf("\n");
      String title = singleHadeth.substring(0, indexOfFirstLine);
      String content = singleHadeth.substring(indexOfFirstLine + 1);

      Hadeth h = Hadeth(title, content);
      hadethList.add(h);
    }
    setState(() {
      allHadethList = hadethList;
      filteredHadethList = hadethList; // Initially, display all Hadiths
    });
  }
}
