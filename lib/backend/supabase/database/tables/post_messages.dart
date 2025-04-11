import '../database.dart';

class PostMessagesTable extends SupabaseTable<PostMessagesRow> {
  @override
  String get tableName => 'post_messages';

  @override
  PostMessagesRow createRow(Map<String, dynamic> data) => PostMessagesRow(data);
}

class PostMessagesRow extends SupabaseDataRow {
  PostMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get messageId => getField<String>('message_id')!;
  set messageId(String value) => setField<String>('message_id', value);
}
