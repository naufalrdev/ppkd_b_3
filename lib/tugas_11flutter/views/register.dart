import 'package:flutter/material.dart';
import 'package:ppkd_b_3/app_color.dart';
import 'package:ppkd_b_3/app_image.dart';
import 'package:ppkd_b_3/tugas_11flutter/models/user.dart';
import 'package:ppkd_b_3/tugas_11flutter/sqflite/db_helper.dart';

class Register12 extends StatefulWidget {
  const Register12({super.key});
  static const id = "/register12";

  @override
  State<Register12> createState() => _Register12State();
}

class _Register12State extends State<Register12> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  bool isVisibility = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  void registerUser() async {
    isLoading = true;
    setState(() {});
    final name = nameController.text;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final school = schoolController.text;
    final city = cityController.text;
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        school.isEmpty ||
        city.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Name, Email, Password, School, and City cannot be empty",
          ),
        ),
      );
      isLoading = false;

      return;
    }
    final user = User(
      email: email,
      password: password,
      name: name,
      school: school,
      city: city,
    );
    await DbHelper.registerUser(user);
    Future.delayed(const Duration(seconds: 1)).then((value) {
      isLoading = false;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Registration Successful")));
    });
    setState(() {});
    isLoading = false;
  }

  SafeArea buildLayer() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                    fontFamily: "Lobster",
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                height(24),
                buildTitle("Name"),
                height(12),
                buildTextField(
                  hintText: "Please input your name",
                  controller: nameController,
                ),
                height(16),
                buildTitle("Email Address"),
                height(12),
                buildTextField(
                  hintText: "Please input your email",
                  controller: emailController,
                ),
                height(16),
                buildTitle("Password"),
                height(12),
                buildTextField(
                  hintText: "Please input your password",
                  isPassword: true,
                  controller: passwordController,
                ),
                height(16),
                buildTitle("School Name"),
                height(12),
                buildTextField(
                  hintText: "Please input your previous school",
                  controller: schoolController,
                ),
                height(16),
                buildTitle("City of Residence"),
                height(12),
                buildTextField(
                  hintText: "Please input your city of residence ",
                  controller: cityController,
                ),
                height(24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      isLoading ? null : registerUser();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Daftar",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.background),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  TextField buildTextField({
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? isVisibility : false,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(0.2),
            width: 1.0,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility_off : Icons.visibility,
                  // color: AppColor.gray88,
                ),
              )
            : null,
      ),
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  Widget buildTitle(String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
