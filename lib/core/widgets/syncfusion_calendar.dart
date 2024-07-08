import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

DateTime? showCalendarDialog(BuildContext context) {
  DateTime? selectedDate;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      List<Meeting> getDataSource() {
        final List<Meeting> meetings = <Meeting>[];
        final DateTime today = DateTime.now();
        final DateTime startTime = DateTime(
            today.year, today.month, today.day, 9, 0, 0);
        final DateTime endTime = startTime.add(const Duration(hours: 2));
        meetings.add(Meeting(
            'Conference', startTime, endTime, const Color(0xFF0F8644), false));
        return meetings;
      }
      return AlertDialog(
        title: const Text('Select a Date'),
        content: SizedBox(
          width: double.maxFinite,
          height: 400,
          child: SfCalendar(

            onTap: (CalendarTapDetails details) {
              if (details.targetElement == CalendarElement.calendarCell) {
                selectedDate = details.date;
                Navigator.of(context).pop();
              }

            },
            selectionDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            view: CalendarView.month,
            showDatePickerButton: true,
            dataSource: MeetingDataSource(getDataSource()),
            monthCellBuilder: (BuildContext context, MonthCellDetails details) {
              final DateTime date = details.date;
              final bool isToday = DateTime
                  .now()
                  .day == date.day && DateTime
                  .now()
                  .month == date.month && DateTime
                  .now()
                  .year == date.year;
              final bool isWeekend = date.weekday == DateTime.friday ||
                  date.weekday == DateTime.saturday;
              return buildDayCell(isToday, isWeekend, date);
            },
            monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
              showAgenda: true,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },

  );
  log(selectedDate?.month.toString()??'no data');
  return selectedDate;
}

Container buildDayCell(bool isToday, bool isWeekend, DateTime date) {
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(2),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: isToday
          ? Colors.grey[200]
          : isWeekend
          ? Colors.grey
          : Colors.black,
    ),
    child: Text(
      date.day.toString(),
      style: TextStyle(
        color: isToday
            ? Colors.black
            : isWeekend
            ? Colors.white
            : Colors.white,
      ),
    ),
  );
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}