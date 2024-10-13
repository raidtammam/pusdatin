import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart'; // Import untuk Pie Chart
import 'package:table_calendar/table_calendar.dart'; // Import untuk Kalender
import 'dart:collection'; // Untuk Map dan LinkedHashMap

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final Map<DateTime, List<String>> _events = LinkedHashMap(equals: isSameDay);

  List<_ChartData> _chartData = [
    _ChartData('Baik', 50, Colors.blue),
    _ChartData('Rusak Ringan', 30, Colors.orange),
    _ChartData('Rusak Berat', 20, Colors.red),
  ];

  @override
  void initState() {
    super.initState();

    // Contoh Event
    _events[DateTime.utc(2023, 10, 15)] = ['Pengecekan Barang 1'];
    _events[DateTime.utc(2023, 10, 16)] = ['Pengecekan Barang 2'];
    _events[DateTime.utc(2023, 10, 17)] = ['Pengecekan Barang 3'];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3D0E22), // Warna latar belakang
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header Profil
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.camera_alt, color: Colors.black54),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lorem ipsum dolor sit amet',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            'Consectetur adipiscing elit',
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
                    icon: Icon(Icons.notifications, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20.0),

              // Kalender Interaktif
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: TableCalendar(
                  firstDay: DateTime(2022),
                  lastDay: DateTime(2030),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: _onDaySelected,
                  calendarStyle: CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    defaultTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    weekendTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    titleTextStyle: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Colors.red),
                    weekdayStyle: TextStyle(color: Colors.black),
                  ),
                  eventLoader: (day) {
                    return _events[day] ?? [];
                  },
                ),
              ),
              SizedBox(height: 20.0),

              // Grafik Pie Chart Medium
              Container(
                width: MediaQuery.of(context).size.width * 0.9, // Lebar 80% layar
                height: 230, // Tinggi menengah
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kondisi Barang',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    Expanded(
                      child: SfCircularChart(
                        legend: Legend(isVisible: true),
                        series: <CircularSeries>[
                          DoughnutSeries<_ChartData, String>(
                            dataSource: _chartData,
                            pointColorMapper: (_ChartData data, _) =>
                                data.color,
                            xValueMapper: (_ChartData data, _) => data.label,
                            yValueMapper: (_ChartData data, _) => data.value,
                            dataLabelSettings:
                                DataLabelSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF3D0E22),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventaris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

// Model Data untuk Pie Chart
class _ChartData {
  final String label;
  final int value;
  final Color color;

  _ChartData(this.label, this.value, this.color);
}
