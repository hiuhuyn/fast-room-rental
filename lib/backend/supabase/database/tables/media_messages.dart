import '../database.dart';

class MediaMessagesTable extends SupabaseTable<MediaMessagesRow> {
  @override
  String get tableName => 'media_messages';

  @override
  MediaMessagesRow createRow(Map<String, dynamic> data) =>
      MediaMessagesRow(data);
}

class MediaMessagesRow extends SupabaseDataRow {
  MediaMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MediaMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get messageId => getField<String>('message_id')!;
  set messageId(String value) => setField<String>('message_id', value);

  int get mediaId => getField<int>('media_id')!;
  set mediaId(int value) => setField<int>('media_id', value);
}
