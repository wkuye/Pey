import 'package:flutter/material.dart';

class BeneficiaryInput extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const BeneficiaryInput({super.key, required this.controller, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText:text ),
    );
  }
}
