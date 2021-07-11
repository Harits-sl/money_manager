import 'package:flutter/material.dart';
import 'package:money_manager/theme.dart';

class History extends StatelessWidget {
  final bool isSpending;
  final String title;
  final String dateTransaction;
  final int cash;

  String? urlImage;
  String? operator;

  formatTransaction(isSpending) {
    if (isSpending) {
      urlImage = 'assets/img/down.png';
      operator = '-';
      return;
    }

    urlImage = 'assets/img/up.png';
    operator = '+';
    return;
  }

  History(
      {required this.isSpending,
      required this.title,
      required this.dateTransaction,
      required this.cash});

  @override
  Widget build(BuildContext context) {
    formatTransaction(isSpending);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          urlImage!,
          width: 30,
        ),
        Column(
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
        SizedBox(width: 100),
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
