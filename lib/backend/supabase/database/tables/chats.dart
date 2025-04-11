import '../database.dart';

class ChatsTable extends SupabaseTable<ChatsRow> {
  @override
  String get tableName => 'chats';

  @override
  ChatsRow createRow(Map<String, dynamic> data) => ChatsRow(data);
}

class ChatsRow extends SupabaseDataRow {
  ChatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatsTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get myUser => getField<String>('my_user');
  set myUser(String? value) => setField<String>('my_user', value);

  String? get otherUser => getField<String>('other_user');
  set otherUser(String? value) => setField<String>('other_user', value);

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get lastMessageSenderId => getField<String>('last_message_sender_id');
  set lastMessageSenderId(String? value) =>
      setField<String>('last_message_sender_id', value);

  String? get lastMessage => getField<String>('last_message');
  set lastMessage(String? value) => setField<String>('last_message', value);

  String? get lastMessageType => getField<String>('last_message_type');
  set lastMessageType(String? value) =>
      setField<String>('last_message_type', value);

  DateTime? get lastMessageTime => getField<DateTime>('last_message_time');
  set lastMessageTime(DateTime? value) =>
      setField<DateTime>('last_message_time', value);
}
