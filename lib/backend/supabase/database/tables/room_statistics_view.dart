import '../database.dart';

class RoomStatisticsViewTable extends SupabaseTable<RoomStatisticsViewRow> {
  @override
  String get tableName => 'room_statistics_view';

  @override
  RoomStatisticsViewRow createRow(Map<String, dynamic> data) =>
      RoomStatisticsViewRow(data);
}

class RoomStatisticsViewRow extends SupabaseDataRow {
  RoomStatisticsViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomStatisticsViewTable();

  String? get buildingId => getField<String>('building_id');
  set buildingId(String? value) => setField<String>('building_id', value);

  String? get buildingName => getField<String>('building_name');
  set buildingName(String? value) => setField<String>('building_name', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get totalRooms => getField<int>('total_rooms');
  set totalRooms(int? value) => setField<int>('total_rooms', value);

  int? get availableRooms => getField<int>('available_rooms');
  set availableRooms(int? value) => setField<int>('available_rooms', value);

  int? get bookedRooms => getField<int>('booked_rooms');
  set bookedRooms(int? value) => setField<int>('booked_rooms', value);

  int? get occupiedRooms => getField<int>('occupied_rooms');
  set occupiedRooms(int? value) => setField<int>('occupied_rooms', value);

  int? get maintenanceRooms => getField<int>('maintenance_rooms');
  set maintenanceRooms(int? value) => setField<int>('maintenance_rooms', value);

  int? get unavailableRooms => getField<int>('unavailable_rooms');
  set unavailableRooms(int? value) => setField<int>('unavailable_rooms', value);

  double? get totalRevenue => getField<double>('total_revenue');
  set totalRevenue(double? value) => setField<double>('total_revenue', value);
}
