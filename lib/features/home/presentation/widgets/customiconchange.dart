import 'package:flutter/material.dart';
import 'package:two_mobile/features/home/presentation/widgets/custombubblepainter.dart';

class CustomIconChange extends StatefulWidget {
  const CustomIconChange({super.key});

  @override
  State<CustomIconChange> createState() => _CustomIconChangeState();
}

class _CustomIconChangeState extends State<CustomIconChange> {
  bool isDialogOpen = false;
  IconData currentIcon = Icons.add;
  void _handlecontainerTap() async {
    if (!isDialogOpen) {
      setState(() {
        isDialogOpen = true;
        currentIcon = Icons.close;
      });
      await showDialog(
        context: context,
        builder: (context) {
          return const CustomBubblePainter();
        },
      );
      setState(() {
        isDialogOpen = false;
        currentIcon = Icons.add;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handlecontainerTap,
      child: Icon(
        currentIcon,
        size: 35,
        color: Colors.white,
      ),
    );
  }
}
