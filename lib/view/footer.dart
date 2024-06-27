import 'package:apps/view/home.dart';
import 'package:flutter/material.dart';
import 'package:apps/view/pendaftar/notifikasi.dart';
import 'package:apps/view/list_beasiswa.dart';
import 'package:apps/view/pendaftar/profile.dart';
import 'package:apps/view/login_page.dart';
import 'package:apps/controller/usermanage.dart';

class Footer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: 0, // Profil adalah item ketiga
          onTap: (index) async {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotifikasiPage()),
                ); 
            } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
            }
          }
        );
  }
}