import '../database.dart';

class DistrictsTable extends SupabaseTable<DistrictsRow> {
  @override
  String get tableName => 'districts';

  @override
  DistrictsRow createRow(Map<String, dynamic> data) => DistrictsRow(data);
}

class DistrictsRow extends SupabaseDataRow {
  DistrictsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DistrictsTable();

  int get code => getField<int>('code')!;
  set code(int value) => setField<int>('code', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  int? get provinceCode => getField<int>('province_code');
  set provinceCode(int? value) => setField<int>('province_code', value);
}
