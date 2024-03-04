import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/http_request/add_beneficiary.dart';
import 'package:pey_ltd_mobile/api/http_request/getBeneficiary.dart';
import 'package:pey_ltd_mobile/api/models/beneficiaryModel.dart';
import 'package:pey_ltd_mobile/bloc/addBeneficiary_bloc.dart';
import 'package:pey_ltd_mobile/classes/addBen_event.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/pages/transfer.dart';
import 'package:pey_ltd_mobile/utility/beneficiary_input.dart';
import 'package:pey_ltd_mobile/utility/snackbar.dart';

class AddBeneficiary extends StatefulWidget {
  const AddBeneficiary({
    super.key,
  });

  @override
  State<AddBeneficiary> createState() => _AddBeneficiaryState();
}

class _AddBeneficiaryState extends State<AddBeneficiary> {
  String names = '';
  bool submitted = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController bankController = TextEditingController(text: 'pey');
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = AdaptiveTheme.of(context).theme;
    final String id = ModalRoute.of(context)!.settings.arguments.toString();
    return BlocBuilder<addBeneficiaryBloc, TextEditingController>(
        builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.backgroundColor,
          title: Text(
            'Add Beneficiary',
            style: TextStyle(
                fontWeight: FontWeight.w500, color: theme.primaryColor),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  height: size.height / 2,
                  width: size.width,
                  color: theme.backgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        'Recipient details',
                        style: TextStyle(
                            color: Color(onBoardingButtonColor),
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                          'Please add account details of the recipient'),
                      const Spacer(),
                      TextFormField(
                        
                        controller: emailController,
                        decoration: const InputDecoration(hintText: 'Email'),
                        onFieldSubmitted: (value) {
                          GetBeneficiary()
                              .getUserName(value, id)
                              .then((value) {
                            setState(() {
                              names = value;
                              submitted = true;
                            });
                            context
                                .read<addBeneficiaryBloc>()
                                .add(getNames(name: names));
                            if (value == 'User not Found') {
                              showSnackBar(context, 'User not Found');
                            }
                          });
                        },
                      ),
                      const Spacer(),
                      BeneficiaryInput(
                          controller: bankController, text: 'Select to bank'),
                      const Spacer(),
                      BeneficiaryInput(controller: state, text: state.text),
                      const Spacer(
                        flex: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (submitted == true) {
                  RequestAddBeneficiary()
                      .addEmailToBeneficiary(id, emailController.text)
                      .then((value) {
                    if (value.statusCode == 200) {
                      var response = jsonDecode(value.body);
                      var beneficiarys =
                          beneficiary.fromJson(response['user']);
      
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Transfer(
                                currentBeneficiary: beneficiarys,
                              )));
                    } else if (value.statusCode == 400) {
                      showSnackBar(context, 'Beneficiary already added');
                    } else {
                      showSnackBar(context, 'User not found');
                    }
                  });
                }
              },
              child: Container(
                color: theme.backgroundColor,
                height: size.height / 7,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Container(
                    height: size.height / 9,
                    width: size.width / 1,
                    decoration: const BoxDecoration(
                        color: Color(onBoardingButtonColor)),
                    child: Center(
                        child: Text(
                      continueButton,
                      style: TextStyle(
                          color: theme.backgroundColor,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
