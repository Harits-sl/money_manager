import 'package:flutter/material.dart';
import 'package:money_manager/utils/date_format.dart';
import 'package:money_manager/theme.dart';
import 'package:money_manager/utils/parse.dart';
import 'package:money_manager/widgets/history_list.dart';
import 'package:money_manager/widgets/header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variable for textfield
  TextEditingController _transactionController = TextEditingController();
  TextEditingController _cashController = TextEditingController();

  List<dynamic> _historyList = [];

  // variable for send to historyList
  int _spending = 0;
  int _income = 0;
  int _cash = 0;
  String _title = '';
  String _dateTransaction = dateFormat();

  // method for modal
  void closeModal() {
    _transactionController.clear();
    _cashController.clear();
    Navigator.pop(context);
  }

  void confirmModal(bool _isSpending) {
    setState(() {
      _title = _transactionController.text;
      int cashParse = parseToInt(_cashController.text);

      if (_isSpending) {
        _cash = cashParse;
        _spending += cashParse;
      } else {
        _cash = cashParse;
        _income += cashParse;
      }
    });
    _historyList.add({
      'isSpending': _isSpending,
      'title': _title,
      'dateTransaction': _dateTransaction,
      'cash': _cash,
    });
    closeModal();
  }
  // end method modal

  Flexible buildFlexibleHistory() {
    return Flexible(
      flex: 3,
      fit: FlexFit.tight,
      child: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: _historyList.length,
          itemBuilder: (context, index) {
            var data = _historyList[index];
            return Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: HistoryList(
                isSpending: data['isSpending'],
                title: data['title'],
                dateTransaction: data['dateTransaction'],
                cash: data['cash'],
              ),
            );
          },
        ),
      ),
    );
  }

  Flexible buildFlexibleButton(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Align(
        alignment: FractionalOffset(0.0, 0.5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(redColor),
                  minimumSize: MaterialStateProperty.all(Size(140, 46)),
                ),
                onPressed: () {
                  buildShowModalBottomSheet(context, true);
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
                  backgroundColor: MaterialStateProperty.all(greenColor),
                  minimumSize: MaterialStateProperty.all(Size(140, 46)),
                ),
                onPressed: () {
                  buildShowModalBottomSheet(context, false);
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
    );
  }

  Future<dynamic> buildShowModalBottomSheet(
      BuildContext context, bool _isSpending) {
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
                controller: _transactionController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your transaction',
                  hintText: 'Order a food',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _cashController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your cash',
                  hintText: '120000',
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
                        onPressed: () {
                          closeModal();
                        },
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
                        onPressed: () {
                          confirmModal(_isSpending);
                        },
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 900) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(spending: _spending, income: _income),
                SizedBox(height: 30),
                Center(
                  child: Text(
                    'Transactions History',
                    style: darkBlueTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                buildFlexibleHistory(),
                buildFlexibleButton(context),
              ],
            );
          }
          return GridView.count(
            crossAxisCount: 2,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(spending: _spending, income: _income),
                  SizedBox(height: 30),
                  buildFlexibleButton(context),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 25),
                  Center(
                    child: Text(
                      'Transactions History',
                      style: darkBlueTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  buildFlexibleHistory(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
