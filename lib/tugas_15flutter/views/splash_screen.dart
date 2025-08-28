import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_14flutter/views/get_pokemon.dart';
import 'package:ppkd_b_3/tugas_15flutter/shared_preference/shared_preference.dart';
import 'package:ppkd_b_3/tugas_15flutter/views/profile_screen..dart';
import 'package:ppkd_b_3/tugas_15flutter/views/screen.dart';

class SplashScreen12 extends StatefulWidget {
  const SplashScreen12({super.key});
  static const id = "/splash";

  @override
  State<SplashScreen12> createState() => _SplashScreen12State();
}

class _SplashScreen12State extends State<SplashScreen12> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final isLogin = await PreferenceHandler.getLogin();

    Future.delayed(const Duration(seconds: 3)).then((_) {
      print(isLogin);
      if (isLogin == true) {
        context.pushReplacementNamed(ProfileScreen.id);
      } else {
        context.push(ScreenBefore());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/pokebola.png"),
          ),
        ),
      ),
    );
  }
}
