import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/models/user.dart';
import 'package:pey_ltd_mobile/bloc/quick_TransferBloc.dart';

import 'package:pey_ltd_mobile/cache/shared_Preference.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/pages/shop.dart';
import 'package:pey_ltd_mobile/screens/homePageScreens/homePage.dart';

import 'package:pey_ltd_mobile/utility/quick_transferCard.dart';

class HomePage extends StatefulWidget {
  final User? user;
  final int indexs;
  const HomePage({
    super.key,
    required this.user, required this.indexs,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool? boolpref;
  List<Widget> myWidgets(BuildContext context) {
    // ignore: unnecessary_nullable_for_final_variable_declarations
    final User? user =
        widget.user ?? ModalRoute.of(context)!.settings.arguments as User;

    List<Widget> widgetOptions = <Widget>[
      BlocBuilder<QuickTransferBloc, List<QuickTransferCard>>(
        builder: (BuildContext context, List<QuickTransferCard> state) {
          return Home(
            user: user!,
            beneficiary: state,
          );
        },
      ),
      Shop(
        boolpref: boolpref,
      ),
      const Text('Profile Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      const Text('Profile Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ];

    return widgetOptions;
  }

  // late TabController _tabController;
  @override
  void initState() {
  
    setState(() {
      _selectedIndex= widget.indexs;
    });
    if (_selectedIndex==1) {
      Cache().getPreferences().then((value) {
                setState(() {
                  boolpref = value;
                });
              });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;

    return Scaffold(
        body: myWidgets(context).elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            if (index == 1) {
              Cache().getPreferences().then((value) {
                setState(() {
                  boolpref = value;
                });
              });
            }
          },
          backgroundColor: theme.backgroundColor,
          showSelectedLabels: true,
          type: BottomNavigationBarType.fixed,
         
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          items: [
            BottomNavigationBarItem(
              backgroundColor: theme.backgroundColor,
              icon: buildNavItem(
                0,
                Image(
                    color: _selectedIndex == 0
                        ? const Color(progressBarColor)
                        : theme.primaryColor,
                    image: const AssetImage(home)),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: theme.backgroundColor,
              icon: buildNavItem(
                1,
                Image(
                    color: _selectedIndex == 1
                        ? const Color(progressBarColor)
                        : theme.primaryColor,
                    image: const AssetImage(shop)),
              ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              backgroundColor: theme.backgroundColor,
              icon: buildNavItem(
                2,
                Image(
                    color: _selectedIndex == 2
                        ? const Color(progressBarColor)
                        : theme.primaryColor,
                    image: const AssetImage(search)),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: theme.backgroundColor,
              icon: buildNavItem(
                3,
                Image(
                    color: _selectedIndex == 3
                        ? const Color(progressBarColor)
                        : theme.primaryColor,
                    image: const AssetImage(profile)),
              ),
              label: 'Profile',
            ),
          ],
        )
        // TabBar(
        //           onTap: (x) {
        //             // setState(() {
        //             //   _selectedIndex = x;
        //             // });
        //             // if (_selectedIndex == 1) {}
        //           },
        //           labelColor: const Color(progressBarColor),
        //           unselectedLabelColor: Colors.blueGrey,
        //           indicator: const BoxDecoration(
        //             image: DecorationImage(
        //                 image: AssetImage(tabBar),
        //                 alignment: Alignment.topCenter),
        //           ),
        //           tabs:
        //           controller: _tabController),

        );
  }

  Widget buildNavItem(int index, Widget icon) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        icon,
        if (_selectedIndex == index)
          Container(
            height: MediaQuery.of(context).size.height / 25,
            width: MediaQuery.of(context).size.width / 3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(tabBar), alignment: Alignment.topCenter),
            ), // Change this color to your indicator color
          ),
      ],
    );
  }
}
