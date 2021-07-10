import 'package:flutter/material.dart';
import 'package:money_manager/theme.dart';

class History extends StatelessWidget {
  final bool? isIncome;
  final String? title;
  final String? date;
  final int? money;

  String? urlImage;
  String? operator;

  formatTransaction(income) {
    if (!income) {
      urlImage = 'assets/img/down.png';
      operator = '-';
      return;
    }

    urlImage = 'assets/img/up.png';
    operator = '+';

    return;
  }

  History({this.isIncome, this.title, this.date, this.money});

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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: darkBlueTextStyle.copyWith(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              date!,
              style: greyTextStyle.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(width: 100),
        Text(
          '$operator ${money!.toString()}',
          style: darkBlueTextStyle.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
