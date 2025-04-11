import '../database.dart';

class PostViewConversionViewTable
    extends SupabaseTable<PostViewConversionViewRow> {
  @override
  String get tableName => 'post_view_conversion_view';

  @override
  PostViewConversionViewRow createRow(Map<String, dynamic> data) =>
      PostViewConversionViewRow(data);
}

class PostViewConversionViewRow extends SupabaseDataRow {
  PostViewConversionViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostViewConversionViewTable();

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  int? get totalViews => getField<int>('total_views');
  set totalViews(int? value) => setField<int>('total_views', value);

  double? get conversionRate => getField<double>('conversion_rate');
  set conversionRate(double? value) =>
      setField<double>('conversion_rate', value);
}
