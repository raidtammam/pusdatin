import 'package:flutter/material.dart';

class DataBarangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3D0E22), // Warna header
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Menu', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Color(0xFF3D0E22), // Latar belakang
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan logo dan navigasi tab
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Logo dan Judul
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo.png', // Ganti dengan path logo Anda
                        height: 50,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'INVENTARIS BARANG\nPUSDATIN KEMHAN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  // Navigasi Tab
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Data Barang',
                            style: TextStyle(color: Colors.white)),
                      ),
                      VerticalDivider(color: Colors.white, width: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text('Pemeliharaan Barang',
                            style: TextStyle(color: Colors.white54)),
                      ),
                      VerticalDivider(color: Colors.white, width: 20),
                      TextButton(
                        onPressed: () {},
                        child: Text('Peminjaman Barang',
                            style: TextStyle(color: Colors.white54)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Tombol Filter dan Search
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FilterButton(
                        label: 'XLS',
                        color: Colors.green,
                        icon: Icons.table_chart,
                      ),
                      SizedBox(width: 10),
                      FilterButton(
                        label: 'PDF',
                        color: Colors.red,
                        icon: Icons.picture_as_pdf,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // List Data Barang
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DataBarangCard(
                    noSeri: 'MDB.19SCM20.RF07',
                    merk: 'Drone',
                    status: 'Dipelihara',
                    kondisi: 'Rusak Ringan',
                    tanggal: '2019 - 09 - 20',
                    jumlah: 7,
                  ),
                  DataBarangCard(
                    noSeri: 'MDB.19SCM20.RF07',
                    merk: 'Drone',
                    status: 'Dipelihara',
                    kondisi: 'Rusak Ringan',
                    tanggal: '2019 - 09 - 20',
                    jumlah: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk Tombol Filter
class FilterButton extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  FilterButton({required this.label, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        // primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

// Widget untuk Kartu Data Barang
class DataBarangCard extends StatelessWidget {
  final String noSeri;
  final String merk;
  final String status;
  final String kondisi;
  final String tanggal;
  final int jumlah;

  DataBarangCard({
    required this.noSeri,
    required this.merk,
    required this.status,
    required this.kondisi,
    required this.tanggal,
    required this.jumlah,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Informasi Barang
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('No. Seri Barang: $noSeri',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Merk Barang: $merk'),
                  Text('Status Barang: $status'),
                  Text('Kondisi: $kondisi'),
                  Text('Tanggal Masuk: $tanggal'),
                ],
              ),
            ),

            // Jumlah Barang dengan Icon
            Column(
              children: [
                Icon(Icons.air, size: 50, color: Colors.grey),
                SizedBox(height: 5),
                Text('Jumlah: $jumlah', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
