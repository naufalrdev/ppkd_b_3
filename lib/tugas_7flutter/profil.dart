import 'package:flutter/material.dart';

class Profil1 extends StatelessWidget {
  const Profil1({super.key, this.appBar});
  final bool? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar == false
          ? null
          : AppBar(title: Text('My Profile'), backgroundColor: Colors.teal),
      drawer: appBar == false ? null : Drawer(),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_circle, size: 100, color: Colors.grey),
              SizedBox(height: 30),
              Text(
                'Naufal Rifky Dwi Putra',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: Colors.red),
                  SizedBox(width: 4),
                  Text('Jakarta, Indonesia'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '"Im a junior mobile developer."',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
