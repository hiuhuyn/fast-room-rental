import '../database.dart';

class TrendingSearchesTable extends SupabaseTable<TrendingSearchesRow> {
  @override
  String get tableName => 'trending_searches';

  @override
  TrendingSearchesRow createRow(Map<String, dynamic> data) =>
      TrendingSearchesRow(data);
}

class TrendingSearchesRow extends SupabaseDataRow {
  TrendingSearchesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrendingSearchesTable();

  String? get searchTerm => getField<String>('search_term');
  set searchTerm(String? value) => setField<String>('search_term', value);

  int? get totalSearches => getField<int>('total_searches');
  set totalSearches(int? value) => setField<int>('total_searches', value);
}
