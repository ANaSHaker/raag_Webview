import 'package:fetan_lottery/Screens/constants.dart';
import 'package:fetan_lottery/Screens/splash/presentation/views/widgets/my_fade_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../bloc/cubit/app_cubit.dart';
import '../../../../bloc/cubit/app_states.dart';
import '../../../../main.dart';
import '../../../HomeScreen/HomeScreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AppCubit>(context)..splashTimer(),
      child: BlocListener<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is SplashscreenLoading) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
            => HomeScreen()));
          } else {
            print(state);
          }
        },
        child: Scaffold(
          body: Center(child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Container(
                height: 125.h,
                child: Image.asset('assets/images/app_logo.png',fit: BoxFit.contain,)),
          )),
        ),
      ),
    );
  }
}
