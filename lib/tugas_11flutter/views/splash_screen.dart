import 'package:flutter/material.dart';
import 'package:ppkd_b_3/app_image.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_11flutter/preference/shared_preference.dart';
import 'package:ppkd_b_3/tugas_6_flutter/tugas_6.dart';
import 'package:ppkd_b_3/tugas_8flutter/bot_nav_bar.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});
  static const id = "/splash_screen";

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    bool? isLogin = await PreferenceHandler.getLogin();

    Future.delayed(Duration(seconds: 3)).then((value) async {
      print(isLogin);
      if (isLogin == true) {
        context.pushReplacementNamed(BotBar1.id);
      } else {
        context.push(Tugas6Flutter());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.disdik),
            SizedBox(height: 20),
            Text("Welcome"),
          ],
        ),
      ),
    );
  }
}
