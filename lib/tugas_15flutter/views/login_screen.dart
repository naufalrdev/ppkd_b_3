import 'package:flutter/material.dart';
import 'package:ppkd_b_3/extensions/navigations.dart';
import 'package:ppkd_b_3/tugas_15flutter/api/register_user.dart';
import 'package:ppkd_b_3/tugas_15flutter/models/register_user.dart';
import 'package:ppkd_b_3/tugas_15flutter/shared_preference/shared_preference.dart';
import 'package:ppkd_b_3/tugas_15flutter/views/profile_screen..dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisibility = false;
  bool isLoading = false;
  RegistUserModel? user;
  String? errorMessage;

  void login() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email and Password cannot be empty")),
      );
      isLoading = false;
      return;
    }
    try {
      final results = await AuthenticationAPI.loginUser(
        email: email,
        password: password,
      );
      setState(() {
        user = results;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Succesful Login")));
      PreferenceHandler.saveToken(user?.data.token.toString() ?? "");
      context.pushReplacementNamed(ProfileScreen.id);

      print(user?.toJson());
    } catch (e) {
      print(e);
      setState(() {
        errorMessage = e.toString();
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage.toString())));
    } finally {
      setState(() {});
      isLoading = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [buildBackground(), buildLayer()]));
  }

  TextField buildTextField({
    String? labelText,
    String? hintText,
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? !isVisibility : false,
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
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isVisibility = !isVisibility;
                  });
                },
                icon: Icon(
                  isVisibility ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
    );
  }

  SizedBox height(double height) => SizedBox(height: height);
  SizedBox width(double width) => SizedBox(width: width);

  SafeArea buildLayer() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png"),
              height(40),
              buildTextField(
                controller: emailController,
                labelText: "Email",
                hintText: "Please input your email",
              ),
              height(10),
              buildTextField(
                controller: passwordController,
                labelText: "Password",
                hintText: "Please input your password",
                isPassword: true,
              ),
              height(20),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              height(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
