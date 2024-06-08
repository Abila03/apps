import 'package:apps/view/cp.dart';
import 'package:apps/view/tombol_kanan.dart';
import 'package:apps/view/landing_page.dart';
import 'package:apps/view/regulator/footerR.dart';
import 'package:flutter/material.dart';

class ProfileRegulator extends StatelessWidget {
  const ProfileRegulator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          const Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey,
              ),
              title: Text('Kementerian Pendidikan dan Kebudayaan'),
              subtitle: Text('Direktorat Jenderal Pendidikan Tinggi'),
            ),
          ),
          const SizedBox(height: 16.0),
          ProfileMenuItem(
            title: 'Manajemen Institusi',
            onTap: () {
              // Aksi ketika item diklik
            },
          ),
          ProfileMenuItem(
            title: 'Ubah Kata Sandi',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => changepass()),
              );
            },
          ),
          ProfileMenuItem(
            title: 'Bantuan',
            onTap: () {
              // Aksi ketika item diklik
            },
          ),
          ProfileMenuItem(
            title: 'Kebijakan Privasi',
            onTap: () {
              
            },
          ),
          ProfileMenuItem(
            title: 'Keluar',
            titleColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingPage()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: FooterR(),
    );
  }
}
