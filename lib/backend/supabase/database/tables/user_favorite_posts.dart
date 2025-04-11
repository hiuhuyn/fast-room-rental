import '../database.dart';

class UserFavoritePostsTable extends SupabaseTable<UserFavoritePostsRow> {
  @override
  String get tableName => 'user_favorite_posts';

  @override
  UserFavoritePostsRow createRow(Map<String, dynamic> data) =>
      UserFavoritePostsRow(data);
}

class UserFavoritePostsRow extends SupabaseDataRow {
  UserFavoritePostsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFavoritePostsTable();

  String? get userFavoriteId => getField<String>('user_favorite_id');
  set userFavoriteId(String? value) =>
      setField<String>('user_favorite_id', value);

  DateTime? get userFavoriteAt => getField<DateTime>('user_favorite_at');
  set userFavoriteAt(DateTime? value) =>
      setField<DateTime>('user_favorite_at', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  String? get postTitle => getField<String>('post_title');
  set postTitle(String? value) => setField<String>('post_title', value);

  String? get postStatus => getField<String>('post_status');
  set postStatus(String? value) => setField<String>('post_status', value);

  DateTime? get postCreatedAt => getField<DateTime>('post_created_at');
  set postCreatedAt(DateTime? value) =>
      setField<DateTime>('post_created_at', value);

  DateTime? get postUpdatedAt => getField<DateTime>('post_updated_at');
  set postUpdatedAt(DateTime? value) =>
      setField<DateTime>('post_updated_at', value);

  String? get roomId => getField<String>('room_id');
  set roomId(String? value) => setField<String>('room_id', value);

  String? get roomName => getField<String>('room_name');
  set roomName(String? value) => setField<String>('room_name', value);

  String? get roomDescription => getField<String>('room_description');
  set roomDescription(String? value) =>
      setField<String>('room_description', value);

  String? get roomStatus => getField<String>('room_status');
  set roomStatus(String? value) => setField<String>('room_status', value);

  int? get roomFloor => getField<int>('room_floor');
  set roomFloor(int? value) => setField<int>('room_floor', value);

  int? get roomType => getField<int>('room_type');
  set roomType(int? value) => setField<int>('room_type', value);

  int? get roomHorizontal => getField<int>('room_horizontal');
  set roomHorizontal(int? value) => setField<int>('room_horizontal', value);

  int? get roomVertical => getField<int>('room_vertical');
  set roomVertical(int? value) => setField<int>('room_vertical', value);

  double? get roomPrice => getField<double>('room_price');
  set roomPrice(double? value) => setField<double>('room_price', value);

  String? get roomTypeName => getField<String>('room_type_name');
  set roomTypeName(String? value) => setField<String>('room_type_name', value);

  String? get buildingId => getField<String>('building_id');
  set buildingId(String? value) => setField<String>('building_id', value);

  String? get buildingName => getField<String>('building_name');
  set buildingName(String? value) => setField<String>('building_name', value);

  String? get buildingAddress => getField<String>('building_address');
  set buildingAddress(String? value) =>
      setField<String>('building_address', value);

  String? get buildingPhone => getField<String>('building_phone');
  set buildingPhone(String? value) => setField<String>('building_phone', value);

  bool? get buildingPetFriendly => getField<bool>('building_pet_friendly');
  set buildingPetFriendly(bool? value) =>
      setField<bool>('building_pet_friendly', value);

  double? get buildingWaterPrice => getField<double>('building_water_price');
  set buildingWaterPrice(double? value) =>
      setField<double>('building_water_price', value);

  String? get buildingWaterType => getField<String>('building_water_type');
  set buildingWaterType(String? value) =>
      setField<String>('building_water_type', value);

  double? get buildingElectricityPrice =>
      getField<double>('building_electricity_price');
  set buildingElectricityPrice(double? value) =>
      setField<double>('building_electricity_price', value);

  double? get buildingLat => getField<double>('building_lat');
  set buildingLat(double? value) => setField<double>('building_lat', value);

  double? get buildingLng => getField<double>('building_lng');
  set buildingLng(double? value) => setField<double>('building_lng', value);

  double? get buildingInternetPrice =>
      getField<double>('building_internet_price');
  set buildingInternetPrice(double? value) =>
      setField<double>('building_internet_price', value);

  double? get buildingServicesPrice =>
      getField<double>('building_services_price');
  set buildingServicesPrice(double? value) =>
      setField<double>('building_services_price', value);

  String? get buildingOwnerId => getField<String>('building_owner_id');
  set buildingOwnerId(String? value) =>
      setField<String>('building_owner_id', value);

  int? get buildingWardId => getField<int>('building_ward_id');
  set buildingWardId(int? value) => setField<int>('building_ward_id', value);

  String? get wardName => getField<String>('ward_name');
  set wardName(String? value) => setField<String>('ward_name', value);

  int? get districtId => getField<int>('district_id');
  set districtId(int? value) => setField<int>('district_id', value);

  String? get districtName => getField<String>('district_name');
  set districtName(String? value) => setField<String>('district_name', value);

  int? get cityId => getField<int>('city_id');
  set cityId(int? value) => setField<int>('city_id', value);

  String? get cityName => getField<String>('city_name');
  set cityName(String? value) => setField<String>('city_name', value);

  String? get landlordName => getField<String>('landlord_name');
  set landlordName(String? value) => setField<String>('landlord_name', value);

  String? get landlordEmail => getField<String>('landlord_email');
  set landlordEmail(String? value) => setField<String>('landlord_email', value);

  DateTime? get landlordCreatedAt => getField<DateTime>('landlord_created_at');
  set landlordCreatedAt(DateTime? value) =>
      setField<DateTime>('landlord_created_at', value);

  String? get landlordAvt => getField<String>('landlord_avt');
  set landlordAvt(String? value) => setField<String>('landlord_avt', value);

  bool? get userIsFav => getField<bool>('user_is_fav');
  set userIsFav(bool? value) => setField<bool>('user_is_fav', value);

  int? get favoriteCount => getField<int>('favorite_count');
  set favoriteCount(int? value) => setField<int>('favorite_count', value);

  int? get viewCount => getField<int>('view_count');
  set viewCount(int? value) => setField<int>('view_count', value);

  int? get bookingCount => getField<int>('booking_count');
  set bookingCount(int? value) => setField<int>('booking_count', value);

  int? get totalPosts => getField<int>('total_posts');
  set totalPosts(int? value) => setField<int>('total_posts', value);

  String? get roomImage => getField<String>('room_image');
  set roomImage(String? value) => setField<String>('room_image', value);

  String? get roomImageBlurHash => getField<String>('room_image_blur_hash');
  set roomImageBlurHash(String? value) =>
      setField<String>('room_image_blur_hash', value);

  dynamic get utilities => getField<dynamic>('utilities');
  set utilities(dynamic value) => setField<dynamic>('utilities', value);

  dynamic get furnishings => getField<dynamic>('furnishings');
  set furnishings(dynamic value) => setField<dynamic>('furnishings', value);
}
