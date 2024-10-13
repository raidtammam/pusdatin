import 'package:flutter/material.dart';
import 'package:pusdatin_project/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),  // Panggil halaman Login
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
