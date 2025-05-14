import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final PageController _controller = PageController();
  final ValueNotifier<int> _pageNotifier = ValueNotifier<int>(0);

  final List<Map<String, String>> onboardingItems = [
    {
      'image': 'assets/animation/onboard 1.json',
      'title': 'Organize Your Tasks &\nProjects Easily.',
      'description':
          'Organize your projects with ease\nTrack tasks, deadlines, and progress in one place.'
    },
    {
      'image': 'assets/animation/onboard 2.json',
      'title': 'Always Connnect With &\nYour Team Anywhere',
      'description':
          'Collaborate seamlessly with your team\nShare updates, assign roles, and stay aligned.'
    },
    {
      'image': 'assets/animation/onboard 3.json',
      'title': 'Mange Your Time\nTasks & Projects',
      'description':
          'Turn plans into action, effortlessly\nYour productivity companion starts here.'
    },
  ];

  void _goToNextPage() {
    final isLastPage = _pageNotifier.value == onboardingItems.length - 1;

    if (isLastPage) {
      context.pushReplacementNamed(AppRouteConfig.signup);
    } else {
      _controller.nextPage(
          duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
    }
  }

  void _skip() {
    context.pushReplacementNamed(AppRouteConfig.signup);
  }

  @override
  void dispose() {
    _controller.dispose();
    _pageNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<int>(
        valueListenable: _pageNotifier,
        builder: (context, currentPage, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: onboardingItems.length,
                    onPageChanged: (index) => _pageNotifier.value = index,
                    itemBuilder: (_, index) {
                      final item = onboardingItems[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            item['image']!,
                            height: 300,
                            width: 350,
                          ),
                          PaddingConfig.h24,
                          Text(
                            item['title']!,
                            style: AppTextStyle.heading02(),
                            textAlign: TextAlign.center,
                          ),
                          PaddingConfig.h24,
                          Text(
                            item['description']!,
                            style: AppTextStyle.subtitle01(
                                color: AppColors.fontLightColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                GradientOutlineButton(
                  buttonColor: AppColors.buttonColor,
                  text: 'Next',
                  onpressed: () {
                    _goToNextPage();
                  },
                  textColor: AppColors.cardColor,
                ),
                PaddingConfig.h16,
                GradientOutlineButton(
                  buttonColor: AppColors.buttonColor2,
                  text: 'Skip',
                  onpressed: () {
                    _skip();
                  },
                  textColor: AppColors.greenColor,
                ),
                PaddingConfig.h40,
              ],
            ),
          );
        },
      ),
    );
  }
}
