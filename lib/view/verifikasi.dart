import 'package:apps/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart'; // Import library Firebase Realtime Database

class Verifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _verificationController = TextEditingController();

    void _verifyData() async {
      try {
        // Mengambil data pengguna yang disimpan di Firebase Realtime Database
        DatabaseReference databaseReference = FirebaseDatabase.instance.reference().child('users');
        DataSnapshot dataSnapshot = await databaseReference.once() as DataSnapshot; // Mengubah tipe ke DataSnapshot

        // Memperbarui data pengguna dengan kode verifikasi
        await databaseReference.child(dataSnapshot.key!).update({
          'verificationCode': _verificationController.text,
          // Anda dapat menambahkan data lain sesuai kebutuhan
        });

        // Navigasi ke halaman selanjutnya (misalnya ke halaman beranda)
        Navigator.pushNamed(context, '/home');
      } catch (e) {
        print('Error verifying data: $e');
        // Tampilkan pesan kesalahan jika diperlukan
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Verifikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Amankan akun kamu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Masukkan kode yang kami kirim ke email kamu',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  height: 50,
                  child: TextField(
                    controller: _verificationController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () {
                  // Logika untuk mengirim ulang kode verifikasi
                },
                child: Text(
                  'Tidak dapat kode? Kirim ulang kode',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Handle cancel logic
                  },
                  child: Text(
                    'Batalkan',
                    style: TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Verifikasi',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    minimumSize: Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
