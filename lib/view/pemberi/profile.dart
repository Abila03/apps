import 'package:apps/view/cp.dart';
import 'package:apps/view/home.dart';
import 'package:apps/view/landing_page.dart';
import 'package:apps/view/pemberi/footerD.dart';
import 'package:flutter/material.dart';
import 'riwayat_pemberi.dart';
import '../list_beasiswa.dart';
import 'package:apps/view/tombol_kanan.dart';

class ProfilePemberi extends StatelessWidget {
  const ProfilePemberi({super.key});

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
              title: Text('PT. Astra International Tbk.'),
              subtitle: Text('Perusahaan Terbuka'),
            ),
          ),
          const SizedBox(height: 16.0),
          ProfileMenuItem(
            title: 'Manajemen Beasiswa',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RiwayatPemberi()),
              );
            },
          ),
          //ProfileMenuItem(
            //title: 'Riwayat Beasiswa',
            //onTap: () {
              //Navigator.push(
                //context,
                //MaterialPageRoute(builder: (context) => const RiwayatPage()),
              //);
            //},
          //),
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
      bottomNavigationBar: FooterD(),
    );
  }
}
