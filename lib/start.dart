import 'package:flutter/material.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profil Lengkap",
          style: TextStyle(
            fontSize: 25,
            fontFamily: "DM_Serif_Text",
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: (Color(0xFFF3E2D4)),
        actions: [Icon(Icons.account_circle, size: 40, color: Colors.grey)],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(18),
              child: Text(
                "Naufal Rifky Dwi Putra",
                style: TextStyle(fontSize: 20, fontFamily: "Delius"),
              ),
            ),
          ),
          Container(
            width: 400,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              border: Border.all(
                color: const Color.fromARGB(221, 255, 168, 7),
                width: 10,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.email, size: 20, color: Colors.black),
                SizedBox(width: 20),
                Spacer(),
                Text("naufalrifkidwiputra3081@gmail.com"),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              children: [
                Icon(Icons.phone, size: 20, color: Colors.black),
                SizedBox(width: 10),
                Spacer(),
                Text("085880498378"),
              ],
            ),
          ),

          Padding(padding: EdgeInsetsGeometry.symmetric(horizontal: 20)),
        ],
      ),
    );
  }
}
