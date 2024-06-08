import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class changepass extends StatefulWidget {
  @override
  _UbahKataSandiState createState() => _UbahKataSandiState();
}

class _UbahKataSandiState extends State<changepass> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubah Kata Sandi'),
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
                'Kata Sandi Lama',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi Lama',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kata sandi lama tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Kata sandi minimal 6 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Kata Sandi Baru',
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5.0),
              TextFormField(
                controller: _newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi Baru',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kata sandi baru tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Kata sandi minimal 6 karakter';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final user = FirebaseAuth.instance.currentUser;

                    try {
                      await user!.updatePassword(_newPasswordController.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Kata sandi berhasil diubah'),
                        ),
                      );
                      Navigator.pop(context);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Kata sandi baru terlalu lemah'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Terjadi kesalahan: ${e.message}'),
                          ),
                        );
                      }
                    }
                  }
                },
                child: Text(
                  'Ubah Kata Sandi',
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
      ),
    );
  }
}
