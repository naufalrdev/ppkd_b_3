import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_11flutter/preference/shared_preference.dart';
import 'package:ppkd_b_3/tugas_6_flutter/tugas_6.dart';

class LogOut1 extends StatelessWidget {
  const LogOut1({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        PreferenceHandler.removeLogin();
        context.pushReplacement(Tugas6Flutter());
      },
      child: Text("Log Out"),
    );
  }
}
