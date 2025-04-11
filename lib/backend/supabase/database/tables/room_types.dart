import '../database.dart';

class RoomTypesTable extends SupabaseTable<RoomTypesRow> {
  @override
  String get tableName => 'room_types';

  @override
  RoomTypesRow createRow(Map<String, dynamic> data) => RoomTypesRow(data);
}

class RoomTypesRow extends SupabaseDataRow {
  RoomTypesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoomTypesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get fileName => getField<String>('file_name');
  set fileName(String? value) => setField<String>('file_name', value);
}
