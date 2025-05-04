import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class DateStripCalendar extends StatelessWidget {
  const DateStripCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: SfCalendar(
        view: CalendarView.week,
        todayHighlightColor: Colors.green,
        headerStyle: const CalendarHeaderStyle(
            backgroundColor: AppColors.cardColor,
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center // Hide default header
            ),
        headerDateFormat: ('MMMM d,y'),
        timeSlotViewSettings: const TimeSlotViewSettings(
          numberOfDaysInView: 5,
          dayFormat: 'EEE',
        ),
      ),
    );
  }
}
