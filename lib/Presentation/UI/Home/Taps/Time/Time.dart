// import 'package:adhan/adhan.dart';
// import 'package:flutter/material.dart';
// import 'package:infinite_carousel/infinite_carousel.dart';
// import 'package:islamiapp/Core/Theme/MyTheme.dart';
// import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Azkar%20Sabah%20Screen/AzkarSabahScreen.dart';
// import 'package:islamiapp/Presentation/UI/Home/Taps/Time/AzkarMasaScreen.dart';
// import 'package:islamiapp/models/Azkar.dart';
// import 'package:location/location.dart';
// import 'package:intl/intl.dart';
//
// class Time extends StatefulWidget {
//   const Time({super.key});
//
//   @override
//   State<Time> createState() => _TimeState();
// }
//
// class _TimeState extends State<Time> {
//
//   List<Azkar>? azkarSabah;
//   final String dayName = DateFormat('EEEE').format(DateTime.now());
//   Location location = new Location();
//   LocationData? _currentPosition;
//   double? latitude, longitude;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               height: MediaQuery.of(context).size.height + 500,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assets/PNG/time Background.png'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.05,
//               left: MediaQuery.of(context).size.width * 0.15,
//               child: Image.asset(
//                 'assets/PNG/Mosque-01.png',
//                 width: MediaQuery.of(context).size.width * 0.7,
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.123,
//               left: MediaQuery.of(context).size.width * 0.16,
//               child: Image.asset(
//                 'assets/PNG/Islami.png',
//                 width: MediaQuery.of(context).size.width * 0.7,
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.236,
//               left: 0,
//               right: 0,
//               child: Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   // decoration: BoxDecoration(
//                   //   borderRadius: BorderRadius.circular(40),
//                   //   color: const Color(0xff856B3F),
//                   // ),
//                   alignment: Alignment.center,
//                   height: MediaQuery.of(context).size.height * 0.344,
//                   width: MediaQuery.of(context).size.width * 0.49,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         // width: MediaQuery.of(context).size.width ,w
//                         // height: MediaQuery.of(context).size.height * 0.32,
//                         child: Image.asset("assets/PNG/Group 28.png",width: MediaQuery.of(context).size.width ,height: MediaQuery.of(context).size.height,),
//                       ),
//                       Positioned(
//                         // top: 0,
//                         child: FutureBuilder(
//                           future: getLoc(),
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return Center(
//                                 child: CircularProgressIndicator(
//                                   color: Colors.white,
//                                 ),
//                               );
//                             }
//
//                             if (snapshot.connectionState ==
//                                     ConnectionState.done &&
//                                 snapshot.hasData) {
//                               final locationData =
//                                   snapshot.data as Map<String, double>;
//                               final myCoordinates = Coordinates(
//                                   locationData['latitude']!,
//                                   locationData['longitude']!);
//                               final params =
//                                   CalculationMethod.egyptian.getParameters();
//                               params.madhab = Madhab.hanafi;
//                               final prayerTimes =
//                                   PrayerTimes.today(myCoordinates, params);
//
//                               final List<Map<String, dynamic>> prayerTimesList =
//                                   [
//                                 {'name': 'Fajr', 'time': prayerTimes.fajr},
//                                 {'name': 'Dhuhr', 'time': prayerTimes.dhuhr},
//                                 {'name': 'Asr', 'time': prayerTimes.asr},
//                                 {
//                                   'name': 'Maghrib',
//                                   'time': prayerTimes.maghrib
//                                 },
//                                 {'name': 'Isha', 'time': prayerTimes.isha},
//                               ];
//
//                               return InfiniteCarousel.builder(
//                                 itemCount: prayerTimesList.length,
//                                 itemExtent: 120,
//                                 center: true,
//                                 anchor: 0.0,
//                                 velocityFactor: 0.2,
//                                 onIndexChanged: (index) {},
//                                 axisDirection: Axis.horizontal,
//                                 loop: true,
//                                 itemBuilder: (context, itemIndex, realIndex) {
//                                   final prayer = prayerTimesList[itemIndex];
//                                   return Container(
//                                     width:
//                                         MediaQuery.of(context).size.width * 0.7,
//                                     margin: EdgeInsets.only(
//                                         left: MediaQuery.of(context).size.width * 0.025,
//                                         right: MediaQuery.of(context).size.width * 0.025,
//                                         bottom: MediaQuery.of(context).size.height * 0.050,
//                                         top: MediaQuery.of(context).size.width * 0.28),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(15),
//                                       gradient: LinearGradient(
//                                         colors: [
//                                           MyTheme.background,
//                                           Color(0xffB19768)
//                                         ],
//                                         begin: Alignment.topLeft,
//                                         end: Alignment.bottomRight,
//                                       ),
//                                     ),
//                                     child: Center(
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Text(
//                                             prayer['name'],
//                                             style: TextStyle(
//                                                 fontSize: 20.0,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white),
//                                           ),
//                                           Text(
//                                             DateFormat.jm().format(
//                                                 prayer['time'] as DateTime),
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 22),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               );
//                             }
//
//                             return Center(
//                               child: Text(
//                                 'Error in retrieving location data',
//                                 style: TextStyle(color: Colors.red),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Positioned(
//                         top: MediaQuery.of(context).size.height * 0.016,
//                         right: 0,
//                         left: 0,
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           alignment: Alignment.center,
//                           // color: Colors.red,
//                           child: Text(
//                             "Pray Time",
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0x51000000),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: MediaQuery.of(context).size.height * 0.063,
//                         right: 0,
//                         left: 0,
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           alignment: Alignment.center,
//                           // color: Colors.red,
//                           child: Text(
//                             dayName,
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: MyTheme.background,
//                             ),
//                           ),
//                         ),
//                       )
//                       // Text(DateFormat.DAY)
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.62,
//               left: MediaQuery.of(context).size.width * 0.04,
//               child: Row(
//                 children: [
//                   Column(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => AzkarMasaScreen()),
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: MyTheme.background,
//                             border: Border.all(color: MyTheme.gold),
//                           ),
//                           alignment: Alignment.center,
//                           height: 259,
//                           width: 185,
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: MediaQuery.of(context).size.height * 0.02,
//                                 left: 0,
//                                 right: 0,
//                                 child:
//                                     Image.asset("assets/PNG/Illustration2.png"),
//                               ),
//                               Positioned(
//                                 bottom: 10,
//                                 left: 0,
//                                 right: 0,
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     "Evening Azkar",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: "janna",
//                                         fontSize: 20),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: MyTheme.background,
//                           border: Border.all(color: MyTheme.gold),
//                         ),
//                         alignment: Alignment.center,
//                         height: 259,
//                         width: 185,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: MediaQuery.of(context).size.height * 0.02,
//                               left: 0,
//                               right: 0,
//                               child:
//                                   Image.asset("assets/PNG/Illustration3.png"),
//                             ),
//                             Positioned(
//                               bottom: 10,
//                               left: 0,
//                               right: 0,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "Waking Azkar",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontFamily: "janna",
//                                       fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: MyTheme.background,
//                           border: Border.all(color: MyTheme.gold),
//                         ),
//                         alignment: Alignment.center,
//                         height: 259,
//                         width: 185,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: MediaQuery.of(context).size.height * 0.02,
//                               left: 0,
//                               right: 0,
//                               child:
//                               Image.asset("assets/PNG/Illustration4.png"),
//                             ),
//                             Positioned(
//                               bottom: 10,
//                               left: 0,
//                               right: 0,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "Sleeping Azkar",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontFamily: "janna",
//                                       fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.02,
//                   ),
//                   Column(
//                     children: [
//                       InkWell(
//                         onTap: (){
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => AzkarSabahScreen()),
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(25),
//                             color: MyTheme.background,
//                             border: Border.all(color: MyTheme.gold),
//                           ),
//                           alignment: Alignment.center,
//                           height: 259,
//                           width: 185,
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 top: MediaQuery.of(context).size.height * 0.02,
//                                 left: 0,
//                                 right: 0,
//                                 child: Image.asset("assets/PNG/Illustration.png"),
//                               ),
//                               Positioned(
//                                 bottom: 10,
//                                 left: 0,
//                                 right: 0,
//                                 child: Container(
//                                   alignment: Alignment.center,
//                                   child: Text(
//                                     "Morning Azkar",
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontFamily: "janna",
//                                         fontSize: 20),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: MyTheme.background,
//                           border: Border.all(color: MyTheme.gold),
//                         ),
//                         alignment: Alignment.center,
//                         height: 259,
//                         width: 185,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: MediaQuery.of(context).size.height * 0.02,
//                               left: 0,
//                               right: 0,
//                               child:
//                                   Image.asset("assets/PNG/Illustration4.png"),
//                             ),
//                             Positioned(
//                               bottom: 10,
//                               left: 0,
//                               right: 0,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "Sleeping Azkar",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontFamily: "janna",
//                                       fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: MediaQuery.of(context).size.height * 0.02,
//                       ),
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(25),
//                           color: MyTheme.background,
//                           border: Border.all(color: MyTheme.gold),
//                         ),
//                         alignment: Alignment.center,
//                         height: 259,
//                         width: 185,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               top: MediaQuery.of(context).size.height * 0.02,
//                               left: 0,
//                               right: 0,
//                               child:
//                               Image.asset("assets/PNG/Illustration4.png"),
//                             ),
//                             Positioned(
//                               bottom: 10,
//                               left: 0,
//                               right: 0,
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   "Sleeping Azkar",
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontFamily: "janna",
//                                       fontSize: 20),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   getLoc() async {
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;
//
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return null;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return null;
//       }
//     }
//
//     _currentPosition = await location.getLocation();
//     latitude = _currentPosition!.latitude!;
//     longitude = _currentPosition!.longitude!;
//     return {'latitude': latitude!, 'longitude': longitude!}; // إعادة الإحداثيات
//   }
// }
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:islamiapp/Core/Theme/MyTheme.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Azkar%20Section/After%20prayers%20Azkar/AfterprayersAzkar.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Azkar%20Section/AlnowmAzkarScreen/Alnowm%20Azkar.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Azkar%20Section/Azkar%20Masa%20Screen/AzkarMasaScreen.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Azkar%20Section/Azkar%20Sabah%20Screen/AzkarSabahScreen.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Azkar%20Section/Quran%20supplications/QuranSupplicationsScreen.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Azkar%20Section/Tasabih/tasabihScreen.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Azkar%20Section/The%20Prophets%20Supplications/ProphetsSuplications.dart';
import 'package:islamiapp/Presentation/UI/Home/Taps/Time/Azkar%20Section/Wake%20up%20Azkar%20Screen/WakeUpScreen.dart';

