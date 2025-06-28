import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/role/data/models/employee_model.dart';

class SelectedMembersChipCard extends StatefulWidget {
  const SelectedMembersChipCard(
      {super.key,
      required this.selectedMembersNotifier,
      required this.onUpdate});
  final ValueNotifier<List<EmployeeModel>> selectedMembersNotifier;
  final Function(List<EmployeeModel>) onUpdate;

  @override
  State<SelectedMembersChipCard> createState() =>
      _SelectedMembersChipCardState();
}

class _SelectedMembersChipCardState extends State<SelectedMembersChipCard> {
  void onRemoveMember(EmployeeModel emp) {
    final current = widget.selectedMembersNotifier.value;
    widget.selectedMembersNotifier.value =
        current.where((e) => e != emp).toList();
    widget.onUpdate(current);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<EmployeeModel>>(
      valueListenable: widget.selectedMembersNotifier,
      builder: (context, selectedMembers, _) {
        if (selectedMembers.isEmpty) return const SizedBox();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 225),
              child: Text('Selected Members', style: AppTextStyle.subtitle01()),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: selectedMembers.map((emp) {
                return Chip(
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(emp.name, style: AppTextStyle.subtitle03()),
                      Text(
                        emp.role,
                        style: AppTextStyle.subtitle04(
                            color: AppColors.fontLightColor),
                      ),
                    ],
                  ),
                  onDeleted: () => onRemoveMember(emp),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
