import 'package:apps/view/details_beasiswa.dart';
import 'package:apps/view/list_beasiswa.dart';
import 'deadline.dart';
import 'package:flutter/material.dart';
import 'api.dart';
import 'footer.dart';
import 'package:apps/view/header.dart';
class Home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    //API1(),
                    //Spacer(),
                    Positioned(
                      bottom: 1.0, // Position from bottom of the image
                      left: 10.0,
                      child : Text(
                        'Deadline Terdekat',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    
                  ],
                ),
              
            ],
          ),
        ),
      //bottomNavigationBar: Footer(),
    );
  }
}
