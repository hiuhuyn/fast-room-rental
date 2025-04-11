import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_userInfo')) {
        try {
          final serializedData = prefs.getString('ff_userInfo') ?? '{}';
          _userInfo =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _tokenFCM = prefs.getString('ff_tokenFCM') ?? _tokenFCM;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  PageTagNavigationBar? _pageTag;
  PageTagNavigationBar? get pageTag => _pageTag;
  set pageTag(PageTagNavigationBar? value) {
    _pageTag = value;
  }

  UserStruct _userInfo = UserStruct();
  UserStruct get userInfo => _userInfo;
  set userInfo(UserStruct value) {
    _userInfo = value;
    prefs.setString('ff_userInfo', value.serialize());
  }

  void updateUserInfoStruct(Function(UserStruct) updateFn) {
    updateFn(_userInfo);
    prefs.setString('ff_userInfo', _userInfo.serialize());
  }

  String _emailSendCode = '';
  String get emailSendCode => _emailSendCode;
  set emailSendCode(String value) {
    _emailSendCode = value;
  }

  String _code = '';
  String get code => _code;
  set code(String value) {
    _code = value;
  }

  List<dynamic> _roomStatusMap = [
    jsonDecode('{\"key\":\"available\",\"value\":\"Còn trống\"}'),
    jsonDecode('{\"key\":\"booked\",\"value\":\"Đã có người đặt\"}'),
    jsonDecode('{\"key\":\"occupied\",\"value\":\"Đã thuê\"}'),
    jsonDecode('{\"key\":\"under_maintenance\",\"value\":\"Đang bảo trì\"}'),
    jsonDecode('{\"key\":\"unavailable\",\"value\":\"Không khả dụngì\"}')
  ];
  List<dynamic> get roomStatusMap => _roomStatusMap;
  set roomStatusMap(List<dynamic> value) {
    _roomStatusMap = value;
  }

  void addToRoomStatusMap(dynamic value) {
    roomStatusMap.add(value);
  }

  void removeFromRoomStatusMap(dynamic value) {
    roomStatusMap.remove(value);
  }

  void removeAtIndexFromRoomStatusMap(int index) {
    roomStatusMap.removeAt(index);
  }

  void updateRoomStatusMapAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    roomStatusMap[index] = updateFn(_roomStatusMap[index]);
  }

  void insertAtIndexInRoomStatusMap(int index, dynamic value) {
    roomStatusMap.insert(index, value);
  }

  String _tokenFCM = '';
  String get tokenFCM => _tokenFCM;
  set tokenFCM(String value) {
    _tokenFCM = value;
    prefs.setString('ff_tokenFCM', value);
  }

  final _utilitiesQueryManager = FutureRequestManager<List<UtilitiesRow>>();
  Future<List<UtilitiesRow>> utilitiesQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UtilitiesRow>> Function() requestFn,
  }) =>
      _utilitiesQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUtilitiesQueryCache() => _utilitiesQueryManager.clear();
  void clearUtilitiesQueryCacheKey(String? uniqueKey) =>
      _utilitiesQueryManager.clearRequest(uniqueKey);

  final _furnishingsQueryManager = FutureRequestManager<List<FurnishingsRow>>();
  Future<List<FurnishingsRow>> furnishingsQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<FurnishingsRow>> Function() requestFn,
  }) =>
      _furnishingsQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearFurnishingsQueryCache() => _furnishingsQueryManager.clear();
  void clearFurnishingsQueryCacheKey(String? uniqueKey) =>
      _furnishingsQueryManager.clearRequest(uniqueKey);

  final _userInforManager = FutureRequestManager<List<UserInfoViewRow>>();
  Future<List<UserInfoViewRow>> userInfor({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UserInfoViewRow>> Function() requestFn,
  }) =>
      _userInforManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserInforCache() => _userInforManager.clear();
  void clearUserInforCacheKey(String? uniqueKey) =>
      _userInforManager.clearRequest(uniqueKey);

  final _cityManager = FutureRequestManager<List<CitiesRow>>();
  Future<List<CitiesRow>> city({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CitiesRow>> Function() requestFn,
  }) =>
      _cityManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCityCache() => _cityManager.clear();
  void clearCityCacheKey(String? uniqueKey) =>
      _cityManager.clearRequest(uniqueKey);

  final _roomTypesManager = FutureRequestManager<List<RoomTypesRow>>();
  Future<List<RoomTypesRow>> roomTypes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<RoomTypesRow>> Function() requestFn,
  }) =>
      _roomTypesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRoomTypesCache() => _roomTypesManager.clear();
  void clearRoomTypesCacheKey(String? uniqueKey) =>
      _roomTypesManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
