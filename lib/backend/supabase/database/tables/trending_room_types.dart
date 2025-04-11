import '../database.dart';

class TrendingRoomTypesTable extends SupabaseTable<TrendingRoomTypesRow> {
  @override
  String get tableName => 'trending_room_types';

  @override
  TrendingRoomTypesRow createRow(Map<String, dynamic> data) =>
      TrendingRoomTypesRow(data);
}

class TrendingRoomTypesRow extends SupabaseDataRow {
  TrendingRoomTypesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrendingRoomTypesTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get fileName => getField<String>('file_name');
  set fileName(String? value) => setField<String>('file_name', value);

  int? get totalSearches => getField<int>('total_searches');
  set totalSearches(int? value) => setField<int>('total_searches', value);
}
