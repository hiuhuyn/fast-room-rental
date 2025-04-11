import '../database.dart';

class RoomUtilitiesViewTable extends SupabaseTable<RoomUtilitiesViewRow> {
  @override
  String get tableName => 'room_utilities_view';

  @override
  RoomUtilitiesViewRow createRow(Map<String, dynamic> data) =>
      RoomUtilitiesViewRow(data);
}

class RoomUtilitiesViewRow extends SupabaseDataRow {
  RoomUtilitiesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomUtilitiesViewTable();

  String? get roomId => getField<String>('room_id');
  set roomId(String? value) => setField<String>('room_id', value);

  int? get utilityId => getField<int>('utility_id');
  set utilityId(int? value) => setField<int>('utility_id', value);

  String? get utilityName => getField<String>('utility_name');
  set utilityName(String? value) => setField<String>('utility_name', value);

  String? get utilityImage => getField<String>('utility_image');
  set utilityImage(String? value) => setField<String>('utility_image', value);
}
