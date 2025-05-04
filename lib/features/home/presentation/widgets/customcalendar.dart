import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/home/presentation/widgets/meeting_data.dart';

class CustomCalendar extends StatelessWidget {
  const CustomCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ClipRect(
        child: Transform.translate(
          offset: Offset(0, -20),
          child: SfCalendar(
              view: CalendarView.week,
              showDatePickerButton: false,
              headerHeight: 0,
              initialDisplayDate: DateTime(2025, 2, 18),
              initialSelectedDate: DateTime(2025, 2, 18),
              dataSource: MeetingDataSource(getAppointments()),
              headerStyle: const CalendarHeaderStyle(
                  backgroundColor: Colors.transparent,
                  textStyle: TextStyle(fontSize: 0),
                  textAlign: TextAlign.center // Hide default header
                  ),
              timeSlotViewSettings: const TimeSlotViewSettings(
                  timeRulerSize: 35,
                  timeInterval: Duration(hours: 1),
                  timeFormat: 'h\na',
                  dateFormat: '',
                  dayFormat: '',
                  numberOfDaysInView: 5,
                  startHour: 9,
                  endHour: 18,
                  timeIntervalHeight: 70,
                  timeTextStyle: TextStyle(fontSize: 11)),
              appointmentBuilder: (context, details) {
                final Meeting meeting = details.appointments.first;
                return Container(
                  margin: EdgeInsets.all(1),
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: meeting.color,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meeting.title,
                          style: AppTextStyle.subtitle03(
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          meeting.description,
                          style: AppTextStyle.subtitle04(
                              color: meeting.descriptioncolor),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource<Meeting> {
  MeetingDataSource(List<Meeting> meetings) {
    appointments = meetings;
  }

  DateTime getStartTime(int index) => appointments![index].startTime;
  DateTime getEndTime(int index) => appointments![index].endTime;
  String getSubject(int index) => appointments![index].title;
  Color getColor(int index) => appointments![index].color;
}
