import 'package:flutter/material.dart';

import 'package:money_manager/theme.dart';
import 'package:money_manager/widgets/finance_statement.dart';

class Header extends StatelessWidget {
  final int spending;
  final int income;

  const Header({
    required this.spending,
    required this.income,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 215,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome,',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Harits',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                FinanceStatement(spending: spending, income: income),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
