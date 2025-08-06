import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ppkd_b_3/colors.dart';

class Tugas6Flutter extends StatefulWidget {
  const Tugas6Flutter({super.key});

  @override
  State<Tugas6Flutter> createState() => _Tugas6Flutter();
}

class _Tugas6Flutter extends State<Tugas6Flutter> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  String emailController = "Email Address";
  String passwordController = "Password";

  void _handleLogin() {
    if (emailController.isEmpty || passwordController.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill in both email and password."),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Login Info"),
          content: Text(
            "Email: ${emailController}\nPassword: ${passwordController}",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new)),
            SizedBox(width: 28),
            Text(
              "Login",
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w700,
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
              padding: EdgeInsetsGeometry.directional(start: 24, top: 40),
              child: Row(
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Gilroy",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsetsGeometry.directional(start: 24, top: 20),
              child: Row(
                children: [
                  Text(
                    "Sign In to your account",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        hint: Text(
                          "Please enter your email address ",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email cannot be empty";
                        }
                        if (!value.contains("@")) {
                          return "  The email is not valid";
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
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
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
                          ),
                        ),

                        hint: Text(
                          "Please enter your password ",
                          style: TextStyle(
                            fontFamily: "Gilroy",
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        // prefixIcon: Icon(Icons.password),
                      ),
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
                        fontWeight: FontWeight.w400,
                        color: AppColor.orange,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ElevatedButton(
            //   onPressed: () {
            //     //Error dan sukses menggunakan ScaffoldMessenger dan formKey
            //     if (_formKey.currentState!.validate()) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text("Form Validasi Berhasil")),
            //       );
            //     }

            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return AlertDialog(
            //           title: Text("Email anda tidak sesuai"),
            //           content: Column(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Text("Silakan Masukkan email yang valid"),
            //               SizedBox(height: 20),
            //               // Image.asset(
            //               //   'assets/images/rendang.jpeg',
            //               //   width: 90,
            //               //   height: 100,
            //               //   fit: BoxFit.cover,
            //               // ),
            //               // Lottie.asset(
            //               //   'assets/images/animations/Succes.json',
            //               //   width: 40,
            //               //   height: 50,
            //               //   fit: BoxFit.cover,
            //               // ),
            //             ],
            //           ),
            //           actions: [
            //             TextButton(
            //               child: Text("Batal"),
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             ),
            //             TextButton(
            //               child: Text("Ok, Siap"),
            //               onPressed: () {
            //                 Navigator.of(context).pop();
            //               },
            //             ),
            //           ],
            //         );
            //       },
            //     );
            //   },
            //   child: Text("Submit"),
            // ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade700,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: _handleLogin,
                child: const Text('Login', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
