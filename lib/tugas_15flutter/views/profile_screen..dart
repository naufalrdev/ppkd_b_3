import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_15flutter/api/register_user.dart';
import 'package:ppkd_b_3/tugas_15flutter/models/get_user_model.dart';
import 'package:ppkd_b_3/tugas_15flutter/shared_preference/shared_preference.dart';
import 'package:ppkd_b_3/tugas_15flutter/views/screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const id = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GetData? currentUser;
  Future<GetUserModel>? _userFuture;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  void _loadUser() {
    _userFuture = AuthenticationAPI.getProfile();
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  TextField buildTextField({
    String? hintText,
    String? labelText,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade700),
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey.shade700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
      ),
    );
  }

  void showEditDialog(BuildContext context, String currentName) {
    final nameController = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField(controller: nameController, labelText: "Name"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final newName = nameController.text.trim();

                if (newName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Name cannot be empty")),
                  );
                  return;
                }
                try {
                  final updateUser = await AuthenticationAPI.updateUser(
                    name: newName,
                  );
                  context.pop();
                  _loadUser();
                  setState(() {});

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Profile Update succesfully")),
                  );
                } catch (e) {
                  context.pop();
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Update failed: $e")));
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.yellow, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Text(
            "My Profile",
            style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                if (currentUser != null) {
                  showEditDialog(context, currentUser!.name);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("User data isn't available")),
                  );
                }
              },
              icon: Icon(Icons.edit, color: Colors.black),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),

      body: FutureBuilder(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No user data found"));
          } else {
            final GetUserModel profile = snapshot.data!;
            final user = profile.data;
            currentUser = user;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 4,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 16),
                            Text("ID: ${user.id}"),
                            Text("Name: ${(user.name ?? "")}"),
                            Text("Email: ${user.email ?? ""}"),
                            Text(
                              "Created At: ${user.createdAt.toIso8601String() ?? ""}",
                            ),
                            Text(
                              "Update At: ${user.updatedAt.toIso8601String() ?? ""}",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {
                          PreferenceHandler.removeLogin();
                          context.pushReplacement(ScreenBefore());
                        },
                        child: Text(
                          "LOG OUT",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
