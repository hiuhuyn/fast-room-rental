import '../database.dart';

class BookingsViewTable extends SupabaseTable<BookingsViewRow> {
  @override
  String get tableName => 'bookings_view';

  @override
  BookingsViewRow createRow(Map<String, dynamic> data) => BookingsViewRow(data);
}

class BookingsViewRow extends SupabaseDataRow {
  BookingsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BookingsViewTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get postId => getField<String>('post_id');
  set postId(String? value) => setField<String>('post_id', value);

  DateTime? get appointmentTime => getField<DateTime>('appointment_time');
  set appointmentTime(DateTime? value) =>
      setField<DateTime>('appointment_time', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get note => getField<String>('note');
  set note(String? value) => setField<String>('note', value);

  String? get reasonForCancel => getField<String>('reason_for_cancel');
  set reasonForCancel(String? value) =>
      setField<String>('reason_for_cancel', value);

  String? get postTitle => getField<String>('post_title');
  set postTitle(String? value) => setField<String>('post_title', value);

  String? get roomImageUrl => getField<String>('room_image_url');
  set roomImageUrl(String? value) => setField<String>('room_image_url', value);

  String? get buildingAddress => getField<String>('building_address');
  set buildingAddress(String? value) =>
      setField<String>('building_address', value);

  int? get wardCode => getField<int>('ward_code');
  set wardCode(int? value) => setField<int>('ward_code', value);

  String? get wardName => getField<String>('ward_name');
  set wardName(String? value) => setField<String>('ward_name', value);

  String? get districtName => getField<String>('district_name');
  set districtName(String? value) => setField<String>('district_name', value);

  String? get cityName => getField<String>('city_name');
  set cityName(String? value) => setField<String>('city_name', value);

  String? get tenantName => getField<String>('tenant_name');
  set tenantName(String? value) => setField<String>('tenant_name', value);

  String? get landlordName => getField<String>('landlord_name');
  set landlordName(String? value) => setField<String>('landlord_name', value);

  String? get landlordAvatar => getField<String>('landlord_avatar');
  set landlordAvatar(String? value) =>
      setField<String>('landlord_avatar', value);

  String? get landlordPhone => getField<String>('landlord_phone');
  set landlordPhone(String? value) => setField<String>('landlord_phone', value);

  String? get landlordId => getField<String>('landlord_id');
  set landlordId(String? value) => setField<String>('landlord_id', value);
}
