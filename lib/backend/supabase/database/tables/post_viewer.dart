import '../database.dart';

class PostViewerTable extends SupabaseTable<PostViewerRow> {
  @override
  String get tableName => 'post_viewer';

  @override
  PostViewerRow createRow(Map<String, dynamic> data) => PostViewerRow(data);
}

class PostViewerRow extends SupabaseDataRow {
  PostViewerRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostViewerTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get viewedAt => getField<DateTime>('viewed_at');
  set viewedAt(DateTime? value) => setField<DateTime>('viewed_at', value);

  String get postId => getField<String>('post_id')!;
  set postId(String value) => setField<String>('post_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);
}
