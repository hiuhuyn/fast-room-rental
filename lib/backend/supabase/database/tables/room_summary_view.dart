import '../database.dart';

class RoomSummaryViewTable extends SupabaseTable<RoomSummaryViewRow> {
  @override
  String get tableName => 'room_summary_view';

  @override
  RoomSummaryViewRow createRow(Map<String, dynamic> data) =>
      RoomSummaryViewRow(data);
}

class RoomSummaryViewRow extends SupabaseDataRow {
  RoomSummaryViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomSummaryViewTable();

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

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

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

  bool? get buildingAllowPets => getField<bool>('building_allow_pets');
  set buildingAllowPets(bool? value) =>
      setField<bool>('building_allow_pets', value);

  double? get buildingWaterFee => getField<double>('building_water_fee');
  set buildingWaterFee(double? value) =>
      setField<double>('building_water_fee', value);

  String? get buildingWaterType => getField<String>('building_water_type');
  set buildingWaterType(String? value) =>
      setField<String>('building_water_type', value);

  double? get buildingElectricityFee =>
      getField<double>('building_electricity_fee');
  set buildingElectricityFee(double? value) =>
      setField<double>('building_electricity_fee', value);

  double? get buildingInternetFee => getField<double>('building_internet_fee');
  set buildingInternetFee(double? value) =>
      setField<double>('building_internet_fee', value);

  double? get buildingServicesFee => getField<double>('building_services_fee');
  set buildingServicesFee(double? value) =>
      setField<double>('building_services_fee', value);

  String? get landlordId => getField<String>('landlord_id');
  set landlordId(String? value) => setField<String>('landlord_id', value);

  int? get totalFavorites => getField<int>('total_favorites');
  set totalFavorites(int? value) => setField<int>('total_favorites', value);

  int? get totalViews => getField<int>('total_views');
  set totalViews(int? value) => setField<int>('total_views', value);

  int? get totalBookings => getField<int>('total_bookings');
  set totalBookings(int? value) => setField<int>('total_bookings', value);

  int? get totalPosts => getField<int>('total_posts');
  set totalPosts(int? value) => setField<int>('total_posts', value);
}
