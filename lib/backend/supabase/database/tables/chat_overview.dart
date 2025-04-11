import '../database.dart';

class ChatOverviewTable extends SupabaseTable<ChatOverviewRow> {
  @override
  String get tableName => 'chat_overview';

  @override
  ChatOverviewRow createRow(Map<String, dynamic> data) => ChatOverviewRow(data);
}

class ChatOverviewRow extends SupabaseDataRow {
  ChatOverviewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatOverviewTable();

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get myUser => getField<String>('my_user');
  set myUser(String? value) => setField<String>('my_user', value);

  String? get otherUser => getField<String>('other_user');
  set otherUser(String? value) => setField<String>('other_user', value);

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

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

  String? get otherUserUsername => getField<String>('other_user_username');
  set otherUserUsername(String? value) =>
      setField<String>('other_user_username', value);

  String? get otherUserRole => getField<String>('other_user_role');
  set otherUserRole(String? value) =>
      setField<String>('other_user_role', value);

  String? get otherUserEmail => getField<String>('other_user_email');
  set otherUserEmail(String? value) =>
      setField<String>('other_user_email', value);

  String? get otherUserAvatar => getField<String>('other_user_avatar');
  set otherUserAvatar(String? value) =>
      setField<String>('other_user_avatar', value);
}
