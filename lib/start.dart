import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Saya",
          style: TextStyle(fontSize: 35, fontFamily: "LibertinusSans"),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [Icon(Icons.favorite), Icon(Icons.message)],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nama: Naufal Rifky Dwi Putra",
            style: TextStyle(fontSize: 20, fontFamily: "LibertinusSans"),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.location_on),
              Text("Jakarta Selatan", style: TextStyle(fontSize: 15)),
            ],
          ),
          SizedBox(height: 10),
          Text("Seorang pelajar yang sedang belajar flutter"),
        ],
      ),
    );
  }
}
