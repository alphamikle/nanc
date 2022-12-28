// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserStateCWProxy {
  UserState isAuthorizationInProgress(bool isAuthorizationInProgress);

  UserState needToConfirmEmail(bool needToConfirmEmail);

  UserState userId(String userId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserState call({
    bool? isAuthorizationInProgress,
    bool? needToConfirmEmail,
    String? userId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserState.copyWith.fieldName(...)`
class _$UserStateCWProxyImpl implements _$UserStateCWProxy {
  final UserState _value;

  const _$UserStateCWProxyImpl(this._value);

  @override
  UserState isAuthorizationInProgress(bool isAuthorizationInProgress) =>
      this(isAuthorizationInProgress: isAuthorizationInProgress);

  @override
  UserState needToConfirmEmail(bool needToConfirmEmail) =>
      this(needToConfirmEmail: needToConfirmEmail);

  @override
  UserState userId(String userId) => this(userId: userId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserState call({
    Object? isAuthorizationInProgress = const $CopyWithPlaceholder(),
    Object? needToConfirmEmail = const $CopyWithPlaceholder(),
    Object? userId = const $CopyWithPlaceholder(),
  }) {
    return UserState(
      isAuthorizationInProgress:
          isAuthorizationInProgress == const $CopyWithPlaceholder() ||
                  isAuthorizationInProgress == null
              ? _value.isAuthorizationInProgress
              // ignore: cast_nullable_to_non_nullable
              : isAuthorizationInProgress as bool,
      needToConfirmEmail: needToConfirmEmail == const $CopyWithPlaceholder() ||
              needToConfirmEmail == null
          ? _value.needToConfirmEmail
          // ignore: cast_nullable_to_non_nullable
          : needToConfirmEmail as bool,
      userId: userId == const $CopyWithPlaceholder() || userId == null
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
    );
  }
}

extension $UserStateCopyWith on UserState {
  /// Returns a callable class that can be used as follows: `instanceOfUserState.copyWith(...)` or like so:`instanceOfUserState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserStateCWProxy get copyWith => _$UserStateCWProxyImpl(this);
}
