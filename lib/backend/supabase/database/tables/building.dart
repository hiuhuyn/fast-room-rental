import '../database.dart';

class BuildingTable extends SupabaseTable<BuildingRow> {
  @override
  String get tableName => 'building';

  @override
  BuildingRow createRow(Map<String, dynamic> data) => BuildingRow(data);
}

class BuildingRow extends SupabaseDataRow {
  BuildingRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BuildingTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  bool? get pet => getField<bool>('pet');
  set pet(bool? value) => setField<bool>('pet', value);

  double? get water => getField<double>('water');
  set water(double? value) => setField<double>('water', value);

  String? get typeWater => getField<String>('type_water');
  set typeWater(String? value) => setField<String>('type_water', value);

  double? get electricity => getField<double>('electricity');
  set electricity(double? value) => setField<double>('electricity', value);

  double? get lat => getField<double>('lat');
  set lat(double? value) => setField<double>('lat', value);

  double? get lng => getField<double>('lng');
  set lng(double? value) => setField<double>('lng', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  double? get internet => getField<double>('internet');
  set internet(double? value) => setField<double>('internet', value);

  double? get services => getField<double>('services');
  set services(double? value) => setField<double>('services', value);

  int? get wardId => getField<int>('ward_id');
  set wardId(int? value) => setField<int>('ward_id', value);
}
