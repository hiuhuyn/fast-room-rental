import '../database.dart';

class CitiesTable extends SupabaseTable<CitiesRow> {
  @override
  String get tableName => 'cities';

  @override
  CitiesRow createRow(Map<String, dynamic> data) => CitiesRow(data);
}

class CitiesRow extends SupabaseDataRow {
  CitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CitiesTable();

  int get code => getField<int>('code')!;
  set code(int value) => setField<int>('code', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
