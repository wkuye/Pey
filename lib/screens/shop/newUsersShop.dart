import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:pey_ltd_mobile/cache/shared_Preference.dart';

import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/main.dart';
import 'package:pey_ltd_mobile/screens/shop/main_shop.dart';

class NewUserShop extends StatelessWidget {
  const NewUserShop({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = AdaptiveTheme.of(context).theme;
    
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            height: size.height / 1.7,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(shopBackground), fit: BoxFit.fill)),
          ),
          Positioned(
            top: size.height/2.7,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 25.0, sigmaY: 20.0),
                child: Container(
                    width: size.width,
                    height: size.height / 3.9,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Spacer(),
                        const Text('Welcome TO',
                            style: TextStyle(
                              color: Color.fromARGB(255, 111, 108, 99),
                              fontSize: 13,
                            )),
                        const Text(
                          'Peymarket',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                            'One of the premier mobile ecommerce platforms',
                            style: TextStyle(
                              color: Color.fromARGB(255, 111, 108, 99),
                            )),
                        const Text(
                            'for convenient shopping, offering user-friendly',
                            style: TextStyle(
                                color: Color.fromARGB(255, 111, 108, 99))),
                        const Text(
                            'payment options and flexible installment plans',
                            style: TextStyle(
                                color: Color.fromARGB(255, 111, 108, 99))),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            
                            Cache().setPreference();
     Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => MyApp(index: 1,)));
                          },
                          child: Container(
                            height: size.height / 20,
                            width: size.width / 2.3,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                              child: Text(
                                'continue',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 111, 108, 99)),
                              ),
                            ),
                          ),
                        ),
                        const Spacer()
                      ],
                    )),
              ),
            ),
          ),
          Positioned(
            top: size.height/1.6,
            child: Container(
              height: size.height,
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(color: theme.backgroundColor),
              child: Column(
                children: [
                 const Spacer(),
                  Row(
                    children: [
                      Text(
                        'New Arrivals',
                        style: TextStyle(
                            color: theme.primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      const Text(
                        'See All',
                        style: TextStyle(color: Color(onBoardingButtonColor)),
                      )
                    ],
                  ),
              const SizedBox(height: 7,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: size.height / 5,
                          width: size.width / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  image: AssetImage(woodChair),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: size.height / 5,
                          width: size.width / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                  image: AssetImage(sovaChair),
                                  fit: BoxFit.cover)),
                        ),
                      )
                    ],
                  ),
                  const Spacer(flex: 35,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
