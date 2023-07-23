

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m/signin_screen.dart';

import 'color_utils.dart';
import 'dd.dart';


class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user; //include user info
  User? get currentUser => _user.value;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => SignInScreen());
    } else {
      Get.offAll(() => dd());
    }
  }

  void login(String? email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email!, password: password);
    } catch (e) {
      Get.snackbar("About user", "user message",
          backgroundColor: Colors.blue,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "unvaled",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }
   void Signup(String? email, String password, String password2) async {
  try {
    if (password2 == password) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password,
      );
      // If the user is successfully created, you can show a success message or navigate to a new screen
      Get.snackbar(
        "Signup Success",
        "You have successfully signed up!",
        backgroundColor: 
          hexStringToColor("6B5524"),
        snackPosition: SnackPosition.TOP,
      );
    } else {
      // If the passwords don't match, show an error message
      Get.snackbar(
        "Signup Failed",
        "The passwords don't match",
        backgroundColor: 
          hexStringToColor("6B5524"),
        snackPosition: SnackPosition.TOP,
      );
    }
  } catch (e) {
    // If there's an error creating the user, show an error message
    Get.snackbar(
      "Signup Error",
      e.toString(),
      backgroundColor: 
          hexStringToColor("6B5524"),
      snackPosition: SnackPosition.TOP,
    );
  }
}
}