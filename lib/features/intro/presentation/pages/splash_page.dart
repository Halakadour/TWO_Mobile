import 'package:flutter/material.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/features/intro/presentation/pages/onboardpage1.dart';

//import '../../../../config/routes/app_route_config.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return const OnboardPage1();
          },
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(ImagesPath.splashimagepath),
    );
  }
}
