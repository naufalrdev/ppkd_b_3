import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DropDown1 extends StatefulWidget {
  const DropDown1({super.key});

  @override
  State<DropDown1> createState() => _DropDown1State();
}

class _DropDown1State extends State<DropDown1> {
  String? dropdownSelect;
  final List<String> items = ["Electronics", "Clothing", "Food", "Others"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment:
          // MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Product catalogue", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            DropdownButton2<String>(
              value: dropdownSelect,
              hint: const Text("Select product"),
              items: items
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  dropdownSelect = value;
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                width: 200,
              ),
              dropdownStyleData: const DropdownStyleData(maxHeight: 200),
              menuItemStyleData: const MenuItemStyleData(height: 40),
            ),
            SizedBox(height: 15),
            if (dropdownSelect != null)
              Text(
                "You choose a category: $dropdownSelect",
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
