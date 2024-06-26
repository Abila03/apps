import 'package:apps/controller/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
import 'view/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  

  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeasiswaKu',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: '/profile',
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
        '/home': (context) => Home(), 
      },
    );
  }
}
