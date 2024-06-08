import 'package:apps/view/login_page.dart';
import 'package:flutter/material.dart';
import 'registrasi.dart';

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
        title: Text(''),
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
                widthFactor: 20,
                child: Image.asset('images/person.png', scale: 1,),
              ),
              SizedBox(height: 20.0),
              Align(
                widthFactor: 11,
                child: Image.asset('images/BeasiswaKu.png', scale: 3,),
              ),
              SizedBox(height: 10.0),
              Text(
                textAlign: TextAlign.center,
                'Sistem Pendaftaran Beasiswa Terpadu untuk Pendidikan Indonesia',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color.fromARGB(255, 126, 120, 120),
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Registrasi()),
                  );
                },
                child: Text(
                  'DAFTAR',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 238, 238, 238),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners for button
                  ),
                  minimumSize: Size(double.infinity, 50.0),
                  backgroundColor: Color.fromARGB(255, 5, 122, 218),
                  
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  'MASUK',
                  style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 5, 122, 218),
                ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners for button
                  ),
                  minimumSize: Size(double.infinity, 50.0), 
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  side: BorderSide(
                    color: Colors.blue, 
                    width: 1.0, 
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
