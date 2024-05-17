import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

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
    imageUrl: 'images/poster 6.jpg',
    link: 'https://kampusmerdeka.kemdikbud.go.id/', 
  );

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Beasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            ScholarshipCard(scholarship: scholarships),
          ],
        ),
      ),
    );
  }
}
class ScholarshipCard extends StatelessWidget {
  final Scholarship scholarship;

  const ScholarshipCard({Key? key, required this.scholarship}) : super(key: key);

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
                Text('- Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                Text('- Nulla facilisi. Nam bibendum ligula sit amet odio laoreet, et hendrerit lectus dictum.'),
                Text('- Donec ullamcorper nulla non metus auctor, at tincidunt neque semper.'),
              ],
            ),
            Divider(color: Colors.grey[300]),
            SizedBox(height: 10.0),
            Text(
              textAlign: TextAlign.left,
              'Persyaratan:',
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
                Text('- Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                Text('- Nulla facilisi. Nam bibendum ligula sit amet odio laoreet, et hendrerit lectus dictum.'),
                Text('- Donec ullamcorper nulla non metus auctor, at tincidunt neque semper.'),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    if (await canLaunchUrl(Uri.parse(scholarship.link))) {
                      await launchUrl(Uri.parse(scholarship.link));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Link pendaftaran tidak valid')),
                      );
                    }
                  },
                  child: Text('Daftar Sekarang'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}