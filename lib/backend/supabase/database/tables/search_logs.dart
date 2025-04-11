import '../database.dart';

class SearchLogsTable extends SupabaseTable<SearchLogsRow> {
  @override
  String get tableName => 'search_logs';

  @override
  SearchLogsRow createRow(Map<String, dynamic> data) => SearchLogsRow(data);
}

class SearchLogsRow extends SupabaseDataRow {
  SearchLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SearchLogsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get searchTerm => getField<String>('search_term')!;
  set searchTerm(String value) => setField<String>('search_term', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
