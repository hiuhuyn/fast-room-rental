import '../database.dart';

class WardsTable extends SupabaseTable<WardsRow> {
  @override
  String get tableName => 'wards';

  @override
  WardsRow createRow(Map<String, dynamic> data) => WardsRow(data);
}

class WardsRow extends SupabaseDataRow {
  WardsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => WardsTable();

  int get code => getField<int>('code')!;
  set code(int value) => setField<int>('code', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  String? get codeName => getField<String>('code_name');
  set codeName(String? value) => setField<String>('code_name', value);

  int? get districtCode => getField<int>('district_code');
  set districtCode(int? value) => setField<int>('district_code', value);
}
