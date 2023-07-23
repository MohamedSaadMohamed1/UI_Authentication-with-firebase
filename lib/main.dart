// ignore_for_file: avoid_unnecessary_containers
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m/signin_screen.dart';
import 'auth_controller.dart';



Future<void> main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp().then((value) => Get.put(AuthController()));
 // Get.put(AuthController());
  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), // smartManagement: SmartManagement.full,
      home: SignInScreen(),
       initialBinding: BindingsBuilder(() {
        // Register your controllers here
       // Get.put(UserController());
        
       
      }),
    );
  }
}