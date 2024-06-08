import 'package:flutter/material.dart';

class header extends StatelessWidget {
  const header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.asset(
          'images/header-home.png',
          height: 200.0,
          width: 200.0,
        ),
      ),
    );
  }
}
