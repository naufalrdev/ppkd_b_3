import 'package:flutter/material.dart';

class Tugas3Flutter extends StatelessWidget {
  const Tugas3Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: TextStyle(fontFamily: "Lobster", fontSize: 30),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsetsGeometry.all(12),
                child: Text(
                  "Inigram",
                  style: TextStyle(fontFamily: "Lobster", fontSize: 80),
                ),
              ),
            ),

            Row(children: [Text("Name")]),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Row(children: [Text("Email")]),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Row(children: [Text("No. Hp")]),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            Row(children: [Text("Deskripsi")]),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
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
                      decoration: BoxDecoration(color: Colors.red),
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
                      decoration: BoxDecoration(color: Colors.orange),
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
                      decoration: BoxDecoration(color: Colors.yellow),
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
                      decoration: BoxDecoration(color: Colors.green),
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
                      decoration: BoxDecoration(color: Colors.blue),
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
                      decoration: BoxDecoration(color: Colors.purple),
                    ),
                    Text("Warna 6 "),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
