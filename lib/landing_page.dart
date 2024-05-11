import 'package:apps/login_page.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/BeasiswaKu.png', scale: 6,),
        centerTitle: true, // Center the app bar title
      ),
      body: Center( // Center the login form within the screen
        child: SingleChildScrollView( // Allow content to scroll if needed
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the form vertically
            crossAxisAlignment: CrossAxisAlignment.center, // Center form elements horizontally
            children: [
              Align(
                widthFactor: 10,
                child: Image.asset('images/person.png', scale: 6,),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners for button
                  ),
                  minimumSize: Size(double.infinity, 50.0), // Set a minimum button size
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners for button
                  ),
                  minimumSize: Size(double.infinity, 50.0), // Set a minimum button size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
