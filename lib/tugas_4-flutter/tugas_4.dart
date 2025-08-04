import 'package:flutter/material.dart';

class Tugas4Flutter extends StatelessWidget {
  const Tugas4Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.person), // Icon di depan
            title: Text('Nama'), // Judul utama
            subtitle: Text('Subjudul'), // Teks tambahan di bawah judul
            trailing: Icon(Icons.arrow_forward), // Icon di sebelah kanan
          ),
        ],
      ),
    );
  }
}
