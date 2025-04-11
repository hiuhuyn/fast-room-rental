import '../database.dart';

class UserInfoViewTable extends SupabaseTable<UserInfoViewRow> {
  @override
  String get tableName => 'user_info_view';

  @override
  UserInfoViewRow createRow(Map<String, dynamic> data) => UserInfoViewRow(data);
}

class UserInfoViewRow extends SupabaseDataRow {
  UserInfoViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserInfoViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);

  String? get role => getField<String>('role');
  set role(String? value) => setField<String>('role', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get avtId => getField<int>('avt_id');
  set avtId(int? value) => setField<int>('avt_id', value);

  String? get avtFileName => getField<String>('avt_file_name');
  set avtFileName(String? value) => setField<String>('avt_file_name', value);

  String? get avtBlurHash => getField<String>('avt_blur_hash');
  set avtBlurHash(String? value) => setField<String>('avt_blur_hash', value);

  int? get totalPosts => getField<int>('total_posts');
  set totalPosts(int? value) => setField<int>('total_posts', value);

  int? get totalRooms => getField<int>('total_rooms');
  set totalRooms(int? value) => setField<int>('total_rooms', value);

  int? get totalBuildings => getField<int>('total_buildings');
  set totalBuildings(int? value) => setField<int>('total_buildings', value);
}
