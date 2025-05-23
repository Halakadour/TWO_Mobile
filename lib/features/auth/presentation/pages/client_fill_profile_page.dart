// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/paths/text_strings.dart';
import 'package:two_mobile/features/auth/presentation/widgets/client_profile_form.dart';
import 'package:two_mobile/features/home/presentation/widgets/customiconback.dart';

class ClientFillProfilePage extends StatefulWidget {
  const ClientFillProfilePage({super.key});

  @override
  State<ClientFillProfilePage> createState() => _ClientFillProfilePageState();
}

class _ClientFillProfilePageState extends State<ClientFillProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: PaddingConfig.pagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Customiconback(
                  onpressed: () {
                    context.pop();
                  },
                  text: TextStrings.fillProfile),
              PaddingConfig.h72,
              ClientProfileForm()
            ],
          ),
        ),
      ),
    );
  }
}
