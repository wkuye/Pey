import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/models/beneficiaryModel.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/screens/transfer/transfer_final%20_touch.dart';
import 'package:pey_ltd_mobile/utility/numeric_keypad.dart';
import 'package:pey_ltd_mobile/utility/snackbar.dart';
// import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
// import 'package:pin_plus_keyboard/pin_plus_keyboard.dart';

class Transfer extends StatefulWidget {
  final beneficiary currentBeneficiary;
  const Transfer({super.key, required this.currentBeneficiary});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  String text = '';
  double resize = Platform.isAndroid?200: 185;
  double dolarResize = Platform.isAndroid?167.5: 155; 
  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    final size = MediaQuery.of(context).size;
    final bool booltheme =
        AdaptiveTheme.of(context).brightness == Brightness.light;
    // PinInputController pinInputController = PinInputController(length: 2);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          title: Text(
            'Transferring to ${widget.currentBeneficiary.beneficiary_name}',
            style: TextStyle(
                color: theme.primaryColor, fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(20),
              color:
                  booltheme ? const Color(0xffF2F2F2) : theme.backgroundColor,
              child: Stack(
                children: [
                  Container(
                    height: size.height / 5.3,
                    width: size.width / 1,
                    decoration: BoxDecoration(
                        color: const Color(onBoardingButtonColor),
                        borderRadius: BorderRadius.circular(13)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Set Amount',
                            style: TextStyle(
                                color: theme.backgroundColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Text(
                            'How much would u like to send?',
                            style: TextStyle(color: Color(0xffDCB7A6)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      top: 60,
                      left: dolarResize,
                      child: const Text(
                        '\$',
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      )),
                  Positioned(
                      top: 200,
                      child: NumericKeyboard(
                          onKeyboardTap: (value) {
                            if (text.length < 8) {
                              setState(() {
                                text = text + value;
                              });

                              setState(() {
                                resize -= 15;
                                dolarResize -= 15;
                              });
                            } else {
                              showSnackBar(context, 'maximum amount Reached');
                            }
                          },
                          textColor: theme.primaryColor,
                          rightButtonFn: () {
                            if (text.isNotEmpty) {
                              setState(() {
                                text = text.substring(0, text.length - 1);
                              });

                              setState(() {
                                resize += 15;
                                dolarResize += 15;
                              });
                            }
                          },
                          rightIcon: Icon(
                            Icons.backspace,
                            color: theme.primaryColor,
                          ),
                          leftButtonFn: () {
                            // ignore: unrelated_type_equality_checks
                            if (text.isNotEmpty) {
                              if (text
                                  .split('')
                                  .every((element) => element == '0')) {
                                showSnackBar(context, 'Set a valid amount');
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => FinalTouchTransfer(
                                          currentBeneficiary:
                                              widget.currentBeneficiary,
                                          text: text,
                                        )));
                              }
                            }
                          },
                          leftIcon: Icon(
                            Icons.check,
                            color: theme.primaryColor,
                          ),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly)),
                  Positioned(
                      top: 60,
                      left: resize,
                      child: Center(
                        child: Text(
                          text,
                          style: const TextStyle(
                              fontSize: 50, color: Colors.white),
                        ),
                      ))
                ],
              ),
            ))
          ],
        ));
  }
}
