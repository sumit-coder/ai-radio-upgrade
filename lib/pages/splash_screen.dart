import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/app_consts.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  sendToNexScreenAfterSomeTime(Duration afterTime) {
    Future.delayed(afterTime, () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // sendToNexScreenAfterSomeTime(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyConst.appDisplayName.text.xl4.bold.white.make().shimmer(primaryColor: Vx.purple300, secondaryColor: Colors.white),
          ],
        ),
      ),
    );
  }
}
