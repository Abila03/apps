import 'package:flutter/material.dart';
import 'package:apps/view/pendaftar/footerSM.dart';
class RiwayatPemberi extends StatelessWidget {
  const RiwayatPemberi({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Riwayat'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Sedang berjalan'),
              Tab(text: 'Selesai '),
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
          ],
        ),
        bottomNavigationBar: Footersm(),
      ),
    );
  }
}
