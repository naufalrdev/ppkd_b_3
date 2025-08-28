import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppkd_b_3/tugas_15flutter/views/profile_screen..dart';
import 'package:ppkd_b_3/tugas_15flutter/views/screen.dart';
import 'package:ppkd_b_3/tugas_15flutter/views/splash_screen.dart';

void main() {
  initializeDateFormatting("id_ID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      ),

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SplashScreen12.id,
      routes: {
        "/login": (context) => ScreenBefore(),
        SplashScreen12.id: (context) => SplashScreen12(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
      // initialRoute: ScreenBefore.id,
      // routes: {
      //   "/login": (context) => Tugas6Flutter(),
      //   SplashScreen1.id: (context) => SplashScreen1(),
      //   // Register12.id: (context) => Register12(),
      //   BotBar1.id: (context) => BotBar1(),
      // },
      // home: ScreenBefore(),
    );
  }
}
