import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseApi {
  SupabaseApi._(this._client);

  static Future<SupabaseApi> create({
    required String supabaseUrl,
    required String supabaseKey,
  }) async {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

    return SupabaseApi._(Supabase.instance.client);
  }

  final SupabaseClient _client;

  SupabaseClient get client => _client;
}
