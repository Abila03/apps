import 'package:flutter/material.dart';
import '/services/newsAPI.dart';
import '/models/news.dart';
import 'package:carousel_slider/carousel_slider.dart';

class API1 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<API1> {
  late Future<List<NewsModel>> _futureNews;
  final _newsApiService = NewsApiService();

  @override
  void initState() {
    super.initState();
    _futureNews = _newsApiService.fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return
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
                              aspectRatio: 16 / 8, // Adjust aspect ratio for card shape
                              viewportFraction: 0.8, // Set visible portion of each card
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 1),
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
                    );
  }
}