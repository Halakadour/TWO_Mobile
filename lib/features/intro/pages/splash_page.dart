import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/core/services/shared_preferences_services.dart';

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
      () async {
        if (await SharedPreferencesServices.checkIfAuthraized()) {
          context.pushReplacementNamed(AppRouteConfig.main);
        } else {
          context.pushReplacementNamed(AppRouteConfig.onboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(ImagesPath.splash),
    );
  }
}
