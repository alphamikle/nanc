import 'dart:async';

import 'package:model/model.dart';
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

  SupabaseQueryBuilder getBuilder(Model model) => _client.from(model.id);

  PostgrestFilterBuilder<dynamic> getSelection({required Model model, required List<String> subset}) {
    final SupabaseQueryBuilder builder = getBuilder(model);
    final String effectiveSubset = subset.isEmpty ? '*' : subset.join(', ');
    final PostgrestFilterBuilder<dynamic> selection = builder.select(effectiveSubset, const FetchOptions(count: CountOption.exact));
    return selection;
  }
}
