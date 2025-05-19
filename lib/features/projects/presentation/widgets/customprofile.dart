import 'package:flutter/material.dart';

class Customprofile extends StatelessWidget {
  final String image;
  const Customprofile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
    );
  }
}
