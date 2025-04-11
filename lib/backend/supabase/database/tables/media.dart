import '../database.dart';

class MediaTable extends SupabaseTable<MediaRow> {
  @override
  String get tableName => 'media';

  @override
  MediaRow createRow(Map<String, dynamic> data) => MediaRow(data);
}

class MediaRow extends SupabaseDataRow {
  MediaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MediaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get fileName => getField<String>('file_name')!;
  set fileName(String value) => setField<String>('file_name', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get blurHash => getField<String>('blur_hash');
  set blurHash(String? value) => setField<String>('blur_hash', value);
}
