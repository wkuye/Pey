import 'dart:convert';

import 'package:custom_top_navigator/custom_top_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pey_ltd_mobile/api/http_request/currentUserRequest.dart';

import 'package:pey_ltd_mobile/api/models/user.dart';
import 'package:pey_ltd_mobile/bloc/addBeneficiary_bloc.dart';
import 'package:pey_ltd_mobile/bloc/alertDialogBloc.dart';

import 'package:pey_ltd_mobile/bloc/auth_Bloc.dart';
import 'package:pey_ltd_mobile/bloc/password_Bloc.dart';

import 'package:pey_ltd_mobile/bloc/quick_TransferBloc.dart';
import 'package:pey_ltd_mobile/bloc/selectBloc_ben.dart';
import 'package:pey_ltd_mobile/bloc/splash_Bloc.dart';
import 'package:pey_ltd_mobile/constant/strings.dart';
import 'package:pey_ltd_mobile/pages/forgotten_password.dart';
import 'package:pey_ltd_mobile/pages/home.dart';
import 'package:pey_ltd_mobile/pages/login_page.dart';
import 'package:pey_ltd_mobile/pages/pin_pageTransfer.dart';
import 'package:pey_ltd_mobile/pages/select_Beneficiary.dart';
import 'package:pey_ltd_mobile/pages/splash_screen.dart';
import 'package:pey_ltd_mobile/screens/authScreens/forgot_screen.dart';
import 'package:pey_ltd_mobile/screens/authScreens/login_screen.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:pey_ltd_mobile/screens/beneficiary/add_beneficiary.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp(index: 0,));
}

class MyApp extends StatefulWidget {
  final int index;
  const MyApp({
    super.key, required this.index,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AdaptiveTheme(
      light: ThemeData(
          primaryColor: Colors.black,
          backgroundColor: Colors.white,
          indicatorColor: Colors.black,
          cardColor: Colors.transparent,
          hoverColor: Colors.transparent,
          canvasColor: Color(onBoardingButtonColor),
          brightness: Brightness.light,
          tabBarTheme: TabBarTheme(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(7)))),
      dark: ThemeData(
          primaryColor: Colors.white,
          indicatorColor: const Color(0xff858585),
          backgroundColor: Colors.black,
          hoverColor: const Color(tabBarColor),
          canvasColor: Color(onBoardingButtonColor),
          cardColor: const Color(
            0xff262629,
          ),
          brightness: Brightness.dark,
          tabBarTheme: TabBarTheme(
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xff4F4F50),
              dividerColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: const Color(selectedTabBarColor),
                  borderRadius: BorderRadius.circular(7)))),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darktheme) => MaterialApp(
          theme: theme,
          darkTheme: darktheme,
          title: 'Flutter Demo',
          home: CustomTopNavigator(
            routes: {
              '/login': (context) => const LoginPage(),
              '/forgot': (context) => MultiBlocProvider(providers: [
                    BlocProvider(create: (context) => AuthBloc()),
                  ], child: const ForgottenPassowrd()),
              '/loginScreen': (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => AuthBloc()),
                      BlocProvider(create: (context) => PassWordBloc()),
                    ],
                    child: const LoginScreen(),
                  ),
              '/reset': (context) => MultiBlocProvider(providers: [
                    BlocProvider(create: (context) => AuthBloc()),
                    BlocProvider(create: (context) => PassWordBloc()),
                  ], child: ForgotScreen()),
              '/home': (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(create: (context) => AuthBloc()),
                        BlocProvider(
                          create: (context) => QuickTransferBloc(context, size),
                        ),
                      ],
                      child:  HomePage(
                        user: null, indexs: widget.index,
                      )),
              '/select': (context) => BlocProvider(
                    create: (context) => selectBloc(),
                    child: SelectBeneficiary(),
                  ),
              '/add_ben': (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(create: (context) => selectBloc()),
                      BlocProvider(create: (context) => addBeneficiaryBloc())
                    ],
                    child: AddBeneficiary(),
                  ),
              'pin_page': (context) => MultiBlocProvider(providers: [
                    BlocProvider(
                      create: (context) => DialogBloc(),
                    ),
                    BlocProvider(
                        create: (context) => QuickTransferBloc(context, size)),
                  ], child: PingPage())
            },
            pageRoute: PageRoutes.materialPageRoute,
            home: MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => SplashBloc()),
                  BlocProvider(
                      create: (context) => QuickTransferBloc(context, size))
                ],
                child: FutureBuilder<SharedPreferences>(
                    future: SharedPreferences.getInstance(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData) {
                        final token = snapshot.data!.getString('token');

                        return token == null
                            ? const Splash()
                            : FutureBuilder(
                                future: CurrentUserRequest().getCurrentUser(),
                                builder: (context, user) {
                                  print(user.hasError);
                                  if (user.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: AdaptiveTheme.of(context)
                                                .theme
                                                .backgroundColor,
                                            child: const Center(
                                                child:
                                                    CircularProgressIndicator())));
                                  }
                                  if (user.hasData) {
                                    var usersnap = jsonDecode(user.data!.body);
                                    var currentUser = User.fromjson(usersnap);
                                    return HomePage(user: currentUser, indexs: widget.index,);
                                  }
                                  return  HomePage(user: null, indexs: widget.index,);
                                });
                      }
                      return const Splash();
                    })),
          )),
    );
  }
}
