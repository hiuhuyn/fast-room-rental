import '../database.dart';

class RoomFurnishingsViewTable extends SupabaseTable<RoomFurnishingsViewRow> {
  @override
  String get tableName => 'room_furnishings_view';

  @override
  RoomFurnishingsViewRow createRow(Map<String, dynamic> data) =>
      RoomFurnishingsViewRow(data);
}

class RoomFurnishingsViewRow extends SupabaseDataRow {
  RoomFurnishingsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomFurnishingsViewTable();

  String? get roomId => getField<String>('room_id');
  set roomId(String? value) => setField<String>('room_id', value);

  int? get furnishingId => getField<int>('furnishing_id');
  set furnishingId(int? value) => setField<int>('furnishing_id', value);

  String? get furnishingName => getField<String>('furnishing_name');
  set furnishingName(String? value) =>
      setField<String>('furnishing_name', value);

  String? get furnishingImage => getField<String>('furnishing_image');
  set furnishingImage(String? value) =>
      setField<String>('furnishing_image', value);
}
