import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppkd_b_3/app_color.dart';

class Tugas2Flutter extends StatelessWidget {
  const Tugas2Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil Lengkap',
          style: GoogleFonts.dancingScript(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.favorite_outline, size: 25),
          SizedBox(width: 20),
          Icon(Icons.send, size: 25),
          SizedBox(width: 10),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: Icon(Icons.account_circle, size: 100, color: Colors.grey),
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsetsGeometry.all(1),
              child: Text(
                "Naufal Rifky Dwi Putra",
                style: GoogleFonts.lato(fontSize: 20),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 4),
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColor.butterYellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.email_outlined),
                  SizedBox(width: 10),
                  Text(
                    "naufalrifkidwiputra3081@gmail.com",
                    style: GoogleFonts.lato(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 4),
            child: Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: AppColor.butterYellow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Spacer(),
                  Text(
                    "+62 858-8049-8378",
                    style: GoogleFonts.lato(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: AppColor.pastelBlue,
                    child: Center(
                      child: Text(
                        "Postingan",
                        style: GoogleFonts.lato(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    color: AppColor.lavender,
                    child: Center(
                      child: Text(
                        "Followers",
                        style: GoogleFonts.lato(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2),
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColor.mintGreen,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Masih pemula di Flutter, tapi cita-cita udah kayak bikin app sekelas Gojek",
                        style: GoogleFonts.lato(fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 56,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(FontAwesomeIcons.house),

                Icon(FontAwesomeIcons.magnifyingGlass),

                Icon(FontAwesomeIcons.squarePlus),

                Icon(FontAwesomeIcons.briefcase),

                Icon(FontAwesomeIcons.user),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
