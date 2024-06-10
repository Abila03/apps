import 'package:flutter/material.dart';



class Verifikasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add navigation logic here
          },
        ),
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
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: TextStyle(fontSize: 18),
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue), // Change the border color here
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
                  // Add resend code logic here
                },
                child: Text(
                  'Tidak dapat kode? Kirim ulang kode',
                  style: TextStyle(fontSize: 14), // Adjust font size here
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Add cancel logic here
                  },
                  child: Text(
                    'Batalkan', 
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue)), // Adjust font size here
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue, 
                    minimumSize: Size(150, 50), // Adjust button size here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Adjust corner radius here
                    ),
                    side: BorderSide(color: Colors.blue, width: 2), // Set border color
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add verification logic here
                  },
                  child: Text(
                    'Verifikasi', 
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white)), // Adjust font size here
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set button background color here
                    minimumSize: Size(150, 50), // Adjust button size here
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Adjust corner radius here
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
