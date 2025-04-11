import '../database.dart';

class FurnishingsTable extends SupabaseTable<FurnishingsRow> {
  @override
  String get tableName => 'furnishings';

  @override
  FurnishingsRow createRow(Map<String, dynamic> data) => FurnishingsRow(data);
}

class FurnishingsRow extends SupabaseDataRow {
  FurnishingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FurnishingsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
