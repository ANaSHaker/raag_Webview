import 'package:bloc/bloc.dart';
import 'package:fetan_lottery/Screens/HomeScreen/HomeScreen.dart';

import 'package:fetan_lottery/Screens/constants.dart';
import 'package:fetan_lottery/Screens/splash/presentation/views/splash_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'ScreenAdapter.dart';
import 'dart:ui' as ui;

import 'bloc/bloc_observer.dart';
import 'bloc/cubit/app_cubit.dart';
import 'bloc/cubit/app_states.dart';


String? Fcmtoken;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(
        () {
      return runApp(MultiBlocProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeProvider(),
          ),
          BlocProvider(create: (context) => AppCubit()),
        ],
        child:  MyApp(),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
     ScreenAdaptar.init(context);
     return  BlocConsumer<AppCubit, AppStates>(
         listener: (context, state) {},
         builder: (context, state) =>  MaterialApp(
       debugShowCheckedModeBanner: false,
       title:'رائج للدورات التعليمي',
       theme: ThemeData.light().copyWith(
         primaryColor: KPrimaryColor,
         scaffoldBackgroundColor: KSecondaryColor,
       ),
       home: SplashScreen(),
     ) );

  }
}

