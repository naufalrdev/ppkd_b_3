import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_7flutter/checkbox.dart';
import 'package:ppkd_b_3/tugas_7flutter/datepicker.dart';
import 'package:ppkd_b_3/tugas_7flutter/dropdown.dart';
import 'package:ppkd_b_3/tugas_7flutter/profil.dart';
import 'package:ppkd_b_3/tugas_7flutter/switch.dart';
import 'package:ppkd_b_3/tugas_7flutter/timepicker.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  int _selectedIndexDrawer = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Profil1(appBar: false),
    Checkbox1(),
    Switch1(),
    DropDown1(),
    DatePicker1(),
    TimePicker1(),
  ];
  void onItemTap(int index) {
    setState(() {
      _selectedIndexDrawer = index;
    });
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndexDrawer]),
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profil"),
              onTap: () {
                onItemTap(0);
              },
            ),

            ListTile(
              leading: Icon(Icons.rule_outlined),
              title: Text("Terms and Conditions"),
              onTap: () {
                onItemTap(1);
              },
            ),

            ListTile(
              leading: Icon(Icons.dark_mode_outlined),
              title: Text("Dark Mode"),
              onTap: () {
                onItemTap(2);
              },
            ),

            ListTile(
              leading: Icon(Icons.category_outlined),
              title: Text("Catalogue"),
              onTap: () {
                onItemTap(3);
              },
            ),

            ListTile(
              leading: Icon(Icons.calendar_today_rounded),
              title: Text("Date of Birth"),
              onTap: () {
                onItemTap(4);
              },
            ),

            ListTile(
              leading: Icon(Icons.lock_clock_outlined),
              title: Text("Set Reminders"),
              onTap: () {
                onItemTap(5);
              },
            ),
          ],
        ),
      ),
    );
  }
}
