import 'package:apps/cp.dart';
import 'package:apps/view/landing_page.dart';
import 'package:flutter/material.dart';
//import 'riwayat.dart'; 
//import 'notifikasi.dart'; 
import '../list_beasiswa.dart';

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
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            //BottomNavigationBarItem(
              //icon: Icon(Icons.notifications),
              //label: 'Notifikasi',
            //),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: 1, // Profil adalah item ketiga
          onTap: (index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListBeasiswa()),
              );
            } 
            //else if (index == 1) {
              //Navigator.push(
                //context,
                //aterialPageRoute(builder: (context) => const NotifikasiPage()),
              //);
            //} 
            else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePemberi()),
              );
            }
          },
        ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final Color titleColor;
  final VoidCallback onTap;

  const ProfileMenuItem({super.key, required this.title, this.titleColor = Colors.black, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
