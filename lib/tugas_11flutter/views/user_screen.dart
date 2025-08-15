import 'package:flutter/material.dart';
import 'package:ppkd_b_3/tugas_10flutter/textform.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            // key: _formKey,
            child: Column(
              children: [
                Text(
                  "DataBase Account",
                  style: TextStyle(fontFamily: "Lobster", fontSize: 30),
                ),

                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    final dataUserLogin = users[index];
                    return ListTile(
                      title: Text(dataUserLogin.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dataUserLogin.email),
                          Text(dataUserLogin.password),
                          Text(dataUserLogin.school),
                          Text(dataUserLogin.city),
                          Divider(),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Edit Data'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextFormConst(
                                        controller: nameController
                                          ..text = dataUserLogin.name,
                                        hintText: 'Nama',
                                      ),
                                      SizedBox(height: 12),
                                      TextFormConst(
                                        controller: emailController
                                          ..text = dataUserLogin.email,
                                        hintText: 'Email',
                                      ),
                                      SizedBox(height: 12),

                                      TextFormConst(
                                        controller: passwordController
                                          ..text = dataUserLogin.password,
                                        hintText: 'Password',
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        final dataUser = User(
                                          id: dataUserLogin.id!,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          name: nameController.text.trim(),
                                          school: schoolController.text,
                                          city: cityController.text,
                                        );
                                        DbHelper.updateUser(dataUser);
                                        getUser();
                                        Navigator.pop(context);
                                      },
                                      child: Text('Simpan'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Batal'),
                                    ),
                                  ],
                                ),
                              );
                            },

                            icon: Icon(Icons.edit),
                          ),

                          IconButton(
                            onPressed: () {
                              DbHelper.deleteUser(dataUserLogin.id!);
                              getUser();
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
