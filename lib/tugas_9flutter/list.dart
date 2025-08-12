import 'package:flutter/material.dart';

class List1 extends StatefulWidget {
  const List1({super.key});

  @override
  State<List1> createState() => _List1State();
}

class _List1State extends State<List1> {
  final List<String> nameFurniture = [
    "Sofa",
    "Chair",
    "Carpet",
    "Tray",
    "Stove",
    "Pot",
    "Knife",
    "Blender",
    "Refrigerator",
    "Bed",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Home Furniture Category",
              style: TextStyle(
                fontFamily: "Lobster",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: nameFurniture.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(nameFurniture[index]),
                  leading: CircleAvatar(child: Text("${index + 1}")),
                  // trailing: Icon(Icons.add_shopping_cart),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
