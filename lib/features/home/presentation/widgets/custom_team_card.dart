import 'package:flutter/material.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/team/data/model/team_model.dart';

class CustomTeamCard extends StatefulWidget {
  const CustomTeamCard({super.key, required this.team});
  final TeamModel team;

  @override
  State<CustomTeamCard> createState() => _CustomTeamCardState();
}

class _CustomTeamCardState extends State<CustomTeamCard> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.team.name,
                style: AppTextStyle.subtitle02(),
              ),
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
                      style: AppTextStyle.subtitle02(
                        color: isPressed
                            ? AppColors.maingreen
                            : AppColors.cardColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          PaddingConfig.h16,
          Wrap(
            children: List.generate(
              widget.team.members.length,
              (index) => Column(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget
                                    .team.members[index].image ??
                                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fdesignbundles.net%2Fkant-store%2F989793-image-pictures-icon-image-gallery-icon-symbol-phot&psig=AOvVaw2j5WjulTYioMo4xRsq1u3i&ust=1750645140956000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMC76sn7g44DFQAAAAAdAAAAABAE'))),
                  ),
                  PaddingConfig.h8,
                  Text(
                    widget.team.members[index].role,
                    style: AppTextStyle.subtitle04(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
