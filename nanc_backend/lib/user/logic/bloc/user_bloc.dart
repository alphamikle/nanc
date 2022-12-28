import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:nanc_backend/user/logic/bloc/user_state.dart';
import 'package:nanc_webrtc/nanc_webrtc.dart';
import 'package:nanc_webrtc/src/sea_table/user_dto.dart';
import 'package:tools/tools.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc({
    required this.cloudDb,
  }) : super(UserState.empty()) {
    // unawaited(_preAuth());
  }

  final CloudDb cloudDb;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Completer<void>? _emailConfirmationCompleter;

  Future<void> authorize() async {
    emit(state.copyWith(isAuthorizationInProgress: true));
    try {
      final UserDto userDto = await cloudDb.authorize(
        email: emailController.text,
        password: passwordController.text,
      );
      if (userDto.confirmed) {
        emit(state.copyWith(
          userId: userDto.id,
          isAuthorizationInProgress: false,
        ));
        return;
      } else {
        emit(state.copyWith(
          userId: userDto.id,
          needToConfirmEmail: true,
        ));
      }
      _emailConfirmationCompleter = Completer();
      unawaited(_checkEmailConfirmation());
      await _emailConfirmationCompleter?.future;
      emit(state.copyWith(
        userId: userDto.id,
        needToConfirmEmail: false,
        isAuthorizationInProgress: false,
      ));
    } catch (error) {
      emit(state.copyWith(isAuthorizationInProgress: false));
      rethrow;
    }
  }

  Future<void> _preAuth() async {
    try {
      final UserDto userDto = await cloudDb.restoreSession();
      if (userDto.confirmed) {
        emit(state.copyWith(userId: userDto.id));
      }
    } catch (error) {
      // Handle error
      logg(error);
    }
  }

  Future<void> _checkEmailConfirmation() async {
    int counter = 0;
    Timer.periodic(const Duration(seconds: 5), (Timer timer) async {
      if (counter > 30) {
        timer.cancel();
        _emailConfirmationCompleter?.complete();
      }
      try {
        final UserDto user = await cloudDb.signIn(
          email: emailController.text,
          password: passwordController.text,
        );
        if (user.confirmed) {
          timer.cancel();
          _emailConfirmationCompleter?.complete();
        }
      } catch (error) {
        // Handle error
        logg(error);
      }
      counter++;
    });
  }

  Future<void> signOut() async {}
}
