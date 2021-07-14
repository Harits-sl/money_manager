import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_manager/utils/currency.dart';
import 'package:money_manager/utils/date_format.dart';
import 'package:money_manager/theme.dart';
import 'package:money_manager/utils/parse.dart';
import 'package:money_manager/widgets/history_list.dart';
import 'package:money_manager/widgets/header.dart';

class HomePage extends StatefulWidget {
  final String name;

  HomePage({required this.name});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variable for textfield
  TextEditingController _transactionController = TextEditingController();
  TextEditingController _cashController = TextEditingController();

  List<dynamic> _historyList = [];

  // variable for send to historyList
  int _expense = 0;
  int _income = 0;
  int _cash = 0;
  String _title = '';

  final _formKey = GlobalKey<FormState>();

  // validator textfield
  String? validatorTextField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter text';
    }
    return null;
  }

  // method for modal
  void closeModal() {
    _transactionController.clear();
    _cashController.clear();
    Navigator.pop(context);
  }

  void confirmModal(bool _isIncome) {
    setState(() {
      _title = _transactionController.text;
      int cashParse = parseToInt(_cashController.text);

      if (!_isIncome) {
        _cash = cashParse;
        _expense += cashParse;
      } else {
        _cash = cashParse;
        _income += cashParse;
      }
    });
    _historyList.add({
      'isIncome': _isIncome,
      'title': _title,
      'dateTransaction': dateFormat(),
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
          itemCount: _historyList.length,
          itemBuilder: (context, index) {
            var data = _historyList[index];
            return Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
              child: HistoryList(
                isIncome: data['isIncome'],
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
              // button expense
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(redColor),
                  minimumSize: MaterialStateProperty.all(Size(140, 46)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  buildShowModalBottomSheet(context, false);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/img/spending.png',
                      width: 23,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Expense',
                      style: darkBlueTextStyle.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Button income
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(greenColor),
                  minimumSize: MaterialStateProperty.all(Size(140, 46)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  buildShowModalBottomSheet(context, true);
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
      BuildContext context, bool _isIncome) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
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
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _transactionController,
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your transaction',
                          hintText: 'Order a food',
                        ),
                        validator: validatorTextField,
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        controller: _cashController,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter your cash',
                          hintText: '120000',
                        ),
                        validator: validatorTextField,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(140, 46),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: blueColor),
                          ),
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
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
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Success')),
                          );
                          confirmModal(_isIncome);
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(height: 25),
              ],
            ),
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
                Header(name: widget.name, expense: _expense, income: _income),
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
                  Header(
                    name: widget.name,
                    expense: _expense,
                    income: _income,
                  ),
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
