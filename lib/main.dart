import 'dart:io';

import 'package:ai_govinds_radio/pages/home_page.dart';
import 'package:ai_govinds_radio/pages/news_tab.dart';
import 'package:ai_govinds_radio/pages/podcast_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  int _selectedIndex = 0;
  _onItemTapped(iteamIndex) {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF2C293A),
        body: _selectedIndex == 0
            ? HomePage()
            : _selectedIndex == 1
                ? NewsTab()
                : PodCastTab(),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedIndex: _selectedIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.radio_rounded),
              label: 'Radio',
            ),
            NavigationDestination(
              icon: Icon(Icons.newspaper_rounded),
              label: 'News',
            ),
            NavigationDestination(
              icon: Icon(Icons.podcasts_rounded),
              label: 'Podcast',
            ),
          ],
        ),
      ),
    );
  }
}

// FM = 102, 92.7, 94