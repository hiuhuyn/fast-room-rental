import '../database.dart';

class MessagesViewTable extends SupabaseTable<MessagesViewRow> {
  @override
  String get tableName => 'messages_view';

  @override
  MessagesViewRow createRow(Map<String, dynamic> data) => MessagesViewRow(data);
}

class MessagesViewRow extends SupabaseDataRow {
  MessagesViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessagesViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get senderId => getField<String>('sender_id');
  set senderId(String? value) => setField<String>('sender_id', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get chatId => getField<String>('chat_id');
  set chatId(String? value) => setField<String>('chat_id', value);

  String? get fileName => getField<String>('file_name');
  set fileName(String? value) => setField<String>('file_name', value);

  String? get blurHash => getField<String>('blur_hash');
  set blurHash(String? value) => setField<String>('blur_hash', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);
}
