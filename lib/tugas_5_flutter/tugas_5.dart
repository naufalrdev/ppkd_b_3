import 'package:flutter/material.dart';
import 'package:ppkd_b_3/colors.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  String nama = "";
  void _tampikanNama() {
    setState(() {
      nama = "Nama saya: Naufal Rifky Dwi Putra";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tugas 5 Flutter")),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _tampikanNama,
              child: Text("Tampilkan Nama"),
            ),
            SizedBox(height: 20),
            Text(nama),
          ],
        ),
      ),
    );
  }
}
