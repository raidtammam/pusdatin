import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection'; // Untuk Map dan LinkedHashMap

class CalendarWidget extends StatefulWidget {
  final DateTime focusedDay;
  final DateTime? selectedDay;
  final Function(DateTime, DateTime) onDaySelected;

  const CalendarWidget({
    Key? key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final Map<DateTime, List<String>> _events = LinkedHashMap(equals: isSameDay);

  @override
  void initState() {
    super.initState();

    // Contoh event untuk kalender
    _events[DateTime.utc(2023, 10, 15)] = ['Pengecekan Barang 1'];
    _events[DateTime.utc(2023, 10, 16)] = ['Pengecekan Barang 2'];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9; // Lebar 90% layar
    double height = MediaQuery.of(context).size.height * 0.45; // Tinggi 50% layar

    return Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0), // Border membulat
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4), // Shadow di bawah
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Align(
          alignment: Alignment.center, // Pusatkan konten kalender
          child: TableCalendar(
            firstDay: DateTime(2022),
            lastDay: DateTime(2030),
            focusedDay: widget.focusedDay,
            selectedDayPredicate: (day) => isSameDay(widget.selectedDay, day),
            onDaySelected: widget.onDaySelected,
            calendarStyle: const CalendarStyle(
              defaultTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.black,
              ),
              weekendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
                color: Colors.red,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              cellMargin: EdgeInsets.all(4.0), // Jarak antar cell kecil
              markersMaxCount: 1, // Maksimal 1 marker per cell
            ),
            headerStyle: const HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              leftChevronVisible: true,
              rightChevronVisible: true,
              titleTextStyle: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.red, fontSize: 12.0),
              weekdayStyle: TextStyle(color: Colors.black, fontSize: 12.0),
            ),
            eventLoader: (day) {
              return _events[day] ?? [];
            },
          ),
        ),
      ),
    );
  }
}
