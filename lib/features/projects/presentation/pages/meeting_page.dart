// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/projects/presentation/pages/add_meeting_page.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custommeetingbutton.dart';
import 'package:two_mobile/features/projects/presentation/widgets/custommeetingcalendar.dart';
import 'package:two_mobile/features/projects/presentation/widgets/meetingbottomsheet.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  OverlayEntry? overlayEntry;
  bool isBottomSheetOpen = false;

  void showAddButtonOverlay() {
    removeOverlay();

    overlayEntry = OverlayEntry(
      builder: (context) => CustomMeetingButton(
        onPressed: () {
          removeOverlay();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddMeetingPage(),
            ),
          ).then((_) {
            if (isBottomSheetOpen && selectedDay != null) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => MeetingBottomSheet(selectedDay: selectedDay!),
              ).whenComplete(() {
                isBottomSheetOpen = false;
                removeOverlay();
              });
            }
          });
        },
      ),
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  void removeOverlay() {
    overlayEntry?.remove();
    overlayEntry = null;
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: AppBar(
        backgroundColor: AppColors.navColor,
        toolbarHeight: 90,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 20),
          child: IconButton(
            onPressed: () {
              context.pushNamed(AppRouteConfig.sprintDetailes);
            },
            icon: Icon(
              Iconsax.arrow_left,
              size: 30,
              color: AppColors.cardColor,
            ),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            'Meeting Schedule',
            style: AppTextStyle.heading03(color: AppColors.cardColor),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomMeetingCalendar(
              onDaySelected: (day, focusedDay) {
                setState(() {
                  selectedDay = day;
                  this.focusedDay = focusedDay;
                });

                isBottomSheetOpen = true;
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => MeetingBottomSheet(selectedDay: selectedDay!),
                ).whenComplete(() {
                  isBottomSheetOpen = false;
                  removeOverlay();
                });

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showAddButtonOverlay();
                });
              },
              focusedDay: focusedDay,
              selectedDay: selectedDay,
            ),
          ),
        ],
      ),
    );
  }
}
