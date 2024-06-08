import 'package:apps/view/cp.dart';
import 'package:apps/view/landing_page.dart';
import 'package:flutter/material.dart';
import 'riwayat.dart';
import 'package:apps/view/pendaftar/footerSM.dart';
import 'package:apps/view/tombol_kanan.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              title: Text('Aulia Putri Romadon'),
              subtitle: Text('Mahasiswa Universitas Jember'),
            ),
          ),
          const SizedBox(height: 16.0),
          ProfileMenuItem(
            title: 'Manajemen Pendidikan',
            onTap: () {
              // Aksi ketika item diklik
            },
          ),
          ProfileMenuItem(
            title: 'Riwayat Beasiswa',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RiwayatPage()),
              );
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
      bottomNavigationBar: Footersm(),
    );
  }
}


