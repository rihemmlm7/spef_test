import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:spef/components/HistoriqueProfile.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late CalendarFormat _calendarFormat;
  double _calendarHeight = 150.0; // Initial height of the calendar
  int _tapCount = 0; // Counter for tap count

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.week; // Initialize calendar format to week
  }

  // Function to toggle the calendar format
  void _toggleCalendarFormat() {
    setState(() {
      _calendarFormat =
          _calendarFormat == CalendarFormat.month ? CalendarFormat.week : CalendarFormat.month;
      _calendarHeight = _calendarFormat == CalendarFormat.month ? 350.0 : 150.0; // Adjust height accordingly
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent, // Set background color to transparent
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Historique'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context); // Navigate back to the previous screen when back button is pressed
          return true; // Return true to indicate that the back action is handled
        },
        child: Padding(
          padding: EdgeInsets.all(screenHeight * 0.00),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.01),
              GestureDetector( // Wrap TableCalendar with GestureDetector
                onTap: () {
                  // Increment tap count on each tap
                  _tapCount++;
                  // If tap count reaches 2, toggle calendar format to week
                  if (_tapCount == 1) {
                    _toggleCalendarFormat();
                    _tapCount = 0; // Reset tap count
                  }
                },
                child: SizedBox(
                  height: _calendarHeight, // Set the height of the calendar
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    height: _calendarHeight, // Set the height of the calendar
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 400.0, // Set a maximum height for the calendar
                        ),
                        child: Container( // Wrap TableCalendar with Container
                          color: Colors.white, // Set background color to white
                          child: TableCalendar<int>(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            headerVisible: true,
                            headerStyle: const HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
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
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Expanded(
                child: _calendarFormat == CalendarFormat.week
                    ? ListView(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Divider(
                        color: Colors.grey[300],
                        thickness: screenHeight * 0.004,
                      ),
                    ),
                    HistoriqueProfile(),
                  ],
                )
                    : SingleChildScrollView(
                  child: Column(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Divider(
                          color: Colors.grey[300],
                          thickness: screenHeight * 0.002,
                        ),
                      ),
                      HistoriqueProfile(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    } else {
      _toggleCalendarFormat(); // Reset calendar format to week view
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
