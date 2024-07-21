import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_planet/cubits/change_mode_cubit/change_mode_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class ChangeModeCubit extends Cubit<ModeState> {
  ChangeModeCubit() : super(LightModeState());

  void changeMode() async {
    if (state is LightModeState) {
      emit(DarkModeState());
    } else {
      emit(LightModeState());
    }
  }
}
