import '../database.dart';

class MediaMessagesViewTable extends SupabaseTable<MediaMessagesViewRow> {
  @override
  String get tableName => 'media_messages_view';

  @override
  MediaMessagesViewRow createRow(Map<String, dynamic> data) =>
      MediaMessagesViewRow(data);
}

class MediaMessagesViewRow extends SupabaseDataRow {
  MediaMessagesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MediaMessagesViewTable();

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  String? get messageId => getField<String>('message_id');
  set messageId(String? value) => setField<String>('message_id', value);

  int? get mediaId => getField<int>('media_id');
  set mediaId(int? value) => setField<int>('media_id', value);

  String? get fileName => getField<String>('file_name');
  set fileName(String? value) => setField<String>('file_name', value);

  String? get blurHash => getField<String>('blur_hash');
  set blurHash(String? value) => setField<String>('blur_hash', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
