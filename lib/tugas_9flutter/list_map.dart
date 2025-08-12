import 'package:flutter/material.dart';

class ListMap1 extends StatefulWidget {
  const ListMap1({super.key});

  @override
  State<ListMap1> createState() => _ListMap1State();
}

class _ListMap1State extends State<ListMap1> {
  final List<Map<String, dynamic>> furniture = [
    {"name": "Sofa", "price": "Rp2.995.000", "icon": Icons.chair_outlined},
    {"name": "Chair", "price": "Rp3.000.000", "icon": Icons.chair},
    {"name": "Carpet", "price": "Rp500.000", "icon": Icons.layers},
    {"name": "Tray", "price": "Rp350.000", "icon": Icons.set_meal},
    {
      "name": "Stove",
      "price": "Rp200.000",
      "icon": Icons.local_fire_department,
    },
    {"name": "Pot", "price": "Rp50.000", "icon": Icons.soup_kitchen},
    {"name": "Knife", "price": "Rp300.000", "icon": Icons.restaurant},
    {
      "name": "Blender",
      "price": "Rp679.000",
      "icon": Icons.emoji_food_beverage,
    },
    {"name": "Refrigerator", "price": "Rp2.800.000", "icon": Icons.kitchen},
    {"name": "Bed", "price": "Rp1.800.000", "icon": Icons.bed},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Furniture Products",
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
              itemCount: furniture.length,
              itemBuilder: (BuildContext context, int index) {
                final dataFurniture = furniture[index];
                return ListTile(
                  leading: Icon(dataFurniture["icon"]),
                  title: Text(dataFurniture["name"]),
                  subtitle: Text(dataFurniture["price"].toString()),
                  trailing: Icon(Icons.add_shopping_cart),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
