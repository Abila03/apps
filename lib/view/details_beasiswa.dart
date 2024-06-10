
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pendaftar/notifikasi.dart';
import 'pendaftar/profile.dart';
import 'list_beasiswa.dart';
import '../controller/usermanage.dart';
import 'login_page.dart';

class Scholarship {
  final String name;
  final String imageUrl; 
  final String link;

  const Scholarship({
    required this.name, 
    required this.imageUrl, 
    required this.link,
    });
}

class DBeasiswa extends StatefulWidget {
  @override
  _DBeasiswaState createState() => _DBeasiswaState();
}

class _DBeasiswaState extends State<DBeasiswa> {
  final Scholarship scholarships = Scholarship(
    name: 'Djarum Beasiswa Plus',
    imageUrl: 'images/poster3.jpg',
    link: 'https://kampusmerdeka.kemdikbud.go.id/', 
  );

  final TextEditingController _searchController = TextEditingController();
  bool _isLoggedIn = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  Future<bool> _checkLogin() async {
    // Implement your logic to check if user is logged in using UserManagement class or similar
    return await UserManagement.isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            ScholarshipCard(scholarship: scholarships),
            //Spacer(),
            SizedBox(height: 50.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: ()  {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    
                  },
                  child: Text(
                    'Daftar Sekarang',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 238, 238, 238),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 5, 122, 218),
                    minimumSize: Size(120, 48),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
class ScholarshipCard extends StatelessWidget {
  final Scholarship scholarship;

  ScholarshipCard({Key? key, required this.scholarship}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  scholarship.imageUrl,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80.0,
                    height: 80.0,
                    color: Colors.white,
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              scholarship.name, 
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Timeline Acara:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('- Pendaftaran Online 27 Maret - 30 Mei 2024'),
                Text('- Seleksis Administrasi 31 Mei - 9 Juni 2024'),
                Text('- Tes Tulis Online 10 Juni - 23 Juni 2024'),
                Text('- Tes Tulis Offline dan Wawancara 24 Juni - 31 Agustus 2024'),
                Text('- Pengumuman 1 September 2024'),
              ],
            ),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 10.0),
            Text(
              textAlign: TextAlign.left,
              'Syarat Pendaftaran:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('- Mahasiswa S1/D4 semester IV'),
                Text('- IPK minimum 3.00 pada semester III'),
                Text('- Aktif berorganisasi di dalam atau luar kampus'),
                Text('- Tidak sedang menerima beasiswa dari pihak lain'),
                Text('- Kuliah di mitra Perguruan Tinggi Program Djarum Beasiswa Plus'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}