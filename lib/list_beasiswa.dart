import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Scholarship {
  final String name;
  final String imageUrl; 
  final String details;

  const Scholarship({required this.name, required this.imageUrl, required this.details});
}

class ListBeasiswa extends StatefulWidget {
  @override
  _ListBeasiswaState createState() => _ListBeasiswaState();
}

class _ListBeasiswaState extends State<ListBeasiswa> {
  final List<Scholarship> scholarships = [
    Scholarship(name: 'Djarum Beasiswa Plus', imageUrl: 'images/poster.jpg', details: 'Pendaftaran : 10 Juni - 10 Juli 2024',),
    Scholarship(name: 'Beasiswa Indonesia Bangkit', imageUrl: 'images/poster.jpg', details: 'Pendaftaran : 10 Juni - 10 Juli 2024'),
    Scholarship(name: 'LPDP Beasiswa', imageUrl: 'images/poster.jpg', details: 'Pendaftaran : 10 Juni - 10 Juli 2024'),
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Scholarship> filteredScholarships = scholarships;
    if (_searchText.isNotEmpty) {
      filteredScholarships = scholarships.where((scholarship) =>
          scholarship.name.toLowerCase().contains(_searchText.toLowerCase()))
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Beasiswa',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search scholarships...',
              ),
              onChanged: (text) => setState(() => _searchText = text),
            ),
            SizedBox(height: 20.0),
            Column(
              children: filteredScholarships.map((scholarship) => ScholarshipCard(scholarship: scholarship)).toList(),
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Simulate logout by popping back to login
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: Size(double.infinity, 50.0),
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

  const ScholarshipCard({Key? key, required this.scholarship}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  scholarship.imageUrl,
                  scale: 14,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80.0,
                      height: 80.0,
                      color: Colors.white,
                      child: Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 30.0,
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(width: 10.0), 
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  Text(
                    scholarship.name,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    )
                  ),
                  Text(scholarship.details),
                ],
               ) // Replace with actual value
            ),
          ],
        ),
      ),
    );
  }
}
