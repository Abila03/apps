import 'package:flutter/material.dart';
import 'login_page.dart';
import 'list_beasiswa.dart';
import 'landing_page.dart';
import 'details_beasiswa.dart';
import 'registrasi.dart';
import 'notifikasi.dart';
import 'profile.dart';
import 'riwayat.dart';

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
        primarySwatch: Colors.blueGrey,
      ),
      // Set the initial route to the login page
      initialRoute: '/list',
      routes: {
        '/login': (context) => LoginPage(),
        '/list': (context) => ListBeasiswa(),
        '/detail': (context)=> DBeasiswa(),
        '/registrasi': (context)=> Registrasi(),
        '/profile':(context)=> ProfilePage(),
        '/notif':(context)=> NotifikasiPage(),
        '/riwayat':(context)=> RiwayatPage(),
        '/landing': (context) => LandingPage(),     
      },
    );
  }
}
