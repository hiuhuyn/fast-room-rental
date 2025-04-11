import '../database.dart';

class UserPostStatisticsTable extends SupabaseTable<UserPostStatisticsRow> {
  @override
  String get tableName => 'user_post_statistics';

  @override
  UserPostStatisticsRow createRow(Map<String, dynamic> data) =>
      UserPostStatisticsRow(data);
}

class UserPostStatisticsRow extends SupabaseDataRow {
  UserPostStatisticsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserPostStatisticsTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get activePosts => getField<int>('active_posts');
  set activePosts(int? value) => setField<int>('active_posts', value);

  int? get expiredPosts => getField<int>('expired_posts');
  set expiredPosts(int? value) => setField<int>('expired_posts', value);

  double? get totalContacts => getField<double>('total_contacts');
  set totalContacts(double? value) => setField<double>('total_contacts', value);

  double? get totalViews => getField<double>('total_views');
  set totalViews(double? value) => setField<double>('total_views', value);

  double? get avgConversionRate => getField<double>('avg_conversion_rate');
  set avgConversionRate(double? value) =>
      setField<double>('avg_conversion_rate', value);
}
