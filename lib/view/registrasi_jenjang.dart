import 'package:apps/view/verifikasi.dart';
import 'package:flutter/material.dart';




class jenjang extends StatefulWidget {
  @override
  _EducationFormState createState() => _EducationFormState();
}

class _EducationFormState extends State<jenjang> {
  String educationLevel = 'SD';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
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
                  width: 150, // Set width for Sebelumnya button
                  height: 50, // Set height for Sebelumnya button
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle previous button press
                    },
                    child: Text(
                      'Sebelumnya',
                      style: TextStyle(fontSize: 18, 
                      color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Set the color for Sebelumnya button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150, // Set width for Selanjutnya button
                  height: 50, // Set height for Selanjutnya button
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
                      style: TextStyle(fontSize: 18, 
                      color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Set the color for Selanjutnya button
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
