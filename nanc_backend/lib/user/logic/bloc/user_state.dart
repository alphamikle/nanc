import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'user_state.g.dart';

@CopyWith()
class UserState extends Equatable {
  const UserState({
    required this.userId,
    required this.isAuthorizationInProgress,
    required this.needToConfirmEmail,
  });

  factory UserState.empty() => const UserState(userId: '', isAuthorizationInProgress: false, needToConfirmEmail: false);

  final String userId;
  final bool isAuthorizationInProgress;
  final bool needToConfirmEmail;

  bool get isAuthorized => userId != '';

  @override
  List<Object?> get props => [
        userId,
        isAuthorizationInProgress,
        needToConfirmEmail,
      ];
}
