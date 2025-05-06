import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/paths/assets_path.dart';
import 'package:two_mobile/features/auth/presentation/widgets/custombutton.dart';
import 'package:two_mobile/features/auth/presentation/widgets/divider.dart';

class CustomGoogleGitHupButtons extends StatelessWidget {
  const CustomGoogleGitHupButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const widgetDivider(),
        PaddingConfig.h24,
        CustomButton(
            image: ImagesPath.google,
            text: 'Continue With Google',
            onpressed: () {}),
        PaddingConfig.h16,
        CustomButton(
            image: ImagesPath.githup,
            text: 'Continue With GitHub',
            onpressed: () {}),
      ],
    );
  }
}
