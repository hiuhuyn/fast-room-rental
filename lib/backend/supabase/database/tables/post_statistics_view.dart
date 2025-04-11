import '../database.dart';

class PostStatisticsViewTable extends SupabaseTable<PostStatisticsViewRow> {
  @override
  String get tableName => 'post_statistics_view';

  @override
  PostStatisticsViewRow createRow(Map<String, dynamic> data) =>
      PostStatisticsViewRow(data);
}

class PostStatisticsViewRow extends SupabaseDataRow {
  PostStatisticsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostStatisticsViewTable();

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get postTitle => getField<String>('post_title');
  set postTitle(String? value) => setField<String>('post_title', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get expiredAt => getField<DateTime>('expired_at');
  set expiredAt(DateTime? value) => setField<DateTime>('expired_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get activePosts => getField<int>('active_posts');
  set activePosts(int? value) => setField<int>('active_posts', value);

  int? get expiredPosts => getField<int>('expired_posts');
  set expiredPosts(int? value) => setField<int>('expired_posts', value);

  int? get contactCount => getField<int>('contact_count');
  set contactCount(int? value) => setField<int>('contact_count', value);

  int? get viewCount => getField<int>('view_count');
  set viewCount(int? value) => setField<int>('view_count', value);

  int? get bookingCount => getField<int>('booking_count');
  set bookingCount(int? value) => setField<int>('booking_count', value);

  double? get conversionRate => getField<double>('conversion_rate');
  set conversionRate(double? value) =>
      setField<double>('conversion_rate', value);
}
