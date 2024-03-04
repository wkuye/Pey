import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';
import 'package:pey_ltd_mobile/bloc/password_Bloc.dart';
import 'package:pey_ltd_mobile/classes/auth_state.dart';
import 'package:pey_ltd_mobile/classes/password_state.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/screens/authScreens/login_tabScreen.dart';
import 'package:pey_ltd_mobile/screens/authScreens/register_tabScreen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dynamic index = ModalRoute.of(context)!.settings.arguments as int;
  
    final themeColors = AdaptiveTheme.of(context).theme;
    final themeBool = AdaptiveTheme.of(context).brightness == Brightness.light;
    final tabBarTheme = AdaptiveTheme.of(context).theme.tabBarTheme;
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, authstate) {
      return Material(
        type: MaterialType.transparency,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          height: size.height,
          width: size.width,
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(themeBool?aboutToLight: loginBackground), fit: BoxFit.cover)),
          child: SafeArea(
            child: DefaultTabController(
                length: 2,
                initialIndex: index,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    Center(child: Image.asset(pey)),
                    const Spacer(
                      flex: 6,
                    ),
                    Container(
                      width: 220,
                      decoration: BoxDecoration(
                          color: themeColors.hoverColor,
                          border: themeBool?Border.all():null,
                          borderRadius: BorderRadius.circular(10)),
                      child: TabBar(
                          labelColor: tabBarTheme.labelColor,
                          unselectedLabelColor:
                              tabBarTheme.unselectedLabelColor,
                          dividerColor: tabBarTheme.dividerColor,
                          indicatorSize: tabBarTheme.indicatorSize,
                          indicatorPadding: const EdgeInsets.all(5),
                          indicator: tabBarTheme.indicator,
                          tabs: const [
                            Tab(
                              text: login,
                            ),
                            Tab(
                              text: register,
                            )
                          ]),
                    ),
                    Expanded(
                        flex: 100,
                        child: SizedBox(
                            height: size.height,
                            width: size.width,
                            child: BlocBuilder<PassWordBloc, PassWordState>(
                                builder: (context, state) {
                              return TabBarView(children: [
                                LoginTabScreen(
                                  state: state,
                                  authState: authstate,
                                ),
                                RegisterTabScreen(
                                  state: state,
                                  authState: authstate,
                                )
                              ]);
                            }))),
                    const Spacer(
                      flex: 2,
                    )
                  ],
                )),
          ),
        ),
      );
    });
  }
}
