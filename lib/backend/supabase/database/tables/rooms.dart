import '../database.dart';

class RoomsTable extends SupabaseTable<RoomsRow> {
  @override
  String get tableName => 'rooms';

  @override
  RoomsRow createRow(Map<String, dynamic> data) => RoomsRow(data);
}

class RoomsRow extends SupabaseDataRow {
  RoomsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get floor => getField<int>('floor');
  set floor(int? value) => setField<int>('floor', value);

  int? get roomType => getField<int>('room_type');
  set roomType(int? value) => setField<int>('room_type', value);

  String get buidingId => getField<String>('buiding_id')!;
  set buidingId(String value) => setField<String>('buiding_id', value);

  int? get horizontal => getField<int>('horizontal');
  set horizontal(int? value) => setField<int>('horizontal', value);

  int? get vertical => getField<int>('vertical');
  set vertical(int? value) => setField<int>('vertical', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);
}
