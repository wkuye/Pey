import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

import 'package:pey_ltd_mobile/api/models/beneficiaryModel.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/utility/beneficiary_input.dart';
import 'package:pey_ltd_mobile/utility/confrimTransferContainer.dart';

class FinalTouchTransfer extends StatelessWidget {
  final beneficiary currentBeneficiary;
  final String text;
  const FinalTouchTransfer(
      {super.key, required this.currentBeneficiary, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    final size = MediaQuery.of(context).size;
    final bool booltheme =
        AdaptiveTheme.of(context).brightness == Brightness.light;
    final TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text(
          'Transferring to${currentBeneficiary.beneficiary_name}',
          style:
              TextStyle(color: theme.primaryColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(25),
        color: booltheme ? const Color(0xffF2F2F2) : theme.backgroundColor,
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height / 1.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Sending \$$text to:',
                    style: const TextStyle(
                        color: Color(onBoardingButtonColor),
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                ),
                Expanded(
                    child: ConfrimContainer(
                        text:
                            '${currentBeneficiary.beneficiary_name} ${currentBeneficiary.beneficiary_lastname}')),
                Expanded(
                    child: ConfrimContainer(
                        text: currentBeneficiary.beneficiary_email)),
                const Expanded(child: ConfrimContainer(text: 'Pey')),
                Expanded(
                    flex: 5,
                    child: BeneficiaryInput(
                        controller: descriptionController,
                        text: 'Transfer description (optional)')),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('pin_page',
                      arguments: {'arg1': currentBeneficiary, 'arg2': text, 'arg3':descriptionController.text}),
                  child: Container(
                    height: size.height / 11,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: const Color(onBoardingButtonColor),
                        borderRadius: BorderRadius.circular(13)),
                    child: const Center(
                        child: Text(
                      'confirm Transfer',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
