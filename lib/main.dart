import 'package:flutter/material.dart';
import 'login_page.dart';
import 'homepage.dart';
import 'landing_page.dart';

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  

  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set the initial route to the login page
      initialRoute: '/landing',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/landing': (context) => LandingPage(),
      },
    );
  }
}
