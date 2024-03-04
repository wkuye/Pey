import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/models/beneficiaryModel.dart';

class QuickTransferCard {
  final Widget icon;
  final String name;
  final beneficiary? ben;
  final VoidCallback ontap;

  QuickTransferCard(
      {required this.icon, required this.name, required this.ontap, required this.ben});
}
