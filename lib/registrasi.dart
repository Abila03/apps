import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';

class RegistrationData {
  final String email;
  final String fullName;
  final String password;
  final String confirmPassword;
  final String jenjang;

  RegistrationData({
    required this.email,
    required this.fullName,
    required this.password,
    required this.confirmPassword,
    required this.jenjang,
  });
  RegistrationData copyWith({
    String? email,
    String? fullName,
    String? password,
    String? confirmPassword,
    String? educationLevel, required String jenjang,
  }) {
    return RegistrationData(
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      jenjang: educationLevel ?? this.jenjang,
    );
  }
}
class Registrasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registrasi Berlapis',
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
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
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
              SizedBox(height: 16.0),
              TextFormField(
                controller: _fullNameController,
                decoration: InputDecoration(labelText: 'Nama Lengkap'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama lengkap tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Kata Sandi'),
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
              SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Konfirmasi Kata Sandi'),
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
              SizedBox(height: 32.0),
              ElevatedButton(
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
                        builder: (context) => jenjangPage(registrationData: registrationData),
                      ),
                    );
                  }
                },
                child: Text('Selanjutnya'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class jenjangPage extends StatefulWidget {
  final RegistrationData registrationData;

  const jenjangPage({Key? key, required this.registrationData}) : super(key: key);

  @override
  _jenjangPageState createState() => _jenjangPageState();
}

class _jenjangPageState extends State<jenjangPage> {
  String _selectedjenjang = 'Sekolah';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Pilih Jenjang Pendidikan'),
            SizedBox(height: 16.0),
            DropdownButton<String>(
              value: _selectedjenjang,
              items: [
                DropdownMenuItem(child: Text('Sekolah'), value: 'Sekolah'),
                DropdownMenuItem(child: Text('Perguruan Tinggi'), value: 'Perguruan Tinggi'),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedjenjang = value!;
                });
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                final updatedRegistrationData = widget.registrationData.copyWith(jenjang: _selectedjenjang);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => _selectedjenjang == 'Sekolah'
                        ? SchoolRegistrationPage(registrationData: updatedRegistrationData)
                        : CollegeRegistrationPage(registrationData: updatedRegistrationData),
                  ),
                );
              },
              child: Text('Selanjutnya'),
            ),
          ],
        ),
      ),
    );
  }
}
class SchoolRegistrationPage extends StatefulWidget {
  final RegistrationData registrationData;

  const SchoolRegistrationPage({Key? key, required this.registrationData}) : super(key: key);

  @override
  _SchoolRegistrationPageState createState() => _SchoolRegistrationPageState();
}

class _SchoolRegistrationPageState extends State<SchoolRegistrationPage> {
  // Add form fields for school-specific information

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Sekolah'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Form fields for school registration
            // ...

            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Validate and process school registration data
                // ...

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmailVerificationPage(registrationData: widget.registrationData),
                  ),
                );
              },
              child: Text('Kirim Kode Verifikasi Email'),
            ),
          ],
        ),
      ),
    );
  }
}
class CollegeRegistrationPage extends StatefulWidget {
  final RegistrationData registrationData;

  const CollegeRegistrationPage({Key? key, required this.registrationData}) : super(key: key);

  @override
  _CollegeRegistrationPageState createState() => _CollegeRegistrationPageState();
}

class _CollegeRegistrationPageState extends State<CollegeRegistrationPage> {
  // Add form fields for college-specific information

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Perguruan Tinggi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Form fields for college registration
            // ...

            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Validate and process college registration data
                // ...

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmailVerificationPage(registrationData: widget.registrationData),
                  ),
                );
              },
              child: Text('Kirim Kode Verifikasi Email'),
            ),
          ],
        ),
      ),
    );
  }
}
class EmailVerificationPage extends StatefulWidget {
  final RegistrationData registrationData;

  const EmailVerificationPage({Key? key, required this.registrationData}) : super(key: key);

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  final _formKey = GlobalKey<FormState>();
  final _verificationCodeController = TextEditingController();

  @override
  void dispose() {
    _verificationCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi Email'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Kode verifikasi telah dikirim ke email ${widget.registrationData.email}'),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _verificationCodeController,
              decoration: InputDecoration(labelText: 'Kode Verifikasi'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kode verifikasi tidak boleh kosong';
                }
                return null;
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute
                    (builder: (context) => RegistrationCompletePage(registrationData: widget.registrationData),
                    ),
                  );
                
              },
              child: Text('Verifikasi'),
            ),
          ],
        ),
      ),
    );
  }
}
class RegistrationCompletePage extends StatelessWidget {
  final RegistrationData registrationData;

  const RegistrationCompletePage({Key? key, required this.registrationData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Berhasil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Pendaftaran Anda telah berhasil!'),
            SizedBox(height: 16.0),
            Text('Detail Registrasi:'),
            Text('Email: ${registrationData.email}'),
            Text('Nama Lengkap: ${registrationData.fullName}'),
            Text('Kata Sandi: ${registrationData.password}'),
            Text('Jenjang Pendidikan: ${registrationData.jenjang}'),
            // Add any other relevant registration details
          ],
        ),
      ),
    );
  }
}
