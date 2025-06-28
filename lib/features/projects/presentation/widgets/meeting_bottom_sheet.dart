// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custom_meeting_card.dart';

class MeetingBottomSheet extends StatelessWidget {
  final DateTime selectedDay;

  const MeetingBottomSheet({
    super.key,
    required this.selectedDay,
  });

  String getMonthName(int monthNumber) {
    const List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[monthNumber - 1];
  }

  String getWeekdayName(int weekday) {
    const List<String> weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return weekdays[weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      child: Container(
        height: 300,
        child: Stack(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.navColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Container(
                width: double.infinity,
                color: AppColors.navColor,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.circle, color: Colors.green, size: 10),
                      const SizedBox(width: 8),
                      Text(
                        '${getWeekdayName(selectedDay.weekday)}, '
                        '${selectedDay.day.toString().padLeft(2, '0')} '
                        '${getMonthName(selectedDay.month)}, ${selectedDay.year}',
                        style:
                            AppTextStyle.subtitle01(color: AppColors.cardColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 45,
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                child: Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Expanded(
                        child: ListView(
                          children: [
                            PaddingConfig.h8,
                            const CustomMeetingCard(
                              title: 'Sales Presentation',
                              time: '11:30 AM - 12:30 PM',
                              description:
                                  'A sales presentation with a potential client...',
                              borderColor: AppColors.blueColor,
                            ),
                            const CustomMeetingCard(
                              title: 'Business Development Discussion',
                              time: '3:00 PM - 4:30 PM',
                              description:
                                  'A discussion on business development strategies...',
                              borderColor: AppColors.redColor,
                            ),
                            const CustomMeetingCard(
                              title: 'Team Collaboration',
                              time: '8:30 PM - 9:30 PM',
                              description:
                                  'A sales presentation with a potential client...',
                              borderColor: AppColors.mainyallow,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
