import '../database.dart';

class RoomFurnishingsTable extends SupabaseTable<RoomFurnishingsRow> {
  @override
  String get tableName => 'room_furnishings';

  @override
  RoomFurnishingsRow createRow(Map<String, dynamic> data) =>
      RoomFurnishingsRow(data);
}

class RoomFurnishingsRow extends SupabaseDataRow {
  RoomFurnishingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomFurnishingsTable();

  String get roomId => getField<String>('room_id')!;
  set roomId(String value) => setField<String>('room_id', value);

  int get furnishingId => getField<int>('furnishing_id')!;
  set furnishingId(int value) => setField<int>('furnishing_id', value);
}
