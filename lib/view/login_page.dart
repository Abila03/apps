import 'package:apps/view/cp.dart';
import 'package:apps/view/pendaftar/profile.dart';
import 'package:flutter/material.dart';
//import 'package:apps/controller/usermanage.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = true;
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
        title: Text('Login'),
        centerTitle: true, // Center the app bar title
      ),
      body: SingleChildScrollView( 
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Center the form vertically
            crossAxisAlignment: CrossAxisAlignment.start, // Center form elements horizontally
            children: [
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Alamat Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[\w-\.]+@[\w-\.]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'Format email tidak valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Kata Sandi',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: _showPassword,
                decoration: InputDecoration(
                  labelText: 'Masukkan Kata Sandi Kamu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5), // Atur tingkat opacity (0.0 - 1.0)
                      width: 1.0, // Atur ketebalan border dalam pixel
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kata sandi tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Kata sandi minimal 6 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => changepass()),
                  );
                }, 
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Lupa Password?',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
                child: Text(
                  'Masuk',
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
            ],
          ),
        ),
      );
  }
}
