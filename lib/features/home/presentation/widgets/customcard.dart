// ignore_for_file: prefer_const_constructors, deprecated_member_use, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

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
      padding:
          const EdgeInsets.only(top: 202, left: 20, right: 20, bottom: 280),
      child: PageView(
        children: [
          SingleChildScrollView(
            child: CustomContainerCard(
              Datetext: 'Dec 20-2024',
              Nametext: 'Hala Kadour',
              Titletext: 'Building meat & milk shop ecommerce website',
              containertext: '2 days left',
              image: 'assets/images/png/Rectangle.png',
            ),
          ),
          SingleChildScrollView(
            child: CustomContainerCard(
              Datetext: 'Dec 22-2024',
              Nametext: 'Hala Kadour',
              Titletext: 'Building flutter app for math and physics kids',
              containertext: '3 days left',
              image: 'assets/images/png/Rectangle 1.png',
            ),
          ),
          SingleChildScrollView(
            child: CustomContainerCard(
              Datetext: 'Dec 24-2024',
              Nametext: 'Hala Kadour',
              Titletext: 'Building flutter app for math and physics kids',
              containertext: '5 days left',
              image: 'assets/images/png/Rectangle 2.png',
            ),
          ),
        ],
      ),
    );
  }
}
