import 'package:flutter/material.dart';
import 'view/login_page.dart';
import 'view/list_beasiswa.dart';
import 'view/landing_page.dart';
import 'view/details_beasiswa.dart';
import 'view/registrasi.dart';
import 'view/pendaftar/notifikasi.dart';
import 'view/pendaftar/profile.dart';
import 'view/pendaftar/riwayat.dart';
import 'view/regulator/profile.dart';
import 'view/pemberi/profile.dart';

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
      initialRoute: '/profiled',
      routes: {
        '/login': (context) => LoginPage(),
        '/list': (context) => ListBeasiswa(),
        '/detail': (context)=> DBeasiswa(),
        '/registrasi': (context)=> Registrasi(),
        '/profile':(context)=> ProfilePage(),
        '/profiled':(context)=> ProfilePemberi(),
        '/profiler':(context)=> ProfileRegulator(),
        '/notif':(context)=> NotifikasiPage(),
        '/riwayat':(context)=> RiwayatPage(),
        '/landing': (context) => LandingPage(),     
      },
    );
  }
}
