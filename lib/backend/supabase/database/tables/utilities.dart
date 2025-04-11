import '../database.dart';

class UtilitiesTable extends SupabaseTable<UtilitiesRow> {
  @override
  String get tableName => 'utilities';

  @override
  UtilitiesRow createRow(Map<String, dynamic> data) => UtilitiesRow(data);
}

class UtilitiesRow extends SupabaseDataRow {
  UtilitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UtilitiesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get image => getField<String>('image');
  set image(String? value) => setField<String>('image', value);
}
