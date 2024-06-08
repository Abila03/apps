import 'package:flutter/material.dart';
import 'package:apps/view/pendaftar/notifikasi.dart';
import 'package:apps/view/list_beasiswa.dart';
import 'package:apps/view/pendaftar/profile.dart';

class Footersm extends StatelessWidget{
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
          currentIndex: 2, // Profil adalah item ketiga
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListBeasiswa()),
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
          },
        );
  }
}