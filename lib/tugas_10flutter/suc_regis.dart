import 'package:flutter/material.dart';

class SucRegist1 extends StatelessWidget {
  const SucRegist1({
    super.key,
    required this.name,
    required this.email,
    this.phone,
    required this.city,
  });
  final String name;
  final String email;
  final String? phone;
  final String city;
  static const id = "/sucregist";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Thank you, $name from $city for registering",
              style: TextStyle(
                fontFamily: "Delius",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
