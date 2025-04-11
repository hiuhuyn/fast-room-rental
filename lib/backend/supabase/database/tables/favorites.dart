import '../database.dart';

class FavoritesTable extends SupabaseTable<FavoritesRow> {
  @override
  String get tableName => 'favorites';

  @override
  FavoritesRow createRow(Map<String, dynamic> data) => FavoritesRow(data);
}

class FavoritesRow extends SupabaseDataRow {
  FavoritesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FavoritesTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
