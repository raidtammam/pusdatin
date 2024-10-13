import 'package:flutter/material.dart';
import 'package:pusdatin_project/widgets/custom_bottom_nav_bar.dart'; // Import BottomNavBar
import 'package:pusdatin_project/widgets/dashboard_widget.dart'; // Import DashboardWidget
import 'package:pusdatin_project/widgets/calendar_widget.dart'; // Import CalendarWidget

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  int _currentIndex = 0;

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3D0E22),
      resizeToAvoidBottomInset: true, // Mencegah overflow ketika keyboard muncul
      body: SafeArea(
        child: Column(
          children: [
            // Header Profil
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.camera_alt, color: Colors.black54),
                      ),
                      const SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Pusat Data dan Informasi',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Kementrian Pertahanan RI',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Expanded Calendar untuk menyesuaikan ukuran
            Expanded(
              flex: 3,
              child: CalendarWidget(
                focusedDay: _focusedDay,
                selectedDay: _selectedDay,
                onDaySelected: _onDaySelected,
              ),
            ),

            const SizedBox(height: 10.0),

            // Expanded Dashboard agar tidak melebihi ruang yang tersedia
            Expanded(
              flex: 2,
              child: DashboardWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
