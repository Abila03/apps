import 'package:flutter/material.dart';

class header extends StatelessWidget {
  const header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0, // Adjust height as needed
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/header-home.png'), // Replace with your image path
          fit: BoxFit.cover, // Adjust fit for desired behavior (cover, fill, etc.)
        ),
      ),
    );
  }
}
