import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class CustomAdd extends StatefulWidget {
  final String image;
  final String nameText;
  final String titleText;
  const CustomAdd({
    super.key,
    required this.image,
    required this.nameText,
    required this.titleText,
  });

  @override
  State<CustomAdd> createState() => _CustomAddState();
}

class _CustomAddState extends State<CustomAdd> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Image.asset(widget.image),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.nameText,
                  style: AppTextStyle.subtitle02(),
                ),
                Text(
                  widget.titleText,
                  style:
                      AppTextStyle.subtitle03(color: AppColors.fontLightColor),
                ),
              ],
            ),
            const SizedBox(width: 80),
            GestureDetector(
                onTap: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                child: Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                      color:
                          isPressed ? AppColors.cardColor : AppColors.maingreen,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isPressed
                            ? AppColors.maingreen
                            : AppColors.cardColor,
                      )),
                  child: Center(
                    child: Text(
                      isPressed ? 'Added' : 'Add',
                      style: AppTextStyle.subtitle01(
                        color: isPressed
                            ? AppColors.maingreen
                            : AppColors.cardColor,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
