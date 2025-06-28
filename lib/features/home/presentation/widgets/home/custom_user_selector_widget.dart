import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/core/widgets/buttons/gradient_outline_button.dart';
import 'package:two_mobile/features/home/presentation/widgets/calendar/custom_border_painter.dart';

class User {
  final String name;
  final String role;
  final String image;

  User({required this.name, required this.role, required this.image});
}

class UserSelectorWidget extends StatefulWidget {
  final List<User> selectedUsers;
  final Function(List<User>) onUsersSelected;

  const UserSelectorWidget({
    super.key,
    required this.selectedUsers,
    required this.onUsersSelected,
  });

  @override
  State<UserSelectorWidget> createState() => UserSelectorWidgetState();
}

class UserSelectorWidgetState extends State<UserSelectorWidget> {
  List<User> availableUsers = [
    User(
        name: 'Hala Kadour',
        role: 'Flutter Developer',
        image: 'assets/images/png/image 1.png'),
    User(
        name: 'Lilian Hourani',
        role: 'UI/UX Designer',
        image: 'assets/images/png/image 2.png'),
    User(
        name: 'Ruha jaghal',
        role: 'Backend Developer',
        image: 'assets/images/png/image 3.png'),
    User(
        name: 'Laila Mohammad',
        role: 'Flutter Developer',
        image: 'assets/images/png/image 1.png'),
    User(
        name: 'Lilian Hourani',
        role: 'UI/UX Designer',
        image: 'assets/images/png/image 2.png'),
    User(
        name: 'Ruha jaghal',
        role: 'Backend Developer',
        image: 'assets/images/png/image 3.png'),
  ];

  late List<User> selected;

  @override
  void initState() {
    super.initState();
    selected = List.from(widget.selectedUsers);
  }

  void _removeUser(int index) {
    setState(() {
      selected.removeAt(index);
    });
    widget.onUsersSelected(selected);
  }

  void openBottomSheet() {
    List<User> tempSelected = List.from(selected);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: PaddingConfig.pagePadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PaddingConfig.h16,
                  Text('Select Team Members', style: AppTextStyle.heading04()),
                  PaddingConfig.h24,
                  Expanded(
                    child: ListView.builder(
                      itemCount: availableUsers.length,
                      itemBuilder: (context, index) {
                        final user = availableUsers[index];
                        final isSelected = tempSelected.contains(user);
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.6),
                                width: 1.5),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: CheckboxListTile(
                            value: isSelected,
                            onChanged: (val) {
                              setModalState(() {
                                if (val == true) {
                                  tempSelected.add(user);
                                } else {
                                  tempSelected.remove(user);
                                }
                              });
                            },
                            controlAffinity: ListTileControlAffinity.trailing,
                            activeColor: AppColors.maingreen,
                            checkColor: AppColors.cardColor,
                            title: Text(user.name,
                                style: AppTextStyle.subtitle02()),
                            subtitle: Text(
                              user.role,
                              style: AppTextStyle.subtitle03(
                                  color: AppColors.fontLightColor),
                            ),
                            secondary: CircleAvatar(
                              maxRadius: 26,
                              backgroundImage: AssetImage(user.image),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  GradientOutlineButton(
                    onpressed: () {
                      setState(() {
                        selected = tempSelected;
                      });
                      widget.onUsersSelected(selected);
                      Navigator.pop(context);
                    },
                    text: 'Confirm Selection',
                    textColor: AppColors.cardColor,
                    buttonColor: AppColors.buttonColor,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (selected.isEmpty) {
      return Center(
        child: CustomBorderPainter(
          onTap: openBottomSheet,
          text: 'Add Team',
        ),
      );
    } else {
      return Column(
        children: selected
            .asMap()
            .entries
            .map(
              (entry) => ListTile(
                leading: CircleAvatar(
                  maxRadius: 28,
                  backgroundImage: AssetImage(entry.value.image),
                ),
                title: Text(
                  entry.value.name,
                  style: AppTextStyle.subtitle02(),
                ),
                subtitle: Text(entry.value.role,
                    style: AppTextStyle.subtitle03(
                        color: AppColors.fontLightColor)),
                trailing: IconButton(
                  icon: const Icon(
                    Iconsax.trash,
                    color: Colors.red,
                    size: 24,
                  ),
                  onPressed: () => _removeUser(entry.key),
                ),
              ),
            )
            .toList(),
      );
    }
  }
}
