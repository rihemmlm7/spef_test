import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:spef/components/event.dart';
import 'package:spef/components/HistoriqueProfile.dart';

class HistoryPage extends StatefulWidget {
  final Event? newEvent;

  HistoryPage({this.newEvent});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.week;
  double _calendarHeight = 150.0;
  int _tapCount = 0;
  List<Event> _events = [];

  @override
  void initState() {
    super.initState();
    if (widget.newEvent != null) {
      _events.add(widget.newEvent!);
    }
  }

  void _toggleCalendarFormat() {
    setState(() {
      if (_calendarFormat == CalendarFormat.month) {
        _calendarFormat = CalendarFormat.week;
        _calendarHeight = 150.0;
      } else {
        _calendarFormat = CalendarFormat.month;
        _calendarHeight = 350.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Historique'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context);
          return true;
        },
        child: Padding(
          padding: EdgeInsets.all(screenHeight * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: screenHeight * 0.01),
              GestureDetector(
                onTap: () {
                  _tapCount++;
                  if (_tapCount == 1) {
                    _toggleCalendarFormat();
                    _tapCount = 0;
                  }
                },
                child: SizedBox(
                  height: _calendarHeight,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 400),
                    height: _calendarHeight,
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 400.0,
                        ),
                        child: Container(
                          color: Colors.white,
                          child: TableCalendar<Event>(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            headerVisible: true,
                            headerStyle: HeaderStyle(
                              titleCentered: true,
                              formatButtonVisible: false,
                            ),
                            daysOfWeekStyle: DaysOfWeekStyle(
                              weekdayStyle: TextStyle(color: Colors.amber),
                              weekendStyle: TextStyle(color: Colors.red),
                            ),
                            calendarStyle: CalendarStyle(
                              todayDecoration: BoxDecoration(color: Colors.amber),
                              selectedDecoration: BoxDecoration(color: Colors.amber.shade200),
                            ),
                            focusedDay: _focusedDay,
                            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                            onDaySelected: _onDaySelected,
                            calendarFormat: _calendarFormat,
                            onFormatChanged: (format) => setState(() {
                              _calendarFormat = format;
                            }),
                            eventLoader: _getEventsForDay,
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
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _events.where((event) => isSameDay(event.date, day)).toList();
  }
}
