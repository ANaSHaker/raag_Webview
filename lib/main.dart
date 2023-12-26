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
String? deviceLanguage;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // await Firebase.initializeApp();
   deviceLanguage = getDeviceLanguage();
  print('Device language: $deviceLanguage');
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
String getDeviceLanguage() {
  return ui.window.locale.languageCode;
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    requestLocationPermission();

/*    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("#########onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("########onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("###########onResume: $message");
      },
    );*/
  }
  Future<void> requestLocationPermission() async {
    final PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      // Location permission granted
    } else if (status.isDenied) {
      // Location permission denied
    } else if (status.isPermanentlyDenied) {
      // Location permission permanently denied
      // You can open app settings here to let the user manually enable the permission
      openAppSettings();
    }
  }
  @override
  Widget build(BuildContext context) {
     ScreenAdaptar.init(context);
     return  BlocConsumer<AppCubit, AppStates>(
         listener: (context, state) {},
         builder: (context, state) =>  MaterialApp(
       debugShowCheckedModeBanner: false,
       title: deviceLanguage == 'ar' ? 'ثقة الانجاز' :'Thiqat Alinjaz',
       theme: ThemeData.light().copyWith(
         primaryColor: KPrimaryColor,
         scaffoldBackgroundColor: KSecondaryColor,
       ),
       home: SplashScreen(),
     ) );

  }
}



/*class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthHelper? auth = Provider.of(context)!.auth;
    return StreamBuilder(
      stream: auth!.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapShot) {
        if (snapShot.connectionState == ConnectionState.active) {
          final bool signedIn = snapShot.hasData;
          return ;
        }
        return CircularProgressIndicator();
      },
    );
  }
}*/
