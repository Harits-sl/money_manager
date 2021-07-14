import 'package:flutter/material.dart';
import 'package:money_manager/theme.dart';

class HistoryList extends StatelessWidget {
  final bool isIncome;
  final String title;
  final String dateTransaction;
  final int cash;

  String? urlImage;
  String? operator;

  formatTransaction(isIncome) {
    if (!isIncome) {
      urlImage = 'assets/img/down.png';
      operator = '-';
      return;
    }

    urlImage = 'assets/img/up.png';
    operator = '+';
    return;
  }

  HistoryList(
      {required this.isIncome,
      required this.title,
      required this.dateTransaction,
      required this.cash});

  @override
  Widget build(BuildContext context) {
    formatTransaction(isIncome);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          urlImage!,
          width: 30,
        ),
        SizedBox(width: 15),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: darkBlueTextStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                dateTransaction,
                style: greyTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Text(
          '$operator $cash',
          style: darkBlueTextStyle.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
