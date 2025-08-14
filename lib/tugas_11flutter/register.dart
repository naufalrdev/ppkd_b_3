import 'package:flutter/material.dart';

class Register12 extends StatefulWidget {
  const Register12({super.key});

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
    return Scaffold(
      body: Center(child: Text("BLABLABLA")),
      // Stack(children: [buildBackground])
    );
  }

  Container buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
