import 'package:flutter/material.dart';
import 'package:money_manager/theme.dart';
import 'package:money_manager/widgets/History.dart';
import 'package:money_manager/widgets/finance.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
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
                      padding: const EdgeInsets.only(top: 25, left: 20),
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
                          SizedBox(height: 18),
                          Finance(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Transaction History',
                  style: darkBlueTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 32),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    History(
                        isIncome: true,
                        title: 'Success!',
                        date: 'February 20, 02:45 PM',
                        money: 100000),
                    SizedBox(height: 15),
                    History(
                        isIncome: true,
                        title: 'Success!',
                        date: 'February 20, 02:45 PM',
                        money: 100000),
                    SizedBox(height: 15),
                    History(
                        isIncome: false,
                        title: 'Buy drink',
                        date: 'February 20, 02:45 PM',
                        money: 50000),
                    SizedBox(height: 15),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset(0.0, 0.9),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(redColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(140, 46)),
                          ),
                          onPressed: () {
                            buildShowModalBottomSheet(context);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/img/spending.png',
                                width: 23,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Spending',
                                style: darkBlueTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(greenColor),
                            minimumSize:
                                MaterialStateProperty.all(Size(140, 46)),
                          ),
                          onPressed: () {
                            buildShowModalBottomSheet(context);
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/img/income.png',
                                width: 23,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Income',
                                style: darkBlueTextStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Add Transaction',
                  style: darkBlueTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your transaction',
                  hintText: 'Order a food',
                ),
              ),
              SizedBox(height: 20),
              // TODO: change label text and hint text
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your transaction',
                  hintText: 'Order a food',
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset(0.0, 0.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(140, 46),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: darkBlueTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            blueColor,
                          ),
                          minimumSize: MaterialStateProperty.all(
                            Size(140, 46),
                          ),
                        ),
                        child: Text(
                          'Confirm',
                          style: whiteTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
