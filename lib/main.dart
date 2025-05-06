import 'package:flutter/material.dart';
import 'package:two_mobile/features/profile/presentation/pages/Programmer_fill_profile_page.dart';
//import 'package:two_mobile/features/profile/presentation/pages/client_profile_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: ProgrammerFillProfilePage()),
    );
  }
}
