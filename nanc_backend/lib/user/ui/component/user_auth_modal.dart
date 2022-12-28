import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nanc_backend/user/logic/bloc/user_bloc.dart';
import 'package:nanc_backend/user/logic/bloc/user_state.dart';
import 'package:tools/tools.dart';
import 'package:ui_kit/ui_kit.dart';

class UserAuthModal extends StatefulWidget {
  const UserAuthModal({
    super.key,
  });

  @override
  State<UserAuthModal> createState() => _UserAuthModalState();
}

class _UserAuthModalState extends State<UserAuthModal> {
  UserBloc get userBloc => context.read();

  final GlobalKey<FormState> formKey = GlobalKey();

  Future<void> authorize() async {
    if (formKey.currentState?.validate() ?? false) {
      await userBloc.authorize();
      if (mounted && userBloc.state.isAuthorized) {
        Navigator.of(context).pop(true);
      } else if (mounted) {
        Navigator.of(context).pop(false);
      }
    }
  }

  String? isEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email must not be empty';
    }
    if (RegExp(r'^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$').hasMatch(value)) {
      return null;
    }
    return 'Incorrect email';
  }

  String? isStrongPassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password must not be empty';
    }
    if (RegExp(r'^((?=\S*?[A-Z])(?=\S*?[a-z])(?=\S*?[0-9]).{6,})\S$').hasMatch(value)) {
      return null;
    }
    return 'Password should contain at least 1 uppercase, 1 lowercase letter, and 1 number with no spaces and 6 or more characters';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Gap.extra),
        child: KitBaseModal(
          width: max(context.query.size.width * 0.65, 300),
          header: const Text('You need to authorize for syncing with clients'),
          body: Padding(
            padding: const EdgeInsets.only(top: Gap.large, bottom: Gap.large),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (BuildContext context, UserState state) {
                String buttonText = state.isAuthorizationInProgress ? 'Authorization...' : 'Authorize';
                if (state.needToConfirmEmail) {
                  buttonText = 'Awaiting email confirmation...';
                }

                return Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: Gap.large),
                        child: KitTextField(
                          controller: userBloc.emailController,
                          helper: 'Email',
                          placeholder: 'Type your email here',
                          validator: isEmail,
                          readOnly: state.isAuthorizationInProgress,
                          maxLines: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: Gap.large),
                        child: KitTextField(
                          controller: userBloc.passwordController,
                          helper: 'Password',
                          placeholder: 'Use your old NANC password or make up a new one if this is your first time here',
                          validator: isStrongPassword,
                          readOnly: state.isAuthorizationInProgress,
                          maxLines: 1,
                        ),
                      ),
                      KitRoundedButton(
                        expanded: true,
                        onPressed: state.isAuthorizationInProgress ? null : authorize,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: state.isAuthorizationInProgress
                                  ? Padding(
                                      padding: const EdgeInsets.only(right: Gap.regular),
                                      child: SizedBox(
                                        height: 16,
                                        width: 16,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          backgroundColor: context.theme.colorScheme.onPrimary,
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 250),
                              child: Text(
                                buttonText,
                                key: ValueKey(buttonText),
                                style: TextStyle(
                                  color: context.theme.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          bottom: null,
        ),
      ),
    );
  }
}
