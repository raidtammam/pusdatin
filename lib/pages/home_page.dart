import 'package:flutter/material.dart';
import 'login_page.dart'; // Import halaman LoginPage

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selamat Datang!',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20.0),

            // Tombol Logout untuk kembali ke LoginPage
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false, // Menghapus seluruh stack halaman sebelumnya
                );
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
