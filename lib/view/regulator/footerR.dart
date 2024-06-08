import 'package:flutter/material.dart';
import 'package:apps/view/pendaftar/notifikasi.dart';
import 'package:apps/view/list_beasiswa.dart';
import 'package:apps/view/pendaftar/profile.dart';

class FooterR extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: 1,
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListBeasiswa()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            }
          },
        );
  }
}