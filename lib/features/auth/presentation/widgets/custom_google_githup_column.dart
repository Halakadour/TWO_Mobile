import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custom_google_githup_button.dart';
import 'package:two_mobile/features/auth/presentation/widgets/divider.dart';

class CustomGoogleGitHupColumn extends StatelessWidget {
  const CustomGoogleGitHupColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const widgetDivider(),
        PaddingConfig.h24,
        CustomGoogleGithupButton(
            image: ImagesPath.google,
            text: 'Continue With Google',
            onpressed: () {}),
        PaddingConfig.h16,
        CustomGoogleGithupButton(
            image: ImagesPath.githup,
            text: 'Continue With GitHub',
            onpressed: () {}),
      ],
    );
  }
}
