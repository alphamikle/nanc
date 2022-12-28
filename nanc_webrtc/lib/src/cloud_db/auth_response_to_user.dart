import 'package:nanc_webrtc/src/sea_table/user_dto.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

extension AuthResponseToUser on AuthResponse {
  UserDto toUser() {
    if (user == null) {
      throw Exception('Not found user');
    }

    return UserDto(
      id: user!.id,
      email: user!.email!,
      confirmed: user!.emailConfirmedAt != null,
    );
  }
}
