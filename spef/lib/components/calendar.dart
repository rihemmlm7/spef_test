import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    // Schedule format change after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _calendarFormat = CalendarFormat.week;
      });
    });
  }

  @override
  Widget build(BuildContext context) => TableCalendar<int>(
    firstDay: DateTime.utc(2010, 10, 16),
    lastDay: DateTime.utc(2030, 3, 14),
    headerVisible: true,
    headerStyle: const HeaderStyle(
      titleCentered: true,
      formatButtonVisible: true,
    ),
    daysOfWeekStyle: const DaysOfWeekStyle(
      weekdayStyle: TextStyle(color: Colors.amber),
      weekendStyle: TextStyle(color: Colors.red),
    ),
    calendarStyle: CalendarStyle(
      todayDecoration: const BoxDecoration(color: Colors.amber),
      selectedDecoration: BoxDecoration(color: Colors.amber.shade200),
    ),
    focusedDay: _focusedDay,
    selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
    onDaySelected: _onDaySelected,
    calendarFormat: _calendarFormat,
    onFormatChanged: _onFormatChanged,
  );

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onFormatChanged(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
      if (_calendarFormat == CalendarFormat.week) {
        _focusedDay = _selectedDay ?? DateTime.now();
      }
    });
  }
}