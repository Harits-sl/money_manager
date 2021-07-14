import 'package:flutter/material.dart';
import 'package:money_manager/pages/home_page.dart';
import 'package:money_manager/theme.dart';

class SplashPage extends StatelessWidget {
  final TextEditingController _transactionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // validator textfield
  String? validatorTextField(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter text';
    }
    return null;
  }

  Column columnWelcome(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Welcome!',
          style: darkBlueTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'welcome to Fleet Finance, the easy way to improve your finances and help you control expenses and income',
          textAlign: TextAlign.center,
          style: greyTextStyle.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              blueColor,
            ),
            minimumSize: MaterialStateProperty.all(
              Size(153, 50),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: Text(
            'Get Started',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: () {
            buildShowModalBottomSheet(context);
          },
        ),
      ],
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Let’s Sign Your In',
                    style: darkBlueTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _transactionController,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Your Name',
                      hintText: 'Leanne Graham',
                    ),
                    validator: validatorTextField,
                  ),
                ),
                SizedBox(height: 150),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                            _transactionController.clear();
                            Navigator.pop(context);
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(
                                    name: _transactionController.text,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
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
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      'assets/img/landing.png',
                    ),
                  ),
                  SizedBox(height: 43),
                  Flexible(
                    flex: 4,
                    child: Container(
                      color: Color(0xffFFFFFF),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: columnWelcome(context),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          }
          return GridView.count(
            crossAxisCount: 2,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 65),
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 70),
                child: columnWelcome(context),
              ),
              Image.asset(
                'assets/img/landing.png',
              ),
            ],
          );
        },
      ),
    );
  }
}
