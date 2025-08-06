import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas_6_flutter/tugas_6.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final Color lightBackground = Colors.white;
  final Color lightText = Colors.black;

  final Color darkBackground = Colors.black;
  final Color darkText = Colors.white;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackground,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.brown.shade50,
          onPrimary: lightText,
          secondary: Colors.brown.shade50,
          onSecondary: lightText,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.brown.shade50,
          onSurface: lightText,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: lightText),
          bodyMedium: TextStyle(color: lightText),
          bodySmall: TextStyle(color: lightText),
          titleLarge: TextStyle(color: lightText),
          titleMedium: TextStyle(color: lightText),
          titleSmall: TextStyle(color: lightText),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: lightBackground,
          foregroundColor: lightText,
          elevation: 0,
        ),
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        scaffoldBackgroundColor: darkBackground,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.brown.shade200,
          onPrimary: darkText,
          secondary: Colors.brown.shade200,
          onSecondary: darkText,
          error: Colors.red.shade300,
          onError: Colors.black,
          surface: Colors.brown.shade200,
          onSurface: darkText,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: darkText),
          bodyMedium: TextStyle(color: darkText),
          bodySmall: TextStyle(color: darkText),
          titleLarge: TextStyle(color: darkText),
          titleMedium: TextStyle(color: darkText),
          titleSmall: TextStyle(color: darkText),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: darkBackground,
          foregroundColor: darkText,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //
      home: Tugas6Flutter(),
    );
  }
}
