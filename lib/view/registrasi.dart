import 'package:apps/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'registrasi_jenjang.dart';
import 'data_registrasi.dart';




class Registrasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registrasi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GeneralInfoPage(),
    );
  }
}
class GeneralInfoPage extends StatefulWidget {
  @override
  _GeneralInfoPageState createState() => _GeneralInfoPageState();
}

class _GeneralInfoPageState extends State<GeneralInfoPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _showPassword = true;


  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Center the form vertically
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email kamu',
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
                'Nama Lengkap',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: 'Nama lengkap kamu',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama lengkap tidak boleh kosong';
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
              SizedBox(height: 5.0),
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
              SizedBox(height: 20.0),
              Text(
                'Konfirmasi Kata Sandi',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _showPassword,
                decoration: InputDecoration(
                  labelText: 'Masukkan konfirmasi kata sandi kamu',
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
                    return 'Konfirmasi kata sandi tidak boleh kosong';
                  }
                  if (value != _passwordController.text) {
                    return 'Konfirmasi kata sandi tidak sesuai';
                  }
                  return null;
                },
              ),
              Spacer(),
              Align(
                alignment: Alignment.centerRight,
              child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final registrationData = RegistrationData(
                            email: _emailController.text,
                            fullName: _fullNameController.text,
                            password: _passwordController.text,
                            confirmPassword: _confirmPasswordController.text,
                            jenjang: '', // Education level will be selected later
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => jenjang(),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Selanjutnya',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 238, 238, 238),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners for button
                        ),
                        minimumSize: Size(120, 48), 
                        backgroundColor: Color.fromARGB(255, 5, 122, 218),
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

