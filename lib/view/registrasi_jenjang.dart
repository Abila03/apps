import 'package:apps/view/registrasi.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart'; // Import library Firebase Realtime Database
import 'verifikasi.dart'; // Pastikan Anda mengganti sesuai struktur proyek Anda

class jenjang extends StatefulWidget {
  @override
  _EducationFormState createState() => _EducationFormState();
}

class _EducationFormState extends State<jenjang> {
  String educationLevel = 'SD';
  final TextEditingController _schoolNameController = TextEditingController();

  void _submitData() async {
    try {
      // Mengambil data pengguna yang disimpan di Firebase Realtime Database
      DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('pendaftar');
      DataSnapshot dataSnapshot = await databaseReference.once()as DataSnapshot;

      // Memperbarui data pengguna dengan informasi jenjang pendidikan
      await databaseReference.child(dataSnapshot.key!).update({
        'jenjang': educationLevel,
        'schoolName': _schoolNameController.text,
        // Anda dapat menambahkan data lain sesuai kebutuhan
      });

      // Navigasi ke langkah registrasi selanjutnya (contoh Verifikasi)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Verifikasi()),
      );
    } catch (e) {
      print('Error updating data: $e');
      // Tampilkan pesan kesalahan jika diperlukan
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                        Text(
              'Pendidikan Saat Ini',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Bantu kami menemukan beasiswa yang lebih relevan untuk kamu',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ChoiceChip(
                  label: Text('SD'),
                  selected: educationLevel == 'SD',
                  onSelected: (selected) {
                    setState(() {
                      educationLevel = 'SD';
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: 8),
                ChoiceChip(
                  label: Text('SMP'),
                  selected: educationLevel == 'SMP',
                  onSelected: (selected) {
                    setState(() {
                      educationLevel = 'SMP';
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: 8),
                ChoiceChip(
                  label: Text('SMA'),
                  selected: educationLevel == 'SMA',
                  onSelected: (selected) {
                    setState(() {
                      educationLevel = 'SMA';
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                SizedBox(width: 8),
                ChoiceChip(
                  label: Text('Pendidikan Tinggi'),
                  selected: educationLevel == 'Pendidikan Tinggi',
                  onSelected: (selected) {
                    setState(() {
                      educationLevel = 'Pendidikan Tinggi';
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _schoolNameController,
              decoration: InputDecoration(
                labelText: 'Nama Sekolah',
                hintText: 'Masukkan nama sekolah kamu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Registrasi()),
                      );
                    },
                    child: Text(
                      'Sebelumnya',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Verifikasi(),
                            ),
                          );
                    },
                    child: Text(
                      'Selanjutnya',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

