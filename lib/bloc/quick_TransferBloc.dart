
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:pey_ltd_mobile/classes/quickTransferEvent.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/pages/transfer.dart';
import 'package:pey_ltd_mobile/utility/quick_transferCard.dart';

class QuickTransferBloc
    extends Bloc<QuickTransferEvent, List<QuickTransferCard>> {
  final BuildContext context;
  final Size size;
  QuickTransferBloc(this.context, this.size)
      : super([
          QuickTransferCard(
              icon: Container(
                  height: size.height / 15,
                  width: size.width / 6,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(progressBarColor)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(QRCode)),
              name: 'Scan',
              ontap: () {},
              ben: null),
          QuickTransferCard(
              icon: Container(
                height: size.height / 15,
                width: size.width / 6,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(progressBarColor)),
                    borderRadius: BorderRadius.circular(15)),
                child: const Icon(
                  Icons.add,
                  color: Color(progressBarColor),
                ),
              ),
              name: 'Topup',
              ontap: () {},
              ben: null),
          QuickTransferCard(
              icon: Container(
                  height: size.height / 15,
                  width: size.width / 6,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(progressBarColor)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Image.asset(Send)),
              name: 'Transfer',
              ontap: () {
          
                     Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/select',
                  (route) => true,
                 
                );
        
             
              },
              ben: null)
        ]) {
    on<addBeneficiary>((event, emit) {
      emit([
        ...state,
        QuickTransferCard(
          icon: CachedNetworkImage(
            height: size.height / 15,
            width: size.width / 6,
            imageUrl: event.image.isEmpty
                ? defaultProfile
                : Platform.isAndroid
                    ? 'http://10.0.2.2:8000/${event.image}'
                    : 'http://127.0.0.1:8000/${event.image}',
            imageBuilder: (context, imageprovider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(image: imageprovider, fit: BoxFit.cover),
              ),
            ),
          ),
          name: event.name,
          ontap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Transfer(
                      currentBeneficiary: event.ben,
                    )));
          },
          ben: event.ben,
        ),
      ]);
      print(state);
    });
  }
}
