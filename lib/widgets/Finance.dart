import 'package:flutter/material.dart';

import 'package:money_manager/theme.dart';

class Finance extends StatelessWidget {
  final int currentSpending;
  final int currentIncome;

  Finance({
    required this.currentSpending,
    required this.currentIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: 320,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
        boxShadow: [
          BoxShadow(
            color: darkBlueColor.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 1),
          )
        ],
      ),
      child: Column(
        children: [
          Text(
            'Financial Statement',
            style: darkBlueTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Spending',
                    style: darkBlueTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Rp. $currentSpending',
                    style: darkRedTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                height: 52,
                child: VerticalDivider(color: greyColor),
              ),
              Column(
                children: [
                  Text(
                    'Income',
                    style: darkBlueTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Rp. $currentIncome',
                    style: darkGreenTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
