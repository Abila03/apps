import 'package:flutter/material.dart';
import 'package:apps/view/pendaftar/footerSM.dart';
class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Diikuti'),
              Tab(text: 'Selesai diikuti'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Card(
                  child: ListTile(
                    leading: Image.asset(
                      'images/poster 6.jpg', 
                      width: 50,
                    ),
                    title: const Text('Djarum Beasiswa Plus'),
                    subtitle: const Text('Berakhir Tanggal'),
                    trailing: const Text(
                      '30 Mei 2024',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const Center(
              child: Text('Belum ada beasiswa yang selesai diikuti'),
            ),
          ],
        ),
        bottomNavigationBar: Footersm(),
      ),
    );
  }
}
