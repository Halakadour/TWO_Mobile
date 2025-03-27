import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyElevatedButton extends StatefulWidget {
  String title;
  final Function() ontap;
  Color colorbutton;
  Color colortext;
  MyElevatedButton(
      {super.key,
      required this.ontap,
      required this.colorbutton,
      required this.colortext,
      required this.title});

  @override
  State<MyElevatedButton> createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.ontap,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.colorbutton,
        fixedSize: const Size(1200, 50),
      ),
      child: Text(
        widget.title,
        style: TextStyle(color: widget.colortext),
      ),
    );
  }
}