import 'package:islamiapp/models/Azkar.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  List<Azkar>? azkarSabah;
  final String dayName = DateFormat('EEEE').format(DateTime.now());
  Location location = Location();
  LocationData? _currentPosition;
  double? latitude, longitude;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    // Get current Gregorian date
    DateTime now = DateTime.now();
    String formattedDate = DateFormat.yMMMMd('en_US').format(now);

    // Get current Hijri date
    HijriCalendar.setLocal("en");
    HijriCalendar todayHijri = HijriCalendar.now();
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height + 800,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/PNG/time Background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.15,
              child: Image.asset(
                'assets/PNG/Mosque-01.png',
                width: size.width * 0.7,
              ),
            ),
            Positioned(
              top: size.height * 0.123,
              left: size.width * 0.16,
              child: Image.asset(
                'assets/PNG/Islami.png',
                width: size.width * 0.7,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.236,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(40),
                  //   color: const Color(0xff856B3F),
                  // ),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.344,
                  width: MediaQuery.of(context).size.width * 0.49,
                  child: Stack(
                    children: [
                      Positioned(
                        // width: MediaQuery.of(context).size.width ,w
                        // height: MediaQuery.of(context).size.height * 0.32,
                        child: Image.asset(
                          "assets/PNG/Group 28.png",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                        ),
                      ),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.02,
                          left: MediaQuery.of(context).size.width * 0.04,
                          child: Container(
                            height: 50,
                            width: 75,
                            // color: Colors.red,
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: Colors.white,
                                  fontFamily: "janna"),
                            ),
                          )),
                      Positioned(
                          top: MediaQuery.of(context).size.height * 0.02,
                          right: MediaQuery.of(context).size.width * 0.02,
                          child: Container(
                            height: 50,
                            width: 75,
                            // color: Colors.red,
                            child: Text(
                              todayHijri.toFormat("MM dd, yyyy"),
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.018,
                                  color: Colors.white,
                                  fontFamily: "janna"),
                            ),
                          )),
                      Positioned(
                        // top: 0,
                        child: FutureBuilder(
                          future: getLoc(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            }

                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              final locationData =
                                  snapshot.data as Map<String, double>;
                              final myCoordinates = Coordinates(
                                  locationData['latitude']!,
                                  locationData['longitude']!);
                              final params =
                                  CalculationMethod.egyptian.getParameters();
                              params.madhab = Madhab.hanafi;
                              final prayerTimes =
                                  PrayerTimes.today(myCoordinates, params);

                              final List<Map<String, dynamic>> prayerTimesList =
                                  [
                                {'name': 'Fajr', 'time': prayerTimes.fajr},
                                {
                                  'name': 'Sunrise',
                                  'time': prayerTimes.sunrise
                                },
                                {'name': 'Dhuhr', 'time': prayerTimes.dhuhr},
                                {'name': 'Asr', 'time': prayerTimes.asr},
                                {
                                  'name': 'Maghrib',
                                  'time': prayerTimes.maghrib
                                },
                                {'name': 'Isha', 'time': prayerTimes.isha},
                              ];

                              return InfiniteCarousel.builder(
                                itemCount: prayerTimesList.length,
                                itemExtent: 120,
                                center: true,
                                anchor: 0.0,
                                velocityFactor: 0.2,
                                onIndexChanged: (index) {},
                                axisDirection: Axis.horizontal,
                                loop: true,
                                itemBuilder: (context, itemIndex, realIndex) {
                                  final prayer = prayerTimesList[itemIndex];
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    margin: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.025,
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.050,
                                        top: MediaQuery.of(context).size.width *
                                            0.28),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                        colors: [
                                          MyTheme.background,
                                          Color(0xffB19768)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            prayer['name'],
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            DateFormat.jm().format(
                                                prayer['time'] as DateTime),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }

                            return Center(
                              child: Text(
                                'Error in retrieving location data',
                                style: TextStyle(color: Colors.red),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.016,
                        right: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          // color: Colors.red,
                          child: Text(
                            "Pray Time",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0x51000000),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.063,
                        right: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          // color: Colors.red,
                          child: Text(
                            dayName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: MyTheme.background,
                            ),
                          ),
                        ),
                      )
                      // Text(DateFormat.DAY)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.62,
              left: size.width * 0.04,
              child: Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AzkarMasaScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyTheme.background,
                            border: Border.all(color: MyTheme.gold),
                          ),
                          alignment: Alignment.center,
                          height: size.height * 0.299,
                          width: size.width * 0.435,
                          child: Stack(
                            children: [
                              Positioned(
                                top: size.height * 0.02,
                                left: 0,
                                right: 0,
                                child:
                                    Image.asset("assets/PNG/Illustration2.png"),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "أذكار المساء",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "janna",
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AlnowmAzkarScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyTheme.background,
                            border: Border.all(color: MyTheme.gold),
                          ),
                          alignment: Alignment.center,
                          height: size.height * 0.299,
                          width: size.width * 0.435,
                          child: Stack(
                            children: [
                              Positioned(
                                top: size.height * 0.02,
                                left: 0,
                                right: 0,
                                child:
                                    Image.asset("assets/PNG/Illustration.png"),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "أذكار النوم",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "janna",
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AfterprayersScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyTheme.background,
                            border: Border.all(color: MyTheme.gold),
                          ),
                          alignment: Alignment.center,
                          height: size.height * 0.299,
                          width: size.width * 0.435,
                          child: Stack(
                            children: [
                              Positioned(
                                top: size.height * 0.02,
                                left: 0,
                                right: 0,
                                child:
                                    Image.asset("assets/PNG/Illustration3.png"),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "أذكار بعد الصلاة",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "janna",
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    QuranSupplicationsScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyTheme.background,
                            border: Border.all(color: MyTheme.gold),
                          ),
                          alignment: Alignment.center,
                          height: size.height * 0.299,
                          width: size.width * 0.435,
                          child: Stack(
                            children: [
                              Positioned(
                                top: size.height * 0.02,
                                left: 0,
                                right: 0,
                                child:
                                    Image.asset("assets/PNG/Illustration3.png"),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "أدعية قرآنية",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "janna",
                                      fontSize: size.width * 0.05,
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
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AzkarSabahScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyTheme.background,
                            border: Border.all(color: MyTheme.gold),
                          ),
                          alignment: Alignment.center,
                          height: size.height * 0.299,
                          width: size.width * 0.435,
                          child: Stack(
                            children: [
                              Positioned(
                                top: size.height * 0.02,
                                left: 0,
                                right: 0,
                                child:
                                    Image.asset("assets/PNG/Illustration4.png"),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "أذكار الصباح",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "janna",
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WakeUpScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyTheme.background,
                            border: Border.all(color: MyTheme.gold),
                          ),
                          alignment: Alignment.center,
                          height: size.height * 0.299,
                          width: size.width * 0.435,
                          child: Stack(
                            children: [
                              Positioned(
                                top: size.height * 0.02,
                                left: 0,
                                right: 0,
                                child:
                                    Image.asset("assets/PNG/Illustration.png"),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "أذكار الاستيقاظ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "janna",
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TasabihScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyTheme.background,
                            border: Border.all(color: MyTheme.gold),
                          ),
                          alignment: Alignment.center,
                          height: size.height * 0.299,
                          width: size.width * 0.435,
                          child: Stack(
                            children: [
                              Positioned(
                                top: size.height * 0.02,
                                left: 0,
                                right: 0,
                                child:
                                    Image.asset("assets/PNG/Illustration.png"),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "تسابيح",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "janna",
                                      fontSize: size.width * 0.05,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ProphetsSuplicationsScreen()),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: MyTheme.background,
                            border: Border.all(color: MyTheme.gold),
                          ),
                          alignment: Alignment.center,
                          height: size.height * 0.299,
                          width: size.width * 0.435,
                          child: Stack(
                            children: [
                              Positioned(
                                top: size.height * 0.02,
                                left: 0,
                                right: 0,
                                child:
                                    Image.asset("assets/PNG/Illustration.png"),
                              ),
                              Positioned(
                                bottom: 10,
                                left: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "أدعية الأنبياء",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "janna",
                                      fontSize: size.width * 0.05,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getLoc() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _currentPosition = await location.getLocation();
    latitude = _currentPosition!.latitude!;
    longitude = _currentPosition!.longitude!;
    return {'latitude': latitude!, 'longitude': longitude!}; // إعادة الإحداثيات
  }
}
