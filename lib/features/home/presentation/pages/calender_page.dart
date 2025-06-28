import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/widgets/calendar/custom_calendar.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_back_icon_with_text.dart';
import 'package:two_mobile/features/home/presentation/widgets/calendar/custom_calendar_item_list.dart';
import 'package:two_mobile/features/home/presentation/widgets/calendar/custom_tab_for_calendar.dart';
import 'package:two_mobile/features/home/presentation/widgets/calendar/custom_traingle_painter.dart';

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
            const Padding(
              padding: PaddingConfig.pagePadding,
              child: CustomBackIconWithText(text: 'Today tasks'),
            ),
            const CustomTab(),
            const SizedBox(height: 10),
            Expanded(
                child: TabBarView(children: [
              const CustomCalendar(),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    const CustomCalendarItemList(
                        starttime: '09:10 AM',
                        endtime: '10:00 AM',
                        titletext: 'create leading page',
                        statusetext: 'complete',
                        proipritytext: 'Low',
                        timetext: 'Now',
                        titlecolor: AppColors.greenColor,
                        proiperitycolor: AppColors.mainblue),
                    const SizedBox(height: 10),
                    const CustomCalendarItemList(
                        starttime: '11:00 AM',
                        endtime: '12:00 AM',
                        titletext: 'design wireframe kit',
                        statusetext: 'Canceled',
                        proipritytext: 'Medium',
                        timetext: '1 hour',
                        titlecolor: AppColors.redColor,
                        proiperitycolor: AppColors.mainyallow),
                    const SizedBox(height: 5),
                    CustomPaint(
                      size: const Size(370, 20),
                      painter: TriangleWithLinePainter(),
                    ),
                    const SizedBox(height: 5),
                    const CustomCalendarItemList(
                        starttime: '02:00 PM',
                        endtime: '04:50 PM',
                        titletext: 'team meeting',
                        statusetext: 'In progress',
                        proipritytext: 'High',
                        timetext: '6 hour',
                        titlecolor: AppColors.blueColor,
                        proiperitycolor: AppColors.redColor),
                    const SizedBox(height: 10),
                    const CustomCalendarItemList(
                        starttime: '05: 00 PM',
                        endtime: '08:40 PM',
                        titletext: 'coding the home page',
                        statusetext: 'In progress',
                        proipritytext: 'Medium',
                        timetext: 'Now',
                        titlecolor: AppColors.blueColor,
                        proiperitycolor: AppColors.mainyallow),
                    const SizedBox(height: 10),
                    const CustomCalendarItemList(
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
