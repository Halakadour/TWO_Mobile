import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/routes/app_route_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';

class UserTypeDialog extends StatelessWidget {
  const UserTypeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 470,
        width: 350,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset('assets/images/png/Shield.png', height: 180),
            ),
            Text(
              'Register Done !',
              style: AppTextStyle.heading03(),
            ),
            Text(
              'your account is ready to use',
              style: AppTextStyle.subtitle01(color: AppColors.iconColor),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 250,
              child: GradientOutlineButton(
                onpressed: () {
                  context.pushReplacementNamed(
                      AppRouteConfig.programmerFillProfile);
                },
                text: 'Get as Programmer',
                textColor: AppColors.cardColor,
                buttonColor: AppColors.buttonColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.fieldfield,
                    fixedSize: const Size(250, 50)),
                onPressed: () {
                  context
                      .pushReplacementNamed(AppRouteConfig.clientFillProfile);
                },
                child: Text(
                  'Get as client',
                  style: AppTextStyle.subtitle01(color: AppColors.greenColor),
                ))
          ],
        ),
      ),
    );
  }
}
