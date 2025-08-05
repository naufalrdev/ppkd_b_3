import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ppkd_b_3/colors.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<Map<String, dynamic>> listProduct = [
    //   {"nama": "Kursi Ergonomis", "harga": "Rp 8.500.000", "icon": Icons.chair},
    //   {"nama": "Sepeda", "harga": "Rp 5.000.000", "icon": Icons.pedal_bike},
    //   {
    //     "nama": "Monitor Gaming",
    //     "harga": "Rp 1.500.000",
    //     "icon": Icons.monitor,
    //   },
    //   {"nama": "Mouse Wireless", "harga": "Rp 500.000", "icon": Icons.mouse},
    //   {
    //     "nama": "Keyboard Gaming",
    //     "harga": "Rp 560.000",
    //     "icon": Icons.keyboard,
    //   },
    // ];

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16),
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
                      color: Colors.greenAccent,
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
                  padding: EdgeInsetsGeometry.all(40),
                  child: Icon(FontAwesomeIcons.arrowDown, size: 50),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: Text(
                    "Product List",
                    style: TextStyle(fontFamily: "Lobster", fontSize: 40),
                  ),
                ),
              ),
            ],
          ),

          // ListView(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   children: listProduct.map((produk) {
          //     return ListTile(
          //       leading: Icon(produk['icon']),
          //       title: Text(produk['nama']),
          //       subtitle: Text(produk['harga']),
          //     );
          //   }).toList(),
          // ),

          // ListTile(
          //   leading: Icon(Icons.chair),
          //   title: Text("Ergonom Chair"),
          //   subtitle: Text("Rp8.500.000"),
          //   trailing: Icon(Icons.shopping_cart),
          // ),

          // ListTile(
          //   leading: Icon(Icons.pedal_bike),
          //   title: Text("Road Bike"),
          //   subtitle: Text("Rp 5.000.000"),
          //   trailing: Icon(Icons.shopping_cart),
          // ),

          // ListTile(
          //   leading: Icon(Icons.monitor),
          //   title: Text("Monitor Gaming"),
          //   subtitle: Text("Rp 1.500.000"),
          //   trailing: Icon(Icons.shopping_cart),
          // ),

          // ListTile(
          //   leading: Icon(Icons.mouse),
          //   title: Text("Wireless Mouse"),
          //   subtitle: Text("Rp 500.000"),
          //   trailing: Icon(Icons.shopping_cart),
          // ),

          // ListTile(
          //   leading: Icon(Icons.keyboard),
          //   title: Text("Mechanical Keyboard Wireless"),
          //   subtitle: Text("Rp 560.000"),
          //   trailing: Icon(Icons.shopping_cart),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Card(
              child: ListTile(
                leading: Icon(FontAwesomeIcons.chair),
                title: Text('Ergonom Chair'),
                subtitle: Text("Rp8.500.000"),
                trailing: Icon(FontAwesomeIcons.bagShopping),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Card(
              child: ListTile(
                leading: Icon(FontAwesomeIcons.bicycle),
                title: Text("Road Bike"),
                subtitle: Text("Rp5.000.000"),
                trailing: Icon(FontAwesomeIcons.bagShopping),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.monitor),
                title: Text('Monitor'),
                subtitle: Text("Rp1.500.000"),
                trailing: Icon(FontAwesomeIcons.bagShopping),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Card(
              child: ListTile(
                leading: Icon(FontAwesomeIcons.keyboard),
                title: Text("Mechanical Keyboard Wireless"),
                subtitle: Text("Rp700.000"),
                trailing: Icon(FontAwesomeIcons.bagShopping),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.mouse),
                title: Text("Wireless Mouse"),
                subtitle: Text("Rp500.000"),
                trailing: Icon(FontAwesomeIcons.bagShopping),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
