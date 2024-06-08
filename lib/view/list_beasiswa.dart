import 'package:apps/view/details_beasiswa.dart';
import 'package:apps/view/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/services/newsAPI.dart';
import '/models/news.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    Scholarship(name: 'Djarum Beasiswa Plus', imageUrl: 'images/poster 6.jpg', details: 'Pendaftaran : 10 Juni - 10 Juli 2024',),
    Scholarship(name: 'Beasiswa Indonesia Bangkit', imageUrl: 'images/poster 2.jpg', details: 'Pendaftaran : 30 Mei - 15 Juli 2024'),
    Scholarship(name: 'LPDP Beasiswa', imageUrl: 'images/poster 5.png', details: 'Pendaftaran : 1 Juni - 30 Juli 2024'),
  ];
  late Future<List<NewsModel>> _futureNews;
  final _newsApiService = NewsApiService();

  @override
  void initState() {
    super.initState();
    _futureNews = _newsApiService.fetchTopHeadlines();
  }

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
            FutureBuilder<List<NewsModel>>(
              future: _futureNews,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final newsList = snapshot.data!;
                  return CarouselSlider.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index, pageViewIndex) {
                      final news = newsList[index];
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                news.imageUrl,
                                height: 190.0, // Adjust height as needed
                                fit: BoxFit.cover,
                              ),
                            ),
                            
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 16 / 9, // Adjust aspect ratio for card shape
                      viewportFraction: 0.8, // Set visible portion of each card
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            Column(
              children: filteredScholarships.map((scholarship) => ScholarshipCard(scholarship: scholarship)).toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
class ScholarshipCard extends StatelessWidget {
  final Scholarship scholarship;

  const ScholarshipCard({Key? key, required this.scholarship}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to detail page or perform any action on tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DBeasiswa(),
          ),
        );
      },
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
                  scale : 6,
                  fit: BoxFit.cover, 
                  //fit: BoxFit.fitWidth,
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

