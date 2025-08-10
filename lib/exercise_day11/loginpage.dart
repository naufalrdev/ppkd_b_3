import 'package:flutter/material.dart';
import 'package:ppkd_b_3/exercise_day11/homepage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;

  // void handleLogin(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Login succesfull"),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Lottie.asset(
  //               "assets/images/animations/Succes.json",
  //               height: 100,
  //               width: 100,
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             child: Text("OK"),
  //             onPressed: () {
  //               Navigator.of(context).pop(   );
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
            SizedBox(width: 14),
            Text(
              "Login",
              style: TextStyle(
                fontFamily: "Gilroy",
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 29,
                horizontal: 24,
              ),
              child: Row(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    "Sign In to your account",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.directional(start: 24, top: 40),
              child: Row(
                children: [
                  Text(
                    "Email Address",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.directional(
                start: 24,
                top: 20,
                end: 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        hint: Text(
                          "Please enter your email address ",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF222222),
                          ),
                        ),
                        // prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!value.contains("@")) {
                          return "Email is not valid";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.directional(start: 24, top: 30),
              child: Row(
                children: [
                  Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF888888),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.directional(
                start: 24,
                top: 20,
                end: 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 12,
                  children: [
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),

                        hint: Text(
                          "Please enter your password ",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF222222),
                          ),
                        ),
                        // prefixIcon: Icon(Icons.password),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password cannot be empty";
                        }
                        if (value.length < 6) {
                          return 'Password must have at least 6 characters';
                        }

                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.directional(end: 24, top: 1),
                  child: TextButton(
                    onPressed: () {
                      setState(() {});
                    },

                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontFamily: "Gilroy",
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFEA9459),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(32),
                    ),
                    backgroundColor: Color(0xFF283FB1),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // final email = emailController.text;
                      // final password = passwordController.text;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Form Validasi BerhasiL")),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF888888),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFEA9459),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Or Sign In With",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF888888),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 155,
                  height: 48,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Color(0xFFFAFAFA),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/iconGoogle.png",
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 15),
                        Text("Google", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 17),

                SizedBox(
                  width: 155,
                  height: 48,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Color(0xFFFAFAFA),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/Vector.png",
                          width: 16,
                          height: 16,
                        ),
                        SizedBox(width: 15),
                        Text("Facebook", style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF888888),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Join Us",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFEA9459),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
