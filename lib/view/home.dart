import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'list_beasiswa.dart';
import 'header.dart';
import '/services/beasiswaAPI.dart';
import '/models/beasiswa.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Beasiswa> scholarships = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchScholarships();
  }

  void fetchScholarships() async {
    setState(() {
      isLoading = true;
    });
    try {
      final List<Beasiswa> fetchedScholarships = await ScholarshipService.getScholarships();
      setState(() {
        scholarships = fetchedScholarships;
        isLoading = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget userInfoBox(String name, String role, {String? email, String? phone}) {
    return GestureDetector(
      onTap: () {
        // Navigate to user profile or settings page
        print('User info box tapped');
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 20.0,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  role,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const header(), // Assuming header.dart is renamed to Header for naming conventions
                Positioned(
                  top: 180.0, // Adjust the position as needed
                  left: 75.0, // Adjust the position as needed
                  child: userInfoBox(
                    'Aulia Putri R',
                    'Mahasiswa Universitas Jember',
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Image.asset(
                  'images/card-home.png',
                  height: 200.0,
                  width: 2000,
                ),
                const Positioned(
                  top: 50.0,
                  left: 160.0,
                  child: Text(
                    'Daftar Beasiswa Yuk!',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Positioned(
                  top: 80.0,
                  left: 160.0,
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
                  bottom: 40.0, // Position from bottom of the image
                  right: 110.0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ListBeasiswa()),
                      );
                    },
                    child: const Text(
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
                      minimumSize: const Size(150.0, 40.0),
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 1.0, // Position from bottom of the image
                  left: 10.0,
                  child: Text(
                    'Deadline Terdekat',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            isLoading
            ? const CircularProgressIndicator() // Menampilkan indikator loading
            : scholarships.isEmpty
            ? const Text('Tidak ada data') // Menampilkan pesan jika data kosong
            : CarouselSlider.builder(
              itemCount: scholarships.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final beasiswa = scholarships[index];
                return ListTile(
                  leading: CachedNetworkImage(
                        imageUrl: beasiswa.imageUrl, // Gunakan imageUrl untuk gambar
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  title: Text(beasiswa.name),
                  subtitle: Text(beasiswa.description),
                  onTap: () {
                    //
                  },
                );
              },
              options: CarouselOptions(
                aspectRatio: 21 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
