import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcard.dart';
import 'package:two_mobile/features/home/presentation/widgets/custom_home_header.dart';
import 'package:two_mobile/features/home/presentation/widgets/textbutton.dart';
import 'package:two_mobile/features/home/presentation/widgets/taskitem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Column(
              children: [
                const CustomHomeHeader(),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: AppColors.cardColor,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 80, left: 30, right: 23),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Today task',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  TextButtonPage(onpressed: () {
                                    context.pushNamed(AppRouteConfig.toDayTask);
                                  })
                                ],
                              ),
                              TodayTask(
                                textcolor: AppColors.mainblue,
                                title: 'create leading page',
                                priority: 'Low',
                                time: '10: 00 am - 10: 30 am',
                                status: 'completed',
                                priopritycolor: AppColors.mainblue,
                                statuscolor: AppColors.mainColor,
                                iconcolor: AppColors.mainblue,
                              ),
                              TodayTask(
                                textcolor: AppColors.mainyallow,
                                title: ' design wireframe kit',
                                priority: 'Medium',
                                time: '11: 00 am - 12: 00 am',
                                status: 'canceled',
                                priopritycolor: AppColors.mainyallow,
                                statuscolor: AppColors.redColor,
                                iconcolor: AppColors.mainyallow,
                              ),
                              TodayTask(
                                textcolor: AppColors.redColor,
                                title: 'team meeting',
                                priority: 'High',
                                time: '02: 00 pm - 04: 50 pm',
                                status: 'in progress',
                                priopritycolor: AppColors.redColor,
                                statuscolor: AppColors.mainblue,
                                iconcolor: AppColors.redColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            ),
            const Customcard(),
          ],
        ));
  }
}
