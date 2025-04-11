import '../database.dart';

class TrendingCitiesTable extends SupabaseTable<TrendingCitiesRow> {
  @override
  String get tableName => 'trending_cities';

  @override
  TrendingCitiesRow createRow(Map<String, dynamic> data) =>
      TrendingCitiesRow(data);
}

class TrendingCitiesRow extends SupabaseDataRow {
  TrendingCitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrendingCitiesTable();

  int? get code => getField<int>('code');
  set code(int? value) => setField<int>('code', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);

  int? get totalRooms => getField<int>('total_rooms');
  set totalRooms(int? value) => setField<int>('total_rooms', value);
}
