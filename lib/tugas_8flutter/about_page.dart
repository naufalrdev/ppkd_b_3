import 'package:flutter/material.dart';

class AboutPage1 extends StatelessWidget {
  const AboutPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 50,
              vertical: 100,
            ),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/person.jpg"),
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Text(
                        "FotoKu",
                        style: TextStyle(
                          fontFamily: "Lobster",
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "FotoKu adalah platform berbagi foto yang memudahkan kamu terhubung dengan teman dan membagikan momen spesial dalam hitungan detik",
                            style: TextStyle(
                              fontFamily: "Delius",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "Made by Naufal Rifky Dwi Putra",
                      //       style: TextStyle(
                      //         fontFamily: "Delius",
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //     Spacer(),
                      //     Text("@ 2025 Ecplise One"),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Made by Naufal Rifky Dwi Putra",
                style: TextStyle(
                  fontFamily: "Delius",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              Text("@ 2025 Eclipse One"),
            ],
          ),
        ],
      ),
    );
  }
}
