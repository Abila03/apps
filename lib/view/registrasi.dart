import 'package:apps/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SchoolData{
  final String sekolah;
  final String jurusan;
  final int angkatan;

  SchoolData({
  required this.sekolah,
  required this.jurusan,
  required this.angkatan,
  });

  SchoolData copyWith({
    String? sekolah,
    String? jurusan,
    int? angkatan,
  }) {
    return SchoolData(
      sekolah: sekolah ?? this.sekolah,
      jurusan: jurusan ?? this.jurusan,
      angkatan: angkatan ?? this.angkatan,
    );
  }
}
class CollegeData{
  final String kuliah;
  final String prodi;
  final int entry;
  
  CollegeData({
  required this.kuliah,
  required this.prodi,
  required this.entry,
  });

  CollegeData copyWith({
    String? kuliah,
    String? prodi,
    int? entry,
  }) {
    return CollegeData(
      kuliah: kuliah ?? this.kuliah,
      prodi: prodi ?? this.prodi,
      entry: entry ?? this.entry,
    );
  }
}
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
  final _schoolKey = GlobalKey<FormState>();
  final _schoolController = TextEditingController();
  final _jurusanController = TextEditingController();
  final _angkatanController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Sekolah'),
      ),
      body: Form(
        key: _schoolKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _schoolController,
                decoration: InputDecoration(labelText: 'Nama Sekolah'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Sekolah tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _jurusanController,
                decoration: InputDecoration(labelText: 'Jurusan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jurusan tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _angkatanController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Angkatan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Angkatan tidak boleh kosong';
                  }
                  try {
                  int.parse(value); // Try converting the input to an integer
                    return null; // Valid input
                  } on FormatException catch (_) {
                    return 'Angkatan hanya berupa angka'; // Invalid input
                  }
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_schoolKey.currentState!.validate()) {
                    final schoolData = SchoolData(
                      sekolah: _schoolController.text,
                      jurusan: _jurusanController.text,
                      angkatan: _angkatanController.hashCode,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailVerificationPage(registrationData: widget.registrationData),
                      ),
                    );
                  }
                },
                child: Text('Selanjutnya'),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage()
                      ),
                    );
                  
                },
                child: Text('Login'),
              ),
            ],
          ),
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
  final _collegeKey = GlobalKey<FormState>();
  final _collegeController = TextEditingController();
  final _prodiController = TextEditingController();
  final _entryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi Perguruan Tinggi'),
      ),
      body: Form(
        key: _collegeKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                controller: _collegeController,
                decoration: InputDecoration(labelText: 'Nama Perguruan Tinggi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Perguruan Tinggi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _prodiController,
                decoration: InputDecoration(labelText: 'Program Studi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Program Studi tidak boleh kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _entryController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Angkatan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Angkatan tidak boleh kosong';
                  }
                  try {
                  int.parse(value); // Try converting the input to an integer
                    return null; // Valid input
                  } on FormatException catch (_) {
                    return 'Angkatan hanya berupa angka'; // Invalid input
                  }
                },
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  if (_collegeKey.currentState!.validate()) {
                    final collegeData = CollegeData(
                      kuliah: _collegeController.text,
                      prodi: _prodiController.text,
                      entry: _entryController.hashCode,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmailVerificationPage(registrationData: widget.registrationData),
                      ),
                    );
                  }
                },
                child: Text('Selanjutnya'),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage()
                      ),
                    );
                  
                },
                child: Text('Login'),
              ),
            ],
          ),
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
  final _schoolKey = GlobalKey<FormState>();
  final _collegeKey = GlobalKey<FormState>();
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
            SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage()
                      ),
                    );
                  
                },
                child: Text('Login'),
              ),
          ],
        ),
      ),
    );
  }
}
