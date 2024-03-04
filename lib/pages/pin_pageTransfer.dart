import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/http_request/currentUserRequest.dart';
import 'package:pey_ltd_mobile/api/http_request/transfer.dart';
import 'package:pey_ltd_mobile/api/models/beneficiaryModel.dart';
import 'package:pey_ltd_mobile/api/models/user.dart';
import 'package:pey_ltd_mobile/bloc/alertDialogBloc.dart';
import 'package:pey_ltd_mobile/bloc/quick_TransferBloc.dart';
import 'package:pey_ltd_mobile/classes/dialogEvent.dart';

import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/main.dart';

import 'package:pey_ltd_mobile/utility/quick_transferCard.dart';

import 'package:pin_plus_keyboard/package/controllers/pin_input_controller.dart';
import 'package:pin_plus_keyboard/package/pin_plus_keyboard_package.dart';

class PingPage extends StatelessWidget {
  const PingPage({super.key});

  @override
  Widget build(BuildContext context) {
    PinInputController pinInputController = PinInputController(length: 4);
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final beneficiary arg1 = args['arg1'];
    final arg2 = args['arg2'];
    final String arg3 = args['arg3'];
    final theme = AdaptiveTheme.of(context).theme;
    final size = MediaQuery.of(context).size;

    final bool booltheme =
        AdaptiveTheme.of(context).brightness == Brightness.light;
    return BlocBuilder<DialogBloc, bool>(builder: (context, state) {
      return BlocBuilder<QuickTransferBloc, List<QuickTransferCard>>(
          builder: (bcontext, listState) {
        return FutureBuilder(
            future: CurrentUserRequest().getCurrentUser(),
            builder: (subcontext, user) {
              if (user.hasData) {
                var usersnap = jsonDecode(user.data!.body);
                var currentUser = User.fromjson(usersnap);
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: theme.backgroundColor,
                  ),
                  body: Container(
                    height: size.height,
                    width: size.width,
                    color: booltheme
                        ? const Color(0xffF2F2F2)
                        : theme.backgroundColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            'Enter your Pey Pin',
                            style: TextStyle(
                                color: Color(onBoardingButtonColor),
                                fontWeight: FontWeight.w800,
                                fontSize: 20),
                          ),
                        ),
                        PinPlusKeyBoardPackage(
                          spacing: size.height * 0.09,
                          keyboardButtonShape: KeyboardButtonShape.circular,
                          inputTextStyle: TextStyle(color: theme.primaryColor),
                          pinInputController: pinInputController,
                          inputBorderRadius: BorderRadius.circular(10),
                          inputsMaxWidth: 150,
                          inputHeight: 70,
                          inputWidth: 70,
                          inputBorderColor: theme.primaryColor,
                          keyboardBtnSize: 80,
                          btnHasBorder: false,
                          buttonFillColor:
                              const Color.fromARGB(255, 209, 209, 209),
                          onSubmit: () {
                            context
                                .read<DialogBloc>()
                                .add(ShowDialog(dialog: true));

                            if (state == true) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext dialogcontext) {
                                    return AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      content: Container(
                                        padding: const EdgeInsets.all(15),
                                        height: size.height / 2,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                            color: theme.backgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              dialogPicture,
                                              scale: 1.5,
                                            ),
                                            const Spacer(),
                                            Expanded(
                                                child: Text(
                                              'Your Transfer was succcessful',
                                              style: TextStyle(
                                                  color: theme.primaryColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                            const Spacer(),
                                            Text(
                                              'You have succesfully made a',
                                              style: TextStyle(
                                                  color: theme.primaryColor),
                                            ),
                                            const Spacer(),
                                            Text(
                                              'transfer to',
                                              style: TextStyle(
                                                  color: theme.primaryColor),
                                            ),
                                            const Spacer(),
                                            Expanded(
                                                child: Text(
                                                    '${arg1.beneficiary_name} account for \$$arg2')),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () {
                                                // final int amount =
                                                //     int.parse(arg2);
                                                RequestTransfer().makeTransfer(
                                                    currentUser.id.toString(),
                                                    arg1.benId.toString(),
                                                    arg2,
                                                    'Credit',
                                                    arg3);
                                                Navigator.of(dialogcontext)
                                                    .pop();
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const MyApp(
                                                              index: 0,
                                                            )),
                                                    (route) => false);
                                              },
                                              child: Container(
                                                height: size.height / 12,
                                                width: size.width / 2,
                                                decoration: BoxDecoration(
                                                    color: const Color(
                                                        onBoardingButtonColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: const Center(
                                                  child: Text(
                                                    'Cancel',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Spacer(
                                              flex: 2,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            }
                          },
                          keyboardFontFamily: '',
                        ),
                      ],
                    ),
                  ),
                );
              } else if (user.connectionState == ConnectionState.active) {
                return const Center(child: CircularProgressIndicator());
              }
              return Container();
            });
      });
    });
  }
}
