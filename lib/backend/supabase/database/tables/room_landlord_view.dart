import '../database.dart';

class RoomLandlordViewTable extends SupabaseTable<RoomLandlordViewRow> {
  @override
  String get tableName => 'room_landlord_view';

  @override
  RoomLandlordViewRow createRow(Map<String, dynamic> data) =>
      RoomLandlordViewRow(data);
}

class RoomLandlordViewRow extends SupabaseDataRow {
  RoomLandlordViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomLandlordViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

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

  int? get horizontal => getField<int>('horizontal');
  set horizontal(int? value) => setField<int>('horizontal', value);

  int? get vertical => getField<int>('vertical');
  set vertical(int? value) => setField<int>('vertical', value);

  String? get buidingId => getField<String>('buiding_id');
  set buidingId(String? value) => setField<String>('buiding_id', value);

  int? get roomType => getField<int>('room_type');
  set roomType(int? value) => setField<int>('room_type', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  String? get buildingName => getField<String>('building_name');
  set buildingName(String? value) => setField<String>('building_name', value);

  String? get roomTypeName => getField<String>('room_type_name');
  set roomTypeName(String? value) => setField<String>('room_type_name', value);
}
