// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/pages/todattask_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcalendar.dart';
import 'package:two_mobile/features/home/presentation/widgets/customdatecalender.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';
import 'package:two_mobile/features/home/presentation/widgets/customlist.dart';
import 'package:two_mobile/features/home/presentation/widgets/customtab.dart';
import 'package:two_mobile/features/home/presentation/widgets/customtrainglepainter.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.cardColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 10, right: 20, bottom: 10),
              child: Customiconback(
                  Onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodayTaskPage()));
                  },
                  text: 'Today tasks'),
            ),
            DateStripCalendar(),
            Customtab(),
            Expanded(
                child: TabBarView(children: [
              CustomCalendar(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  children: [
                    Customlist(
                        Starttime: '09:10 AM',
                        Endtime: '10:00 AM',
                        Titletext: 'create leading page',
                        Statusetext: 'complete',
                        Proipritytext: 'Low',
                        Timetext: 'Now',
                        Titlecolor: AppColors.greenColor,
                        Proiperitycolor: AppColors.mainblue),
                    SizedBox(height: 10),
                    Customlist(
                        Starttime: '11:00 AM',
                        Endtime: '12:00 AM',
                        Titletext: 'design wireframe kit',
                        Statusetext: 'Canceled',
                        Proipritytext: 'Medium',
                        Timetext: '1 hour',
                        Titlecolor: AppColors.redColor,
                        Proiperitycolor: AppColors.mainyallow),
                    SizedBox(height: 5),
                    CustomPaint(
                      size: Size(370, 20),
                      painter: TriangleWithLinePainter(),
                    ),
                    SizedBox(height: 5),
                    Customlist(
                        Starttime: '02:00 PM',
                        Endtime: '04:50 PM',
                        Titletext: 'team meeting',
                        Statusetext: 'In progress',
                        Proipritytext: 'High',
                        Timetext: '6 hour',
                        Titlecolor: AppColors.blueColor,
                        Proiperitycolor: AppColors.redColor),
                    SizedBox(height: 10),
                    Customlist(
                        Starttime: '05: 00 PM',
                        Endtime: '08:40 PM',
                        Titletext: 'coding the home page',
                        Statusetext: 'In progress',
                        Proipritytext: 'Medium',
                        Timetext: 'Now',
                        Titlecolor: AppColors.blueColor,
                        Proiperitycolor: AppColors.mainyallow),
                  ],
                ),
              )
            ]))
          ],
        ),
      ),
    );
  }
}
