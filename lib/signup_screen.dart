import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:m/reusable_widget.dart';

import 'auth_controller.dart';
import 'color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _password2TextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("B48725"),
          hexStringToColor("B48725"),
          hexStringToColor("6B5524")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
              logoWidget("assets/logo-removebg-preview (1) 1.png"),


                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter password", Icons.person_outline, false,
                    _password2TextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password Again", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign up", () {
               AuthController.instance.Signup(
                _userNameTextController.text.trim(), _passwordTextController.text.trim(),_password2TextController.text.trim());
          
                }),
              ],
            ),
          ))),
    );
  }
}
