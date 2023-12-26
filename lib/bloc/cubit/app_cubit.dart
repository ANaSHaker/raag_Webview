import 'dart:async';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  void splashTimer() async {
    await Future.delayed(
        const Duration(seconds: 4), () => emit(SplashscreenLoading()));
  }


}



