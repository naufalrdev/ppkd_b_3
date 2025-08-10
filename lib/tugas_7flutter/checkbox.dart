import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class Checkbox1 extends StatefulWidget {
  const Checkbox1({super.key});

  @override
  State<Checkbox1> createState() => _Checkbox1State();
}

class _Checkbox1State extends State<Checkbox1> {
  bool isChecked = false;
  MSHCheckboxStyle style = MSHCheckboxStyle.stroke;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("I agree to all applicable terms and conditions"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MSHCheckbox(
                  size: 40,
                  value: isChecked,
                  colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: Colors.blue,
                  ),
                  style: style,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                SizedBox(width: 15),
                Text(
                  isChecked == true
                      ? "Continue registration"
                      : "You cannot continue",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
