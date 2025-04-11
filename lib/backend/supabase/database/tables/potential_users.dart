import '../database.dart';

class PotentialUsersTable extends SupabaseTable<PotentialUsersRow> {
  @override
  String get tableName => 'potential_users';

  @override
  PotentialUsersRow createRow(Map<String, dynamic> data) =>
      PotentialUsersRow(data);
}

class PotentialUsersRow extends SupabaseDataRow {
  PotentialUsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PotentialUsersTable();

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

  String? get landlordId => getField<String>('landlord_id');
  set landlordId(String? value) => setField<String>('landlord_id', value);

  String? get avtFileName => getField<String>('avt_file_name');
  set avtFileName(String? value) => setField<String>('avt_file_name', value);

  String? get avtBlurHash => getField<String>('avt_blur_hash');
  set avtBlurHash(String? value) => setField<String>('avt_blur_hash', value);

  DateTime? get favoriteAt => getField<DateTime>('favorite_at');
  set favoriteAt(DateTime? value) => setField<DateTime>('favorite_at', value);
}
