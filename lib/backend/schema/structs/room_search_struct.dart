// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RoomSearchStruct extends FFFirebaseStruct {
  RoomSearchStruct({
    String? postId,
    String? postTitle,
    String? postStatus,
    String? postCreatedAt,
    String? postUpdatedAt,
    String? roomId,
    String? roomName,
    String? roomDescription,
    String? roomStatus,
    int? roomFloor,
    int? roomType,
    int? roomHorizontal,
    int? roomVertical,
    int? roomPrice,
    String? roomTypeName,
    String? buildingId,
    String? buildingName,
    String? buildingAddress,
    String? buildingPhone,
    bool? buildingPetFriendly,
    double? buildingWaterPrice,
    String? buildingWaterType,
    double? buildingElectricityPrice,
    double? buildingLat,
    double? buildingLng,
    double? buildingInternetPrice,
    double? buildingServicesPrice,
    String? buildingOwnerId,
    String? landlordName,
    String? landlordEmail,
    String? landlordCreatedAt,
    String? landlordAvt,
    bool? userIsFav,
    int? favoriteCount,
    int? viewCount,
    int? bookingCount,
    int? totalPosts,
    String? roomImage,
    String? roomImageBlurHash,
    String? wardName,
    int? districtId,
    String? districtName,
    int? cityId,
    String? cityName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _postId = postId,
        _postTitle = postTitle,
        _postStatus = postStatus,
        _postCreatedAt = postCreatedAt,
        _postUpdatedAt = postUpdatedAt,
        _roomId = roomId,
        _roomName = roomName,
        _roomDescription = roomDescription,
        _roomStatus = roomStatus,
        _roomFloor = roomFloor,
        _roomType = roomType,
        _roomHorizontal = roomHorizontal,
        _roomVertical = roomVertical,
        _roomPrice = roomPrice,
        _roomTypeName = roomTypeName,
        _buildingId = buildingId,
        _buildingName = buildingName,
        _buildingAddress = buildingAddress,
        _buildingPhone = buildingPhone,
        _buildingPetFriendly = buildingPetFriendly,
        _buildingWaterPrice = buildingWaterPrice,
        _buildingWaterType = buildingWaterType,
        _buildingElectricityPrice = buildingElectricityPrice,
        _buildingLat = buildingLat,
        _buildingLng = buildingLng,
        _buildingInternetPrice = buildingInternetPrice,
        _buildingServicesPrice = buildingServicesPrice,
        _buildingOwnerId = buildingOwnerId,
        _landlordName = landlordName,
        _landlordEmail = landlordEmail,
        _landlordCreatedAt = landlordCreatedAt,
        _landlordAvt = landlordAvt,
        _userIsFav = userIsFav,
        _favoriteCount = favoriteCount,
        _viewCount = viewCount,
        _bookingCount = bookingCount,
        _totalPosts = totalPosts,
        _roomImage = roomImage,
        _roomImageBlurHash = roomImageBlurHash,
        _wardName = wardName,
        _districtId = districtId,
        _districtName = districtName,
        _cityId = cityId,
        _cityName = cityName,
        super(firestoreUtilData);

  // "post_id" field.
  String? _postId;
  String get postId => _postId ?? '';
  set postId(String? val) => _postId = val;

  bool hasPostId() => _postId != null;

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  set postTitle(String? val) => _postTitle = val;

  bool hasPostTitle() => _postTitle != null;

  // "post_status" field.
  String? _postStatus;
  String get postStatus => _postStatus ?? '';
  set postStatus(String? val) => _postStatus = val;

  bool hasPostStatus() => _postStatus != null;

  // "post_created_at" field.
  String? _postCreatedAt;
  String get postCreatedAt => _postCreatedAt ?? '';
  set postCreatedAt(String? val) => _postCreatedAt = val;

  bool hasPostCreatedAt() => _postCreatedAt != null;

  // "post_updated_at" field.
  String? _postUpdatedAt;
  String get postUpdatedAt => _postUpdatedAt ?? '';
  set postUpdatedAt(String? val) => _postUpdatedAt = val;

  bool hasPostUpdatedAt() => _postUpdatedAt != null;

  // "room_id" field.
  String? _roomId;
  String get roomId => _roomId ?? '';
  set roomId(String? val) => _roomId = val;

  bool hasRoomId() => _roomId != null;

  // "room_name" field.
  String? _roomName;
  String get roomName => _roomName ?? '';
  set roomName(String? val) => _roomName = val;

  bool hasRoomName() => _roomName != null;

  // "room_description" field.
  String? _roomDescription;
  String get roomDescription => _roomDescription ?? '';
  set roomDescription(String? val) => _roomDescription = val;

  bool hasRoomDescription() => _roomDescription != null;

  // "room_status" field.
  String? _roomStatus;
  String get roomStatus => _roomStatus ?? '';
  set roomStatus(String? val) => _roomStatus = val;

  bool hasRoomStatus() => _roomStatus != null;

  // "room_floor" field.
  int? _roomFloor;
  int get roomFloor => _roomFloor ?? 0;
  set roomFloor(int? val) => _roomFloor = val;

  void incrementRoomFloor(int amount) => roomFloor = roomFloor + amount;

  bool hasRoomFloor() => _roomFloor != null;

  // "room_type" field.
  int? _roomType;
  int get roomType => _roomType ?? 0;
  set roomType(int? val) => _roomType = val;

  void incrementRoomType(int amount) => roomType = roomType + amount;

  bool hasRoomType() => _roomType != null;

  // "room_horizontal" field.
  int? _roomHorizontal;
  int get roomHorizontal => _roomHorizontal ?? 0;
  set roomHorizontal(int? val) => _roomHorizontal = val;

  void incrementRoomHorizontal(int amount) =>
      roomHorizontal = roomHorizontal + amount;

  bool hasRoomHorizontal() => _roomHorizontal != null;

  // "room_vertical" field.
  int? _roomVertical;
  int get roomVertical => _roomVertical ?? 0;
  set roomVertical(int? val) => _roomVertical = val;

  void incrementRoomVertical(int amount) =>
      roomVertical = roomVertical + amount;

  bool hasRoomVertical() => _roomVertical != null;

  // "room_price" field.
  int? _roomPrice;
  int get roomPrice => _roomPrice ?? 0;
  set roomPrice(int? val) => _roomPrice = val;

  void incrementRoomPrice(int amount) => roomPrice = roomPrice + amount;

  bool hasRoomPrice() => _roomPrice != null;

  // "room_type_name" field.
  String? _roomTypeName;
  String get roomTypeName => _roomTypeName ?? '';
  set roomTypeName(String? val) => _roomTypeName = val;

  bool hasRoomTypeName() => _roomTypeName != null;

  // "building_id" field.
  String? _buildingId;
  String get buildingId => _buildingId ?? '';
  set buildingId(String? val) => _buildingId = val;

  bool hasBuildingId() => _buildingId != null;

  // "building_name" field.
  String? _buildingName;
  String get buildingName => _buildingName ?? '';
  set buildingName(String? val) => _buildingName = val;

  bool hasBuildingName() => _buildingName != null;

  // "building_address" field.
  String? _buildingAddress;
  String get buildingAddress => _buildingAddress ?? '';
  set buildingAddress(String? val) => _buildingAddress = val;

  bool hasBuildingAddress() => _buildingAddress != null;

  // "building_phone" field.
  String? _buildingPhone;
  String get buildingPhone => _buildingPhone ?? '';
  set buildingPhone(String? val) => _buildingPhone = val;

  bool hasBuildingPhone() => _buildingPhone != null;

  // "building_pet_friendly" field.
  bool? _buildingPetFriendly;
  bool get buildingPetFriendly => _buildingPetFriendly ?? false;
  set buildingPetFriendly(bool? val) => _buildingPetFriendly = val;

  bool hasBuildingPetFriendly() => _buildingPetFriendly != null;

  // "building_water_price" field.
  double? _buildingWaterPrice;
  double get buildingWaterPrice => _buildingWaterPrice ?? 0.0;
  set buildingWaterPrice(double? val) => _buildingWaterPrice = val;

  void incrementBuildingWaterPrice(double amount) =>
      buildingWaterPrice = buildingWaterPrice + amount;

  bool hasBuildingWaterPrice() => _buildingWaterPrice != null;

  // "building_water_type" field.
  String? _buildingWaterType;
  String get buildingWaterType => _buildingWaterType ?? '';
  set buildingWaterType(String? val) => _buildingWaterType = val;

  bool hasBuildingWaterType() => _buildingWaterType != null;

  // "building_electricity_price" field.
  double? _buildingElectricityPrice;
  double get buildingElectricityPrice => _buildingElectricityPrice ?? 0.0;
  set buildingElectricityPrice(double? val) => _buildingElectricityPrice = val;

  void incrementBuildingElectricityPrice(double amount) =>
      buildingElectricityPrice = buildingElectricityPrice + amount;

  bool hasBuildingElectricityPrice() => _buildingElectricityPrice != null;

  // "building_lat" field.
  double? _buildingLat;
  double get buildingLat => _buildingLat ?? 0.0;
  set buildingLat(double? val) => _buildingLat = val;

  void incrementBuildingLat(double amount) =>
      buildingLat = buildingLat + amount;

  bool hasBuildingLat() => _buildingLat != null;

  // "building_lng" field.
  double? _buildingLng;
  double get buildingLng => _buildingLng ?? 0.0;
  set buildingLng(double? val) => _buildingLng = val;

  void incrementBuildingLng(double amount) =>
      buildingLng = buildingLng + amount;

  bool hasBuildingLng() => _buildingLng != null;

  // "building_internet_price" field.
  double? _buildingInternetPrice;
  double get buildingInternetPrice => _buildingInternetPrice ?? 0.0;
  set buildingInternetPrice(double? val) => _buildingInternetPrice = val;

  void incrementBuildingInternetPrice(double amount) =>
      buildingInternetPrice = buildingInternetPrice + amount;

  bool hasBuildingInternetPrice() => _buildingInternetPrice != null;

  // "building_services_price" field.
  double? _buildingServicesPrice;
  double get buildingServicesPrice => _buildingServicesPrice ?? 0.0;
  set buildingServicesPrice(double? val) => _buildingServicesPrice = val;

  void incrementBuildingServicesPrice(double amount) =>
      buildingServicesPrice = buildingServicesPrice + amount;

  bool hasBuildingServicesPrice() => _buildingServicesPrice != null;

  // "building_owner_id" field.
  String? _buildingOwnerId;
  String get buildingOwnerId => _buildingOwnerId ?? '';
  set buildingOwnerId(String? val) => _buildingOwnerId = val;

  bool hasBuildingOwnerId() => _buildingOwnerId != null;

  // "landlord_name" field.
  String? _landlordName;
  String get landlordName => _landlordName ?? '';
  set landlordName(String? val) => _landlordName = val;

  bool hasLandlordName() => _landlordName != null;

  // "landlord_email" field.
  String? _landlordEmail;
  String get landlordEmail => _landlordEmail ?? '';
  set landlordEmail(String? val) => _landlordEmail = val;

  bool hasLandlordEmail() => _landlordEmail != null;

  // "landlord_created_at" field.
  String? _landlordCreatedAt;
  String get landlordCreatedAt => _landlordCreatedAt ?? '';
  set landlordCreatedAt(String? val) => _landlordCreatedAt = val;

  bool hasLandlordCreatedAt() => _landlordCreatedAt != null;

  // "landlord_avt" field.
  String? _landlordAvt;
  String get landlordAvt => _landlordAvt ?? '';
  set landlordAvt(String? val) => _landlordAvt = val;

  bool hasLandlordAvt() => _landlordAvt != null;

  // "user_is_fav" field.
  bool? _userIsFav;
  bool get userIsFav => _userIsFav ?? false;
  set userIsFav(bool? val) => _userIsFav = val;

  bool hasUserIsFav() => _userIsFav != null;

  // "favorite_count" field.
  int? _favoriteCount;
  int get favoriteCount => _favoriteCount ?? 0;
  set favoriteCount(int? val) => _favoriteCount = val;

  void incrementFavoriteCount(int amount) =>
      favoriteCount = favoriteCount + amount;

  bool hasFavoriteCount() => _favoriteCount != null;

  // "view_count" field.
  int? _viewCount;
  int get viewCount => _viewCount ?? 0;
  set viewCount(int? val) => _viewCount = val;

  void incrementViewCount(int amount) => viewCount = viewCount + amount;

  bool hasViewCount() => _viewCount != null;

  // "booking_count" field.
  int? _bookingCount;
  int get bookingCount => _bookingCount ?? 0;
  set bookingCount(int? val) => _bookingCount = val;

  void incrementBookingCount(int amount) =>
      bookingCount = bookingCount + amount;

  bool hasBookingCount() => _bookingCount != null;

  // "total_posts" field.
  int? _totalPosts;
  int get totalPosts => _totalPosts ?? 0;
  set totalPosts(int? val) => _totalPosts = val;

  void incrementTotalPosts(int amount) => totalPosts = totalPosts + amount;

  bool hasTotalPosts() => _totalPosts != null;

  // "room_image" field.
  String? _roomImage;
  String get roomImage => _roomImage ?? '';
  set roomImage(String? val) => _roomImage = val;

  bool hasRoomImage() => _roomImage != null;

  // "room_image_blur_hash" field.
  String? _roomImageBlurHash;
  String get roomImageBlurHash => _roomImageBlurHash ?? '';
  set roomImageBlurHash(String? val) => _roomImageBlurHash = val;

  bool hasRoomImageBlurHash() => _roomImageBlurHash != null;

  // "ward_name" field.
  String? _wardName;
  String get wardName => _wardName ?? '';
  set wardName(String? val) => _wardName = val;

  bool hasWardName() => _wardName != null;

  // "district_id" field.
  int? _districtId;
  int get districtId => _districtId ?? 0;
  set districtId(int? val) => _districtId = val;

  void incrementDistrictId(int amount) => districtId = districtId + amount;

  bool hasDistrictId() => _districtId != null;

  // "district_name" field.
  String? _districtName;
  String get districtName => _districtName ?? '';
  set districtName(String? val) => _districtName = val;

  bool hasDistrictName() => _districtName != null;

  // "city_id" field.
  int? _cityId;
  int get cityId => _cityId ?? 0;
  set cityId(int? val) => _cityId = val;

  void incrementCityId(int amount) => cityId = cityId + amount;

  bool hasCityId() => _cityId != null;

  // "city_name" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  set cityName(String? val) => _cityName = val;

  bool hasCityName() => _cityName != null;

  static RoomSearchStruct fromMap(Map<String, dynamic> data) =>
      RoomSearchStruct(
        postId: data['post_id'] as String?,
        postTitle: data['post_title'] as String?,
        postStatus: data['post_status'] as String?,
        postCreatedAt: data['post_created_at'] as String?,
        postUpdatedAt: data['post_updated_at'] as String?,
        roomId: data['room_id'] as String?,
        roomName: data['room_name'] as String?,
        roomDescription: data['room_description'] as String?,
        roomStatus: data['room_status'] as String?,
        roomFloor: castToType<int>(data['room_floor']),
        roomType: castToType<int>(data['room_type']),
        roomHorizontal: castToType<int>(data['room_horizontal']),
        roomVertical: castToType<int>(data['room_vertical']),
        roomPrice: castToType<int>(data['room_price']),
        roomTypeName: data['room_type_name'] as String?,
        buildingId: data['building_id'] as String?,
        buildingName: data['building_name'] as String?,
        buildingAddress: data['building_address'] as String?,
        buildingPhone: data['building_phone'] as String?,
        buildingPetFriendly: data['building_pet_friendly'] as bool?,
        buildingWaterPrice: castToType<double>(data['building_water_price']),
        buildingWaterType: data['building_water_type'] as String?,
        buildingElectricityPrice:
            castToType<double>(data['building_electricity_price']),
        buildingLat: castToType<double>(data['building_lat']),
        buildingLng: castToType<double>(data['building_lng']),
        buildingInternetPrice:
            castToType<double>(data['building_internet_price']),
        buildingServicesPrice:
            castToType<double>(data['building_services_price']),
        buildingOwnerId: data['building_owner_id'] as String?,
        landlordName: data['landlord_name'] as String?,
        landlordEmail: data['landlord_email'] as String?,
        landlordCreatedAt: data['landlord_created_at'] as String?,
        landlordAvt: data['landlord_avt'] as String?,
        userIsFav: data['user_is_fav'] as bool?,
        favoriteCount: castToType<int>(data['favorite_count']),
        viewCount: castToType<int>(data['view_count']),
        bookingCount: castToType<int>(data['booking_count']),
        totalPosts: castToType<int>(data['total_posts']),
        roomImage: data['room_image'] as String?,
        roomImageBlurHash: data['room_image_blur_hash'] as String?,
        wardName: data['ward_name'] as String?,
        districtId: castToType<int>(data['district_id']),
        districtName: data['district_name'] as String?,
        cityId: castToType<int>(data['city_id']),
        cityName: data['city_name'] as String?,
      );

  static RoomSearchStruct? maybeFromMap(dynamic data) => data is Map
      ? RoomSearchStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'post_id': _postId,
        'post_title': _postTitle,
        'post_status': _postStatus,
        'post_created_at': _postCreatedAt,
        'post_updated_at': _postUpdatedAt,
        'room_id': _roomId,
        'room_name': _roomName,
        'room_description': _roomDescription,
        'room_status': _roomStatus,
        'room_floor': _roomFloor,
        'room_type': _roomType,
        'room_horizontal': _roomHorizontal,
        'room_vertical': _roomVertical,
        'room_price': _roomPrice,
        'room_type_name': _roomTypeName,
        'building_id': _buildingId,
        'building_name': _buildingName,
        'building_address': _buildingAddress,
        'building_phone': _buildingPhone,
        'building_pet_friendly': _buildingPetFriendly,
        'building_water_price': _buildingWaterPrice,
        'building_water_type': _buildingWaterType,
        'building_electricity_price': _buildingElectricityPrice,
        'building_lat': _buildingLat,
        'building_lng': _buildingLng,
        'building_internet_price': _buildingInternetPrice,
        'building_services_price': _buildingServicesPrice,
        'building_owner_id': _buildingOwnerId,
        'landlord_name': _landlordName,
        'landlord_email': _landlordEmail,
        'landlord_created_at': _landlordCreatedAt,
        'landlord_avt': _landlordAvt,
        'user_is_fav': _userIsFav,
        'favorite_count': _favoriteCount,
        'view_count': _viewCount,
        'booking_count': _bookingCount,
        'total_posts': _totalPosts,
        'room_image': _roomImage,
        'room_image_blur_hash': _roomImageBlurHash,
        'ward_name': _wardName,
        'district_id': _districtId,
        'district_name': _districtName,
        'city_id': _cityId,
        'city_name': _cityName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'post_id': serializeParam(
          _postId,
          ParamType.String,
        ),
        'post_title': serializeParam(
          _postTitle,
          ParamType.String,
        ),
        'post_status': serializeParam(
          _postStatus,
          ParamType.String,
        ),
        'post_created_at': serializeParam(
          _postCreatedAt,
          ParamType.String,
        ),
        'post_updated_at': serializeParam(
          _postUpdatedAt,
          ParamType.String,
        ),
        'room_id': serializeParam(
          _roomId,
          ParamType.String,
        ),
        'room_name': serializeParam(
          _roomName,
          ParamType.String,
        ),
        'room_description': serializeParam(
          _roomDescription,
          ParamType.String,
        ),
        'room_status': serializeParam(
          _roomStatus,
          ParamType.String,
        ),
        'room_floor': serializeParam(
          _roomFloor,
          ParamType.int,
        ),
        'room_type': serializeParam(
          _roomType,
          ParamType.int,
        ),
        'room_horizontal': serializeParam(
          _roomHorizontal,
          ParamType.int,
        ),
        'room_vertical': serializeParam(
          _roomVertical,
          ParamType.int,
        ),
        'room_price': serializeParam(
          _roomPrice,
          ParamType.int,
        ),
        'room_type_name': serializeParam(
          _roomTypeName,
          ParamType.String,
        ),
        'building_id': serializeParam(
          _buildingId,
          ParamType.String,
        ),
        'building_name': serializeParam(
          _buildingName,
          ParamType.String,
        ),
        'building_address': serializeParam(
          _buildingAddress,
          ParamType.String,
        ),
        'building_phone': serializeParam(
          _buildingPhone,
          ParamType.String,
        ),
        'building_pet_friendly': serializeParam(
          _buildingPetFriendly,
          ParamType.bool,
        ),
        'building_water_price': serializeParam(
          _buildingWaterPrice,
          ParamType.double,
        ),
        'building_water_type': serializeParam(
          _buildingWaterType,
          ParamType.String,
        ),
        'building_electricity_price': serializeParam(
          _buildingElectricityPrice,
          ParamType.double,
        ),
        'building_lat': serializeParam(
          _buildingLat,
          ParamType.double,
        ),
        'building_lng': serializeParam(
          _buildingLng,
          ParamType.double,
        ),
        'building_internet_price': serializeParam(
          _buildingInternetPrice,
          ParamType.double,
        ),
        'building_services_price': serializeParam(
          _buildingServicesPrice,
          ParamType.double,
        ),
        'building_owner_id': serializeParam(
          _buildingOwnerId,
          ParamType.String,
        ),
        'landlord_name': serializeParam(
          _landlordName,
          ParamType.String,
        ),
        'landlord_email': serializeParam(
          _landlordEmail,
          ParamType.String,
        ),
        'landlord_created_at': serializeParam(
          _landlordCreatedAt,
          ParamType.String,
        ),
        'landlord_avt': serializeParam(
          _landlordAvt,
          ParamType.String,
        ),
        'user_is_fav': serializeParam(
          _userIsFav,
          ParamType.bool,
        ),
        'favorite_count': serializeParam(
          _favoriteCount,
          ParamType.int,
        ),
        'view_count': serializeParam(
          _viewCount,
          ParamType.int,
        ),
        'booking_count': serializeParam(
          _bookingCount,
          ParamType.int,
        ),
        'total_posts': serializeParam(
          _totalPosts,
          ParamType.int,
        ),
        'room_image': serializeParam(
          _roomImage,
          ParamType.String,
        ),
        'room_image_blur_hash': serializeParam(
          _roomImageBlurHash,
          ParamType.String,
        ),
        'ward_name': serializeParam(
          _wardName,
          ParamType.String,
        ),
        'district_id': serializeParam(
          _districtId,
          ParamType.int,
        ),
        'district_name': serializeParam(
          _districtName,
          ParamType.String,
        ),
        'city_id': serializeParam(
          _cityId,
          ParamType.int,
        ),
        'city_name': serializeParam(
          _cityName,
          ParamType.String,
        ),
      }.withoutNulls;

  static RoomSearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoomSearchStruct(
        postId: deserializeParam(
          data['post_id'],
          ParamType.String,
          false,
        ),
        postTitle: deserializeParam(
          data['post_title'],
          ParamType.String,
          false,
        ),
        postStatus: deserializeParam(
          data['post_status'],
          ParamType.String,
          false,
        ),
        postCreatedAt: deserializeParam(
          data['post_created_at'],
          ParamType.String,
          false,
        ),
        postUpdatedAt: deserializeParam(
          data['post_updated_at'],
          ParamType.String,
          false,
        ),
        roomId: deserializeParam(
          data['room_id'],
          ParamType.String,
          false,
        ),
        roomName: deserializeParam(
          data['room_name'],
          ParamType.String,
          false,
        ),
        roomDescription: deserializeParam(
          data['room_description'],
          ParamType.String,
          false,
        ),
        roomStatus: deserializeParam(
          data['room_status'],
          ParamType.String,
          false,
        ),
        roomFloor: deserializeParam(
          data['room_floor'],
          ParamType.int,
          false,
        ),
        roomType: deserializeParam(
          data['room_type'],
          ParamType.int,
          false,
        ),
        roomHorizontal: deserializeParam(
          data['room_horizontal'],
          ParamType.int,
          false,
        ),
        roomVertical: deserializeParam(
          data['room_vertical'],
          ParamType.int,
          false,
        ),
        roomPrice: deserializeParam(
          data['room_price'],
          ParamType.int,
          false,
        ),
        roomTypeName: deserializeParam(
          data['room_type_name'],
          ParamType.String,
          false,
        ),
        buildingId: deserializeParam(
          data['building_id'],
          ParamType.String,
          false,
        ),
        buildingName: deserializeParam(
          data['building_name'],
          ParamType.String,
          false,
        ),
        buildingAddress: deserializeParam(
          data['building_address'],
          ParamType.String,
          false,
        ),
        buildingPhone: deserializeParam(
          data['building_phone'],
          ParamType.String,
          false,
        ),
        buildingPetFriendly: deserializeParam(
          data['building_pet_friendly'],
          ParamType.bool,
          false,
        ),
        buildingWaterPrice: deserializeParam(
          data['building_water_price'],
          ParamType.double,
          false,
        ),
        buildingWaterType: deserializeParam(
          data['building_water_type'],
          ParamType.String,
          false,
        ),
        buildingElectricityPrice: deserializeParam(
          data['building_electricity_price'],
          ParamType.double,
          false,
        ),
        buildingLat: deserializeParam(
          data['building_lat'],
          ParamType.double,
          false,
        ),
        buildingLng: deserializeParam(
          data['building_lng'],
          ParamType.double,
          false,
        ),
        buildingInternetPrice: deserializeParam(
          data['building_internet_price'],
          ParamType.double,
          false,
        ),
        buildingServicesPrice: deserializeParam(
          data['building_services_price'],
          ParamType.double,
          false,
        ),
        buildingOwnerId: deserializeParam(
          data['building_owner_id'],
          ParamType.String,
          false,
        ),
        landlordName: deserializeParam(
          data['landlord_name'],
          ParamType.String,
          false,
        ),
        landlordEmail: deserializeParam(
          data['landlord_email'],
          ParamType.String,
          false,
        ),
        landlordCreatedAt: deserializeParam(
          data['landlord_created_at'],
          ParamType.String,
          false,
        ),
        landlordAvt: deserializeParam(
          data['landlord_avt'],
          ParamType.String,
          false,
        ),
        userIsFav: deserializeParam(
          data['user_is_fav'],
          ParamType.bool,
          false,
        ),
        favoriteCount: deserializeParam(
          data['favorite_count'],
          ParamType.int,
          false,
        ),
        viewCount: deserializeParam(
          data['view_count'],
          ParamType.int,
          false,
        ),
        bookingCount: deserializeParam(
          data['booking_count'],
          ParamType.int,
          false,
        ),
        totalPosts: deserializeParam(
          data['total_posts'],
          ParamType.int,
          false,
        ),
        roomImage: deserializeParam(
          data['room_image'],
          ParamType.String,
          false,
        ),
        roomImageBlurHash: deserializeParam(
          data['room_image_blur_hash'],
          ParamType.String,
          false,
        ),
        wardName: deserializeParam(
          data['ward_name'],
          ParamType.String,
          false,
        ),
        districtId: deserializeParam(
          data['district_id'],
          ParamType.int,
          false,
        ),
        districtName: deserializeParam(
          data['district_name'],
          ParamType.String,
          false,
        ),
        cityId: deserializeParam(
          data['city_id'],
          ParamType.int,
          false,
        ),
        cityName: deserializeParam(
          data['city_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RoomSearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RoomSearchStruct &&
        postId == other.postId &&
        postTitle == other.postTitle &&
        postStatus == other.postStatus &&
        postCreatedAt == other.postCreatedAt &&
        postUpdatedAt == other.postUpdatedAt &&
        roomId == other.roomId &&
        roomName == other.roomName &&
        roomDescription == other.roomDescription &&
        roomStatus == other.roomStatus &&
        roomFloor == other.roomFloor &&
        roomType == other.roomType &&
        roomHorizontal == other.roomHorizontal &&
        roomVertical == other.roomVertical &&
        roomPrice == other.roomPrice &&
        roomTypeName == other.roomTypeName &&
        buildingId == other.buildingId &&
        buildingName == other.buildingName &&
        buildingAddress == other.buildingAddress &&
        buildingPhone == other.buildingPhone &&
        buildingPetFriendly == other.buildingPetFriendly &&
        buildingWaterPrice == other.buildingWaterPrice &&
        buildingWaterType == other.buildingWaterType &&
        buildingElectricityPrice == other.buildingElectricityPrice &&
        buildingLat == other.buildingLat &&
        buildingLng == other.buildingLng &&
        buildingInternetPrice == other.buildingInternetPrice &&
        buildingServicesPrice == other.buildingServicesPrice &&
        buildingOwnerId == other.buildingOwnerId &&
        landlordName == other.landlordName &&
        landlordEmail == other.landlordEmail &&
        landlordCreatedAt == other.landlordCreatedAt &&
        landlordAvt == other.landlordAvt &&
        userIsFav == other.userIsFav &&
        favoriteCount == other.favoriteCount &&
        viewCount == other.viewCount &&
        bookingCount == other.bookingCount &&
        totalPosts == other.totalPosts &&
        roomImage == other.roomImage &&
        roomImageBlurHash == other.roomImageBlurHash &&
        wardName == other.wardName &&
        districtId == other.districtId &&
        districtName == other.districtName &&
        cityId == other.cityId &&
        cityName == other.cityName;
  }

  @override
  int get hashCode => const ListEquality().hash([
        postId,
        postTitle,
        postStatus,
        postCreatedAt,
        postUpdatedAt,
        roomId,
        roomName,
        roomDescription,
        roomStatus,
        roomFloor,
        roomType,
        roomHorizontal,
        roomVertical,
        roomPrice,
        roomTypeName,
        buildingId,
        buildingName,
        buildingAddress,
        buildingPhone,
        buildingPetFriendly,
        buildingWaterPrice,
        buildingWaterType,
        buildingElectricityPrice,
        buildingLat,
        buildingLng,
        buildingInternetPrice,
        buildingServicesPrice,
        buildingOwnerId,
        landlordName,
        landlordEmail,
        landlordCreatedAt,
        landlordAvt,
        userIsFav,
        favoriteCount,
        viewCount,
        bookingCount,
        totalPosts,
        roomImage,
        roomImageBlurHash,
        wardName,
        districtId,
        districtName,
        cityId,
        cityName
      ]);
}

RoomSearchStruct createRoomSearchStruct({
  String? postId,
  String? postTitle,
  String? postStatus,
  String? postCreatedAt,
  String? postUpdatedAt,
  String? roomId,
  String? roomName,
  String? roomDescription,
  String? roomStatus,
  int? roomFloor,
  int? roomType,
  int? roomHorizontal,
  int? roomVertical,
  int? roomPrice,
  String? roomTypeName,
  String? buildingId,
  String? buildingName,
  String? buildingAddress,
  String? buildingPhone,
  bool? buildingPetFriendly,
  double? buildingWaterPrice,
  String? buildingWaterType,
  double? buildingElectricityPrice,
  double? buildingLat,
  double? buildingLng,
  double? buildingInternetPrice,
  double? buildingServicesPrice,
  String? buildingOwnerId,
  String? landlordName,
  String? landlordEmail,
  String? landlordCreatedAt,
  String? landlordAvt,
  bool? userIsFav,
  int? favoriteCount,
  int? viewCount,
  int? bookingCount,
  int? totalPosts,
  String? roomImage,
  String? roomImageBlurHash,
  String? wardName,
  int? districtId,
  String? districtName,
  int? cityId,
  String? cityName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RoomSearchStruct(
      postId: postId,
      postTitle: postTitle,
      postStatus: postStatus,
      postCreatedAt: postCreatedAt,
      postUpdatedAt: postUpdatedAt,
      roomId: roomId,
      roomName: roomName,
      roomDescription: roomDescription,
      roomStatus: roomStatus,
      roomFloor: roomFloor,
      roomType: roomType,
      roomHorizontal: roomHorizontal,
      roomVertical: roomVertical,
      roomPrice: roomPrice,
      roomTypeName: roomTypeName,
      buildingId: buildingId,
      buildingName: buildingName,
      buildingAddress: buildingAddress,
      buildingPhone: buildingPhone,
      buildingPetFriendly: buildingPetFriendly,
      buildingWaterPrice: buildingWaterPrice,
      buildingWaterType: buildingWaterType,
      buildingElectricityPrice: buildingElectricityPrice,
      buildingLat: buildingLat,
      buildingLng: buildingLng,
      buildingInternetPrice: buildingInternetPrice,
      buildingServicesPrice: buildingServicesPrice,
      buildingOwnerId: buildingOwnerId,
      landlordName: landlordName,
      landlordEmail: landlordEmail,
      landlordCreatedAt: landlordCreatedAt,
      landlordAvt: landlordAvt,
      userIsFav: userIsFav,
      favoriteCount: favoriteCount,
      viewCount: viewCount,
      bookingCount: bookingCount,
      totalPosts: totalPosts,
      roomImage: roomImage,
      roomImageBlurHash: roomImageBlurHash,
      wardName: wardName,
      districtId: districtId,
      districtName: districtName,
      cityId: cityId,
      cityName: cityName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RoomSearchStruct? updateRoomSearchStruct(
  RoomSearchStruct? roomSearch, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    roomSearch
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRoomSearchStructData(
  Map<String, dynamic> firestoreData,
  RoomSearchStruct? roomSearch,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (roomSearch == null) {
    return;
  }
  if (roomSearch.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && roomSearch.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final roomSearchData = getRoomSearchFirestoreData(roomSearch, forFieldValue);
  final nestedData = roomSearchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = roomSearch.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRoomSearchFirestoreData(
  RoomSearchStruct? roomSearch, [
  bool forFieldValue = false,
]) {
  if (roomSearch == null) {
    return {};
  }
  final firestoreData = mapToFirestore(roomSearch.toMap());

  // Add any Firestore field values
  roomSearch.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRoomSearchListFirestoreData(
  List<RoomSearchStruct>? roomSearchs,
) =>
    roomSearchs?.map((e) => getRoomSearchFirestoreData(e, true)).toList() ?? [];
