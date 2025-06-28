import 'package:flutter/material.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';
import 'package:two_mobile/features/role/data/models/employee_model.dart';

class SelectedManagerChipCard extends StatefulWidget {
  const SelectedManagerChipCard(
      {super.key, required this.selectedManager, required this.onUpdate});
  final ValueNotifier<EmployeeModel?> selectedManager;
  final Function(EmployeeModel?) onUpdate;

  @override
  State<SelectedManagerChipCard> createState() =>
      _SelectedManagerChipCardState();
}

class _SelectedManagerChipCardState extends State<SelectedManagerChipCard> {
  void onRemoveManager() {
    widget.selectedManager.value = null;
    widget.onUpdate(widget.selectedManager.value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.selectedManager,
      builder: (context, selectedMembers, _) {
        if (selectedMembers == null) return const SizedBox();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 225),
              child: Text('Selected Manager', style: AppTextStyle.subtitle01()),
            ),
            const SizedBox(height: 10),
            Chip(
              label: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.selectedManager.value!.name,
                      style: AppTextStyle.subtitle03()),
                  Text(
                    widget.selectedManager.value!.role,
                    style: AppTextStyle.subtitle04(
                        color: AppColors.fontLightColor),
                  ),
                ],
              ),
              onDeleted: () => onRemoveManager(),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
