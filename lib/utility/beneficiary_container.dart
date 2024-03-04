import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/api/models/beneficiaryModel.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/pages/transfer.dart';

class BeneficiaryContainer extends StatelessWidget {
  final String? image;
  final String email;
  final String name;
  final beneficiary currentbeneficiary;
  final String lastname;
  final ThemeData theme;
  const BeneficiaryContainer({super.key, required this.image, required this.email, required this.name, required this.lastname, required this.theme, required this.currentbeneficiary});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 7,
      width: size.width ,
    
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        children: [
          Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.start,
            children: [
             const Spacer(flex: 2,),
             CachedNetworkImage(imageUrl:image!.isNotEmpty? Platform.isAndroid? 'http://10.0.2.2:8000/$image': 'http://127.0.0.1:8000/$image' :defaultProfile,imageBuilder: (context, imageprovider) => Container(
                    width: size.width / 9,
                    height: size.height/11,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                        image: DecorationImage(image: imageprovider)),
                  ),
                ),
          const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                    
                  children: [
                    Text(
                     '$name  $lastname',
                      style: TextStyle(color: theme.primaryColor,fontWeight: FontWeight.bold),
                    ),
                 Text(
                     'pey, $email',
                      style: TextStyle(color: theme.primaryColor),
                    ),
                
                  ],
                ),
              ),
              const Spacer(flex: 3,),
              GestureDetector(
                onTap: ()=> Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Transfer(
                                  currentBeneficiary: currentbeneficiary,
                                ))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 12),
                  child: Image.asset(BeneficiaryTranferIcon,scale: 1.2,),
                ),
              ),
              const Spacer(flex: 2,)
            ],
          ),
        const Divider(
          indent: 80,
      endIndent: 15,
        )
        ],
      ),
    );
  }
}
