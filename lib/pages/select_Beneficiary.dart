import 'dart:convert';
import 'dart:io';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:pey_ltd_mobile/api/http_request/currentUserRequest.dart';
import 'package:pey_ltd_mobile/api/http_request/getBeneficiary.dart';
import 'package:pey_ltd_mobile/api/models/beneficiaryModel.dart';
import 'package:pey_ltd_mobile/api/models/user.dart';
import 'package:pey_ltd_mobile/bloc/selectBloc_ben.dart';
import 'package:pey_ltd_mobile/classes/selectBen_event.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/utility/beneficiary_container.dart';

class SelectBeneficiary extends StatefulWidget {
  const SelectBeneficiary({super.key});

  @override
  State<SelectBeneficiary> createState() => _SelectBeneficiaryState();
}

class _SelectBeneficiaryState extends State<SelectBeneficiary> {
  final TextEditingController controller = TextEditingController();
  late Future<Response> user;
  List<dynamic> benList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CurrentUserRequest().getCurrentUser().then((value) {
      final userResponse = jsonDecode(value.body);
      final currentUser = User.fromjson(userResponse);
      GetBeneficiary()
          .searchBeneficiary('', currentUser.id.toString())
          .then((value) {
        setState(() {
          benList = value;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    final size = MediaQuery.of(context).size;

    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;

    return BlocBuilder<selectBloc, List<dynamic>>(
     builder: (context, state) {
      return Scaffold(
          backgroundColor: theme.backgroundColor,
          appBar: AppBar(
            backgroundColor: theme.backgroundColor,
            title: Text(
              'Select Beneficiary',
              style: TextStyle(color: theme.primaryColor, fontSize: 20),
            ),
          ),
          body: FutureBuilder(
              future: CurrentUserRequest().getCurrentUser(),
              builder: (context, user) {
                if (user.hasData) {
                  final userResponse = jsonDecode(user.data!.body);
                  final currentUser = User.fromjson(userResponse);

                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            'Send Money',
                            style: TextStyle(
                                color: Color(onBoardingButtonColor),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            'Find your beneficiary',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: size.height / 15,
                            width: size.width / 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color:
                                        const Color(beneficiaryBorderColor))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: Platform.isAndroid ? 7 : 13),
                              child: Center(
                                child: TextFormField(
                                  controller: controller,
                                  onChanged: (value) {
                                    GetBeneficiary()
                                        .searchBeneficiary(
                                            value, currentUser.id.toString())
                                        .then((val) {
                                      context
                                          .read<selectBloc>()
                                          .add(selectedBenEvent(list: val));
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.people),
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'Find contacts',
                                      hintStyle: TextStyle(height: 1),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent))),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        Expanded(
                            child: benList.isEmpty
                                ? Center(
                                    child: Text(
                                    'No Beneficiaries Found',
                                    style: TextStyle(
                                        color: theme.primaryColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ))
                                : Container(
                                    width: size.width,
                                    color: themeBool
                                        ? const Color(0xffF2F2F2)
                                        : theme.backgroundColor,
                                    child: ListView.builder(
                                        itemCount: state.isEmpty
                                            ? benList.length
                                            : state.length,
                                        itemBuilder: (context, index) {
                                          final beneficiarys = state.isEmpty
                                              ? benList[index]
                                              : state[index];

                                          final allBeneficiaries = beneficiary
                                              .fromJson(beneficiarys);
                                          return BeneficiaryContainer(
                                            image: allBeneficiaries
                                                .beneficiary_image,
                                            email: allBeneficiaries
                                                .beneficiary_email,
                                            name: allBeneficiaries
                                                .beneficiary_name,
                                            lastname: allBeneficiaries
                                                .beneficiary_lastname,
                                            theme: theme,
                                            currentbeneficiary:
                                                allBeneficiaries,
                                          );
                                        }))),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pushNamed(
                                  '/add_ben',
                                  arguments: currentUser.id),
                              child: Container(
                                height: size.height / 16,
                                width: size.width / 1.5,
                                decoration: BoxDecoration(
                                    color: const Color(onBoardingButtonColor),
                                    borderRadius: BorderRadius.circular(12)),
                                child: const Center(
                                    child: Text('Add Beneficiary')),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ]);
                }
                return Container();
              }));
    });
  }
}
