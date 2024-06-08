import 'package:apps/view/list_beasiswa.dart';
import 'package:flutter/material.dart';
import '/services/newsAPI.dart';
import '/models/news.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'footer.dart';
import 'package:apps/view/header.dart';

class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  void initState() {
    super.initState();
    _futureNews = _newsApiService.fetchTopHeadlines();
  }
  late Future<List<NewsModel>> _futureNews;
  final _newsApiService = NewsApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Beasiswa Yuk!'),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
                Stack(
                  children: [
                    Image.asset(
                      'images/card-home.png', height: 250.0, width: 2000.0
                    ),
                    Positioned(
                      top: 80.0,
                      left: 140.0,
                      child: Text(
                        'Daftar Beasiswa Yuk!',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 110.0,
                      left: 150.0,
                      width: 250.0,
                      child: Text(
                        'Dapatkan jutaan rupiah untuk menunjang pendidikanmu.',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 65.0, // Position from bottom of the image
                      right: 100.0,
                      child : ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ListBeasiswa()),
                          );
                        },
                        child: Text(
                          'Cari Beasiswa',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 5, 122, 218),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0), // Rounded corners for button
                          ),
                          minimumSize: Size(150.0, 40.0),
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0), 
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Deadline Terdekat',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
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
            ],
          ),
        ),
      bottomNavigationBar: Footer(),
    );
  }
}
