import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas_9flutter/model/map_model.dart';

class Model2 extends StatefulWidget {
  const Model2({super.key});

  @override
  State<Model2> createState() => _Model2State();
}

class _Model2State extends State<Model2> {
  final List<ProductModel> productModel = [
    ProductModel(
      name: "Sofa",
      price: "Rp2.995.000",
      icon: Icons.chair_outlined,
    ),
    ProductModel(name: "Chair", price: "Rp3.000.000", icon: Icons.chair),
    ProductModel(name: "Carpet", price: "Rp500.000", icon: Icons.layers),
    ProductModel(name: "Tray", price: "Rp350.000", icon: Icons.set_meal),
    ProductModel(
      name: "Stove",
      price: "Rp200.000",
      icon: Icons.local_fire_department,
    ),
    ProductModel(name: "Pot", price: "Rp50.000", icon: Icons.soup_kitchen),
    ProductModel(name: "Knife", price: "Rp300.000", icon: Icons.restaurant),
    ProductModel(
      name: "Blender",
      price: "Rp679.000",
      icon: Icons.emoji_food_beverage,
    ),
    ProductModel(
      name: "Refrigerator",
      price: "Rp2.800.000",
      icon: Icons.kitchen,
    ),
    ProductModel(name: "Bed", price: "Rp1.800.00", icon: Icons.bed),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Furniture Model",
              style: TextStyle(
                fontFamily: "Lobster",
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: productModel.length,
                itemBuilder: (BuildContext context, int index) {
                  final modelProductData = productModel[index];
                  return Card(
                    child: ListTile(
                      title: Text(modelProductData.name),
                      subtitle: Text(modelProductData.price),
                      leading: Icon(modelProductData.icon),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
