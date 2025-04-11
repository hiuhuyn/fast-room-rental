import '../database.dart';

class MediaRoomViewTable extends SupabaseTable<MediaRoomViewRow> {
  @override
  String get tableName => 'media_room_view';

  @override
  MediaRoomViewRow createRow(Map<String, dynamic> data) =>
      MediaRoomViewRow(data);
}

class MediaRoomViewRow extends SupabaseDataRow {
  MediaRoomViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MediaRoomViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get roomId => getField<String>('room_id');
  set roomId(String? value) => setField<String>('room_id', value);

  int? get mediaId => getField<int>('media_id');
  set mediaId(int? value) => setField<int>('media_id', value);

  String? get fileName => getField<String>('file_name');
  set fileName(String? value) => setField<String>('file_name', value);

  String? get blurHash => getField<String>('blur_hash');
  set blurHash(String? value) => setField<String>('blur_hash', value);
}
