import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ppkd_b_3/colors.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listProduct = [
      {"nama": "Kursi Ergonomis", "harga": "Rp 8.500.000", "icon": Icons.chair},
      {"nama": "Sepeda", "harga": "Rp 5.000.000", "icon": Icons.pedal_bike},
      {
        "nama": "Monitor Gaming",
        "harga": "Rp 1.500.000",
        "icon": Icons.monitor,
      },
      {"nama": "Mouse Wireless", "harga": "Rp 500.000", "icon": Icons.mouse},
      {
        "nama": "Keyboard Gaming",
        "harga": "Rp 560.000",
        "icon": Icons.keyboard,
      },
    ];

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(60),
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontFamily: "Lobster", fontSize: 40),
                  ),
                ),
              ),
            ],
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
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              Text("Phone Number"),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please enter your phone number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              Text("Describe"),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  hintText: "Please briefly describe yourself",
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
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
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: listProduct.map((produk) {
              return ListTile(
                leading: Icon(produk['icon']),
                title: Text(produk['nama']),
                subtitle: Text(produk['harga']),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
