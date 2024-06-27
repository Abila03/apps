import 'package:flutter/material.dart';

class header extends StatelessWidget {
  const header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0, 
      width: 1000,
      decoration: 
      const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/header-home.png'), // Replace with your image path
          fit: BoxFit.cover, // Adjust fit for desired behavior (cover, fill, etc.)
        ),
      ),
    );
  }
}
