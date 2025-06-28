// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:two_mobile/config/constants/padding_config.dart';
import 'package:two_mobile/config/theme/color.dart';
import 'package:two_mobile/config/theme/text_style.dart';

class PaymentTableWithBorders extends StatelessWidget {
  final List<List<String>> data;

  const PaymentTableWithBorders({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(70),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
      border: TableBorder.symmetric(
        inside: const BorderSide(width: 1, color: AppColors.fieldfield),
        outside: BorderSide.none,
      ),
      children: [
        buildHeaderRow(),
        ...data.map((row) => buildDataRow(row)).toList(),
      ],
    );
  }

  TableRow buildHeaderRow() {
    return TableRow(
      decoration: const BoxDecoration(color: AppColors.fontLightColor),
      children: const [
        TableCellHeader('ID'),
        TableCellHeader('Amount'),
        TableCellHeader('Date'),
        TableCellHeader('Status'),
      ],
    );
  }

  TableRow buildDataRow(List<String> rowData) {
    return TableRow(
      children: [
        TableCellData(rowData[0]),
        TableCellData(rowData[1]),
        TableCellData(rowData[2]),
        StatusCell(rowData[3]),
      ],
    );
  }
}

class TableCellHeader extends StatelessWidget {
  final String text;

  const TableCellHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppTextStyle.subtitle02(),
          ),
          PaddingConfig.w4,
          const Icon(Iconsax.arrow_swap, size: 15),
        ],
      ),
    );
  }
}

class TableCellData extends StatelessWidget {
  final String text;

  const TableCellData(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            text,
            style: AppTextStyle.subtitle02(),
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ),
    );
  }
}

class StatusCell extends StatelessWidget {
  final String status;

  const StatusCell(this.status);

  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'success':
        return AppColors.blueColor;
      case 'pending':
        return AppColors.mainyallow;
      case 'failed':
        return AppColors.redColor;
      default:
        return AppColors.fontLightColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: statusColor,
              shape: BoxShape.circle,
            ),
          ),
          PaddingConfig.w8,
          Text(
            status,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
