import '../database.dart';

class RoomUtilitiesTable extends SupabaseTable<RoomUtilitiesRow> {
  @override
  String get tableName => 'room_utilities';

  @override
  RoomUtilitiesRow createRow(Map<String, dynamic> data) =>
      RoomUtilitiesRow(data);
}

class RoomUtilitiesRow extends SupabaseDataRow {
  RoomUtilitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomUtilitiesTable();

  String get roomId => getField<String>('room_id')!;
  set roomId(String value) => setField<String>('room_id', value);

  int get utilityId => getField<int>('utility_id')!;
  set utilityId(int value) => setField<int>('utility_id', value);
}
