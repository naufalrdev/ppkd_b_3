import 'package:flutter/material.dart';
import 'package:ppkd_b_3/colors.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_10flutter/suc_regis.dart';
import 'package:ppkd_b_3/tugas_10flutter/textform.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});
  static const id = "/register";

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  void handleRegister(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nameController.text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                emailController.text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                phoneController.text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                cityController.text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          content: Text("Are You Sure It's Correct?"),
          actions: [
            TextButton(
              child: Text("No"),
              onPressed: () {
                context.pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                context.push(
                  SucRegist1(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    city: cityController.text,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontFamily: "Lobster",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(fontFamily: "Delius", fontSize: 20),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextFormConst(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                },
                hintText: "Please input your name",
                controller: nameController,
                onChanged: (p0) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontFamily: "Delius", fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextFormConst(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  if (!value.contains("@")) {
                    return "Email is not valid";
                  }
                  return null;
                },
                hintText: "Please input your email",
                controller: emailController,
                onChanged: (p0) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(
                    "Phone Number",
                    style: TextStyle(fontFamily: "Delius", fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextFormConst(
                hintText: "Please input your phone number",
                controller: phoneController,
                onChanged: (p0) {
                  setState(() {});
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Text(
                    "City of Residence",
                    style: TextStyle(fontFamily: "Delius", fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: TextFormConst(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "City of Residence cannot be empty";
                  }
                  return null;
                },
                hintText: "Please enter your city of residence",
                controller: cityController,
                onChanged: (p0) {
                  setState(() {});
                },
              ),
            ),

            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(32),
                  ),
                  backgroundColor: AppColor.teal,
                ),

                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    handleRegister(context);
                  }
                },
                child: Text(
                  "Daftar",
                  style: TextStyle(fontFamily: "Delius", fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
