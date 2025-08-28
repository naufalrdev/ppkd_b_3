import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas_15flutter/api/register_user.dart';
import 'package:ppkd_b_3/tugas_15flutter/models/get_user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const id = "profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Profile"), centerTitle: true),
      body: FutureBuilder<GetUserModel>(
        future: AuthenticationAPI.getProfile(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("There is an error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final GetData user = snapshot.data!.data;

            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama: ${user.name}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text("Email: ${user.email}", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 8),
                  Text(
                    "Dibuat: ${user.createdAt}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else {
            return Text("Failed to Load Data");
          }
        },
      ),
    );
  }
}
