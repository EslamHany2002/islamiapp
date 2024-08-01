import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Quran/Quran_page/Quran_page.dart';
import 'package:islamiapp/file_page.dart';
import 'package:islamiapp/models/sura.dart';
import 'package:quran/quran.dart';

class Quran extends StatefulWidget {
  var suraJsonData;
  Quran({super.key, required this.suraJsonData});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  TextEditingController textEditingController = TextEditingController();

  bool isLoading = true;

  var searchQuery = "";
  var filteredData;
  List<Surah> surahList = [];
  var ayatFiltered;

  addFilteredDara() async {
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() {
      filteredData = widget.suraJsonData;
      isLoading = false;
    });
  }

  @override
  void initState() {
    addFilteredDara();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PNG/taj_mahal.png'),
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
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.25), // adjust top spacing
                TextFormField(
                  style: TextStyle(color: Color(0xffFEFFE8)),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });

                    if (value == "") {
                      filteredData = widget.suraJsonData;
                      setState(() {});
                    }

                    if (searchQuery.length > 3 || searchQuery.contains(" ")) {
                      setState(() {
                        filteredData = widget.suraJsonData.where((sura) {
                          final suraName = sura["englishName"].toLowerCase();
                          final suraNameTranslated =
                          getSurahNameArabic(sura["number"]);
                          return suraName.contains(searchQuery.toLowerCase()) ||
                              suraNameTranslated.contains(searchQuery.toLowerCase());
                        }).toList();
                      });
                    }
                  },
                  controller: textEditingController,
                  decoration: InputDecoration(
                    label: const Text(
                      "Sura Name",
                      style: TextStyle(
                        color: MyTheme.gold,
                        fontFamily: "Janna",
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8.0), // Adjust space as needed
                      child: SvgPicture.asset(
                        'assets/SVG/quran-svgrepo-com.svg',
                        width: 10,
                        color: MyTheme.gold, // Adjust based on image size
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: MyTheme.gold,
                        )),
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
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.red,
                        )),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.red,
                        )),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Expanded(
                  child: isLoading
                      ? Center(
                    child: CircularProgressIndicator(),
                  )
                      : ListView.separated(
                    padding: EdgeInsets.zero, // Remove extra padding if any
                    separatorBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      int suraNumber = index + 1;
                      String suraName =
                      filteredData[index]["englishName"];
                      String suraNameEnglishTranslated =
                      filteredData[index]["englishNameTranslation"];
                      int suraNumberInQuran =
                      filteredData[index]["number"];
                      String suraNameTranslated =
                      filteredData[index]["name"].toString();
                      int ayahCount = getVerseCount(suraNumber);

                      return Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Container(
                          child: ListTile(
                            leading: SizedBox(
                              width: 45,
                              height: 45,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/PNG/arabic-art-svgrepo-com 1.png',
                                    width: 250,
                                  ), // Replace with the path to your image
                                  Text(
                                    suraNumberInQuran.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold, // Ensure the text is bold enough
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            minVerticalPadding: 0,
                            title: SizedBox(
                              width: 90,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      suraName,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            subtitle: Text(
                              "$ayahCount Verses",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            trailing: Text(
                              suraNameTranslated,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            onTap: () async {
                              String fileName =
                                  '${suraNumberInQuran}.txt';
                              String suraNameArabic = suraNameTranslated;
                              String suraNameEnglish = suraName;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return QuranPage(
                                    fileName: fileName,
                                    suraNameArabic: suraNameArabic,
                                    suraNameEnglish: suraNameEnglish,
                                  );
                                }),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
