import '../database.dart';

class VerificationCodesTable extends SupabaseTable<VerificationCodesRow> {
  @override
  String get tableName => 'verification_codes';

  @override
  VerificationCodesRow createRow(Map<String, dynamic> data) =>
      VerificationCodesRow(data);
}

class VerificationCodesRow extends SupabaseDataRow {
  VerificationCodesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VerificationCodesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get code => getField<String>('code')!;
  set code(String value) => setField<String>('code', value);

  DateTime get expiresAt => getField<DateTime>('expires_at')!;
  set expiresAt(DateTime value) => setField<DateTime>('expires_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
