import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';

class Meeting {
  String title;
  Color descriptioncolor;
  String description;
  DateTime startTime;
  DateTime endTime;
  Color color;
  Meeting({
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.descriptioncolor,
  });
}

List<Meeting> getAppointments() {
  return [
    Meeting(
      descriptioncolor: AppColors.blueColor,
      title: 'create loading ..',
      description: 'Low',
      startTime: DateTime(2025, 2, 18, 9, 0),
      endTime: DateTime(2025, 2, 18, 10, 0),
      color: const Color.fromARGB(187, 178, 241, 200),
    ),
    Meeting(
      descriptioncolor: AppColors.mainyallow,
      title: 'design wirefra..',
      description: 'Medium',
      startTime: DateTime(2025, 2, 18, 10, 0),
      endTime: DateTime(2025, 2, 18, 11, 0),
      color: const Color.fromARGB(255, 246, 176, 235),
    ),
    Meeting(
      descriptioncolor: AppColors.redColor,
      title: 'team meeting',
      description: 'High',
      startTime: DateTime(2025, 2, 18, 11, 0),
      endTime: DateTime(2025, 2, 18, 12, 0),
      color: const Color.fromARGB(255, 169, 203, 231),
    ),
    Meeting(
      descriptioncolor: AppColors.mainyallow,
      title: 'coding the home page.',
      description: 'Medium',
      startTime: DateTime(2025, 2, 18, 12, 0),
      endTime: DateTime(2025, 2, 18, 15, 0),
      color: const Color.fromARGB(255, 247, 223, 190),
    ),
    Meeting(
      descriptioncolor: AppColors.redColor,
      title: 'API testing',
      description: 'High',
      startTime: DateTime(2025, 2, 19, 9, 0),
      endTime: DateTime(2025, 2, 19, 11, 0),
      color: const Color.fromARGB(255, 169, 203, 231),
    ),
    Meeting(
      descriptioncolor: AppColors.blueColor,
      title: 'report 20',
      description: 'Low',
      startTime: DateTime(2025, 2, 19, 11, 0),
      endTime: DateTime(2025, 2, 19, 12, 0),
      color: const Color.fromARGB(187, 178, 241, 200),
    ),
    Meeting(
      descriptioncolor: AppColors.mainyallow,
      title: 'test studying',
      description: 'Medium',
      startTime: DateTime(2025, 2, 20, 10, 0),
      endTime: DateTime(2025, 2, 20, 11, 0),
      color: const Color.fromARGB(255, 247, 223, 190),
    ),
    Meeting(
      descriptioncolor: AppColors.blueColor,
      title: 'code splash ..',
      description: 'Low',
      startTime: DateTime(2025, 2, 21, 9, 20),
      endTime: DateTime(2025, 2, 21, 11, 0),
      color: const Color.fromARGB(187, 178, 241, 200),
    ),
    Meeting(
      descriptioncolor: AppColors.blueColor,
      title: 'testing',
      description: 'Low',
      startTime: DateTime(2025, 2, 22, 9, 0),
      endTime: DateTime(2025, 2, 22, 10, 0),
      color: const Color.fromARGB(187, 178, 241, 200),
    ),
    Meeting(
      descriptioncolor: AppColors.mainyallow,
      title: 'UI design',
      description: 'Medium',
      startTime: DateTime(2025, 2, 22, 10, 0),
      endTime: DateTime(2025, 2, 22, 11, 0),
      color: const Color.fromARGB(255, 246, 176, 235),
    ),
  ];
}
