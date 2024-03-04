import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/models/beneficiaryModel.dart';
import 'package:pey_ltd_mobile/utility/quick_transferCard.dart';

abstract class QuickTransferEvent {}

// ignore: camel_case_types
class addBeneficiary implements QuickTransferEvent {
  final String name;
  final String image;
  final Size size;
  final beneficiary ben;
  final List<QuickTransferCard> list;

  addBeneficiary(
      {required this.image,
      required this.size,
      required this.name,
      required this.list,
      required this.ben});
}
