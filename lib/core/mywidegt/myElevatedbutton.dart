// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyElevatedButton extends StatelessWidget {
  String title;
  Function ontap;
  Color colorbutton;
  Color colortext;
  MyElevatedButton(
      {super.key,
      required this.ontap,
      required this.colorbutton,
      required this.colortext,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorbutton,
        fixedSize: const Size(1200, 50),
      ),
      child: Text(
        title,
        style: TextStyle(color: colortext),
      ),
    );
  }
}
