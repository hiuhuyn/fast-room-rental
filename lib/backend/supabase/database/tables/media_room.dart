import '../database.dart';

class MediaRoomTable extends SupabaseTable<MediaRoomRow> {
  @override
  String get tableName => 'media_room';

  @override
  MediaRoomRow createRow(Map<String, dynamic> data) => MediaRoomRow(data);
}

class MediaRoomRow extends SupabaseDataRow {
  MediaRoomRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MediaRoomTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get roomId => getField<String>('room_id')!;
  set roomId(String value) => setField<String>('room_id', value);

  int get mediaId => getField<int>('media_id')!;
  set mediaId(int value) => setField<int>('media_id', value);
}
