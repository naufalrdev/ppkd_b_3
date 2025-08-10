import 'package:flutter/material.dart';
import 'package:load_switch/load_switch.dart';

class Switch1 extends StatefulWidget {
  const Switch1({super.key});

  @override
  State<Switch1> createState() => _Switch1State();
}

class _Switch1State extends State<Switch1> {
  bool isSwitch = false;
  Future<bool> _toggleFuture() async {
    await Future.delayed(const Duration(seconds: 2));
    return !isSwitch;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSwitch ? Colors.black : Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enable Dark Mode",
              style: TextStyle(color: isSwitch ? Colors.white : Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadSwitch(
                  value: isSwitch,
                  future: _toggleFuture,
                  style: SpinStyle.material,
                  onChange: (value) {
                    setState(() {
                      isSwitch = value;
                    });
                  },
                  onTap: (value) {
                    print("Switch tapped, current value: $value");
                  },
                ),
                const SizedBox(width: 10),
                Text(
                  isSwitch ? "Dark mode is on" : "Light mode is on",
                  style: TextStyle(
                    color: isSwitch ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
