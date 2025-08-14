import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppkd_b_3/app_color.dart';

class Tugas3Flutter extends StatelessWidget {
  const Tugas3Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(60),
              child: Text(
                "Welcome",
                style: TextStyle(fontFamily: "Lobster", fontSize: 40),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColor.teal,
                    ),
                    child: Center(child: Text("Sign Up")),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Center(child: Text("Sign in")),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name"),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please enter your full name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text("Email"),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please enter your email address",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text("Phone Number"),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please enter your phone number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Text("Describe"),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please briefly describe yourself",
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(20),
                  child: Icon(FontAwesomeIcons.scroll),
                ),
              ),
            ],
          ),

          GridView.count(
            shrinkWrap: true,
            padding: EdgeInsets.all(8.0),
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(color: AppColor.pinkPastel),
                  ),
                  Text("Warna 1"),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(color: AppColor.kuningPastel),
                  ),
                  Text("Warna 2"),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(color: AppColor.biruMuda),
                  ),
                  Text("Warna 3"),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(color: AppColor.hijauPastel),
                  ),
                  Text("Warna 4"),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(color: AppColor.peach1),
                  ),
                  Text("Warna 5"),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(color: AppColor.merahMudaLembut),
                  ),
                  Text("Warna 6 "),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
