import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:two_mobile/config/theme/color.dart';

class CustomMeetingCalendar extends StatefulWidget {
  final Function(DateTime, DateTime) onDaySelected;
  final DateTime focusedDay;
  final DateTime? selectedDay;

  const CustomMeetingCalendar({
    super.key,
    required this.onDaySelected,
    required this.focusedDay,
    this.selectedDay,
  });

  @override
  State<CustomMeetingCalendar> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CustomMeetingCalendar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: widget.focusedDay,
        selectedDayPredicate: (day) => isSameDay(widget.selectedDay, day),
        onDaySelected: widget.onDaySelected,
        calendarFormat: CalendarFormat.month,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.navColor,
          ),
          leftChevronIcon: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.chevron_left, color: AppColors.navColor),
          ),
          rightChevronIcon: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.chevron_right, color: AppColors.navColor),
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.grey.shade600),
          weekendStyle: TextStyle(color: Colors.grey.shade600),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
              color: AppColors.navyColor,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.Lightblue)),
          selectedDecoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.Lightgreencolor)),
          selectedTextStyle: const TextStyle(color: Colors.white),
          todayTextStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
