import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas_11flutter/models/user.dart';
import 'package:ppkd_b_3/tugas_11flutter/sqflite/db_helper.dart';

class UserScreen1 extends StatefulWidget {
  const UserScreen1({super.key});
  static const id = "/user";

  @override
  State<UserScreen1> createState() => _UserScreen1State();
}

class _UserScreen1State extends State<UserScreen1> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    getUser();
  }

  // final _formKey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  Future<void> getUser() async {
    final dataUser = await DbHelper.getAllUsers();
    print(dataUser);
    setState(() {
      users = dataUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          // key: _formKey,
          child: Column(
            children: [
              Text(
                "DataBase Account",
                style: TextStyle(fontFamily: "Lobster", fontSize: 30),
              ),
              Divider(),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final dataUserLogin = users[index];
                  return Column(
                    children: [
                      Text(dataUserLogin.name),
                      SizedBox(height: 8),
                      Text(dataUserLogin.email),
                      SizedBox(height: 8),
                      Text(dataUserLogin.school),
                      SizedBox(height: 8),
                      Text(dataUserLogin.city),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
