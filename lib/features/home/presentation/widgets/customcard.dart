// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:two_mobile/features/home/presentation/widgets/customcountainercard.dart';

class Customcard extends StatefulWidget {
  const Customcard({super.key});

  @override
  State<Customcard> createState() => _CustomcardState();
}

class _CustomcardState extends State<Customcard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 202, left: 20),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: SingleChildScrollView(
              child: CustomContainerCard(
            Datetext: 'Dec 20-2024',
            Nametext: 'Hala Kadour',
            Titletext: 'Building meat & milk shop ecommerce website',
            containertext: '2 days left',
            image: 'assets/images/png/Rectangle.png',
          ))),
    );
  }
}
