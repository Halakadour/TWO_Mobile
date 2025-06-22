// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/pages/today_task_page.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcalendar.dart';
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
              padding: PaddingConfig.pagePadding,
              child: Customiconback(
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodayTaskPage()));
                  },
                  text: 'Today tasks'),
            ),
            Customtab(),
            SizedBox(height: 10),
            Expanded(
                child: TabBarView(children: [
              CustomCalendar(),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Customlist(
                        starttime: '09:10 AM',
                        endtime: '10:00 AM',
                        titletext: 'create leading page',
                        statusetext: 'complete',
                        proipritytext: 'Low',
                        timetext: 'Now',
                        titlecolor: AppColors.greenColor,
                        proiperitycolor: AppColors.mainblue),
                    SizedBox(height: 10),
                    Customlist(
                        starttime: '11:00 AM',
                        endtime: '12:00 AM',
                        titletext: 'design wireframe kit',
                        statusetext: 'Canceled',
                        proipritytext: 'Medium',
                        timetext: '1 hour',
                        titlecolor: AppColors.redColor,
                        proiperitycolor: AppColors.mainyallow),
                    SizedBox(height: 5),
                    CustomPaint(
                      size: Size(370, 20),
                      painter: TriangleWithLinePainter(),
                    ),
                    SizedBox(height: 5),
                    Customlist(
                        starttime: '02:00 PM',
                        endtime: '04:50 PM',
                        titletext: 'team meeting',
                        statusetext: 'In progress',
                        proipritytext: 'High',
                        timetext: '6 hour',
                        titlecolor: AppColors.blueColor,
                        proiperitycolor: AppColors.redColor),
                    SizedBox(height: 10),
                    Customlist(
                        starttime: '05: 00 PM',
                        endtime: '08:40 PM',
                        titletext: 'coding the home page',
                        statusetext: 'In progress',
                        proipritytext: 'Medium',
                        timetext: 'Now',
                        titlecolor: AppColors.blueColor,
                        proiperitycolor: AppColors.mainyallow),
                    SizedBox(height: 10),
                    Customlist(
                        starttime: '09:10 AM',
                        endtime: '10:00 AM',
                        titletext: 'create leading page',
                        statusetext: 'complete',
                        proipritytext: 'Low',
                        timetext: 'Now',
                        titlecolor: AppColors.greenColor,
                        proiperitycolor: AppColors.mainblue),
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
