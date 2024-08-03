
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/models/Azkar.dart';


class AzkarSabahScreen extends StatefulWidget {
  @override
  _AzkarSabahScreenState createState() => _AzkarSabahScreenState();
}

class _AzkarSabahScreenState extends State<AzkarSabahScreen> {
  List<Azkar> azkarList = [];

  @override
  void initState() {
    super.initState();
    loadAzkar();
  }

  Future<void> loadAzkar() async {
    final String response =
    await rootBundle.loadString('assets/json/azkar.json');
    final Map<String, dynamic> data = json.decode(response);

    List<dynamic> azkarMorningList = data['أذكار الصباح'];

    // Flatten the list and filter out non-object elements
    List<dynamic> filteredList = [];
    for (var item in azkarMorningList) {
      if (item is List) {
        filteredList.addAll(item);
      } else if (item is Map) {
        filteredList.add(item);
      }
    }

    setState(() {
      azkarList = filteredList
          .map((json) => Azkar.fromJson(json))
          .where((azkar) => azkar.category == 'أذكار الصباح')
          .toList();
    });
  }

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
          // title: Text('Morning Azkar',style: TextStyle(color: Colors.white),),
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
            const Positioned(
                top: 65,
                left: 0,
                right: 0,
                child: Center(child: Text("أذكار الصباح",style: TextStyle(color: Colors.white,fontSize: 20,fontFamily: "janna"),))),
            Positioned(
              top: 120,
              left: 0,
              right: 0,
              bottom: 110,
              child: ListView.builder(
                itemCount: azkarList.length,
                itemBuilder: (context, index) {
                  final azkar = azkarList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: MyTheme.gold, width: 2), // Golden border
                      // color: Colors.black.withOpacity(0.5), // Background color of the box
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'المرات', // Label
                                style: TextStyle(color: MyTheme.gold,fontFamily: "janna"),
                              ),
                              const SizedBox(height: 4), // Space between label and number
                              Text(
                                azkar.count, // Number
                                style: const TextStyle(color: MyTheme.gold,fontFamily: "janna", fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            title: Text(
                              azkar.content,
                              style: const TextStyle(color: MyTheme.gold,fontFamily: "janna"),
                              textAlign: TextAlign.right, // Align text to the right
                            ),
                            subtitle: Text(
                              azkar.description,
                              style: const TextStyle(color: Colors.white,fontFamily: "janna"),
                              textAlign: TextAlign.right, // Align text to the right
                            ),
                            // Remove trailing from here
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
