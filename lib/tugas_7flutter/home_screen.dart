import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ppkd_b_3/colors.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_7flutter/checkbox.dart';
import 'package:ppkd_b_3/tugas_7flutter/datepicker.dart';
import 'package:ppkd_b_3/tugas_7flutter/dropdown.dart';
import 'package:ppkd_b_3/tugas_7flutter/profil.dart';
import 'package:ppkd_b_3/tugas_7flutter/switch.dart';
import 'package:ppkd_b_3/tugas_7flutter/timepicker.dart';
import 'package:ppkd_b_3/tugas_9flutter/list.dart';
import 'package:ppkd_b_3/tugas_9flutter/list_map.dart';
import 'package:ppkd_b_3/tugas_9flutter/model.dart';

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
    List1(),
    ListMap1(),
    Model2(),
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
      appBar: AppBar(
        backgroundColor: AppColor.teal,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: AppColor.teal),
              child: ListTile(
                leading: Icon(FontAwesomeIcons.userAstronaut),
                title: Text("Profil"),
                onTap: () {
                  onItemTap(0);
                },
              ),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.fileContract),
              title: Text("Terms and Conditions"),
              onTap: () {
                onItemTap(1);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.circleHalfStroke),
              title: Text("Dark Mode"),
              onTap: () {
                onItemTap(2);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.boxes),
              title: Text("Catalogue"),
              onTap: () {
                onItemTap(3);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.calendarDays),
              title: Text("Date of Birth"),
              onTap: () {
                onItemTap(4);
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.stopwatch),
              title: Text("Set Reminders"),
              onTap: () {
                onItemTap(5);
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.listOl),
              title: Text("List of Furniture"),
              onTap: () {
                onItemTap(6);
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.list),
              title: Text("List Map of Furniture"),
              onTap: () {
                onItemTap(7);
              },
            ),

            ListTile(
              leading: Icon(FontAwesomeIcons.rectangleList),
              title: Text("Model of Furniture"),
              onTap: () {
                onItemTap(8);
              },
            ),
            SizedBox(height: 50),

            ListTile(
              leading: Icon(FontAwesomeIcons.rightFromBracket),
              title: Text("Logout"),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
