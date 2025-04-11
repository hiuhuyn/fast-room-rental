// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomStruct extends FFFirebaseStruct {
  RoomStruct({
    int? id,
    int? user,
    String? description,
    List<String>? images,
    String? title,
    int? price,
    String? address,
    LocationStruct? location,
    String? phone,
    int? floor,
    int? acreage,
    int? numberPeoples,
    int? deposit,
    int? electricity,
    int? water,
    int? intetnet,
    int? generalServices,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _user = user,
        _description = description,
        _images = images,
        _title = title,
        _price = price,
        _address = address,
        _location = location,
        _phone = phone,
        _floor = floor,
        _acreage = acreage,
        _numberPeoples = numberPeoples,
        _deposit = deposit,
        _electricity = electricity,
        _water = water,
        _intetnet = intetnet,
        _generalServices = generalServices,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "user" field.
  int? _user;
  int get user => _user ?? 0;
  set user(int? val) => _user = val;

  void incrementUser(int amount) => user = user + amount;

  bool hasUser() => _user != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;

  void updateImages(Function(List<String>) updateFn) {
    updateFn(_images ??= []);
  }

  bool hasImages() => _images != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "location" field.
  LocationStruct? _location;
  LocationStruct get location => _location ?? LocationStruct();
  set location(LocationStruct? val) => _location = val;

  void updateLocation(Function(LocationStruct) updateFn) {
    updateFn(_location ??= LocationStruct());
  }

  bool hasLocation() => _location != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  set phone(String? val) => _phone = val;

  bool hasPhone() => _phone != null;

  // "floor" field.
  int? _floor;
  int get floor => _floor ?? 0;
  set floor(int? val) => _floor = val;

  void incrementFloor(int amount) => floor = floor + amount;

  bool hasFloor() => _floor != null;

  // "acreage" field.
  int? _acreage;
  int get acreage => _acreage ?? 0;
  set acreage(int? val) => _acreage = val;

  void incrementAcreage(int amount) => acreage = acreage + amount;

  bool hasAcreage() => _acreage != null;

  // "number-peoples" field.
  int? _numberPeoples;
  int get numberPeoples => _numberPeoples ?? 0;
  set numberPeoples(int? val) => _numberPeoples = val;

  void incrementNumberPeoples(int amount) =>
      numberPeoples = numberPeoples + amount;

  bool hasNumberPeoples() => _numberPeoples != null;

  // "deposit" field.
  int? _deposit;
  int get deposit => _deposit ?? 0;
  set deposit(int? val) => _deposit = val;

  void incrementDeposit(int amount) => deposit = deposit + amount;

  bool hasDeposit() => _deposit != null;

  // "electricity" field.
  int? _electricity;
  int get electricity => _electricity ?? 0;
  set electricity(int? val) => _electricity = val;

  void incrementElectricity(int amount) => electricity = electricity + amount;

  bool hasElectricity() => _electricity != null;

  // "water" field.
  int? _water;
  int get water => _water ?? 0;
  set water(int? val) => _water = val;

  void incrementWater(int amount) => water = water + amount;

  bool hasWater() => _water != null;

  // "intetnet" field.
  int? _intetnet;
  int get intetnet => _intetnet ?? 0;
  set intetnet(int? val) => _intetnet = val;

  void incrementIntetnet(int amount) => intetnet = intetnet + amount;

  bool hasIntetnet() => _intetnet != null;

  // "general-services" field.
  int? _generalServices;
  int get generalServices => _generalServices ?? 0;
  set generalServices(int? val) => _generalServices = val;

  void incrementGeneralServices(int amount) =>
      generalServices = generalServices + amount;

  bool hasGeneralServices() => _generalServices != null;

  static RoomStruct fromMap(Map<String, dynamic> data) => RoomStruct(
        id: castToType<int>(data['id']),
        user: castToType<int>(data['user']),
        description: data['description'] as String?,
        images: getDataList(data['images']),
        title: data['title'] as String?,
        price: castToType<int>(data['price']),
        address: data['address'] as String?,
        location: data['location'] is LocationStruct
            ? data['location']
            : LocationStruct.maybeFromMap(data['location']),
        phone: data['phone'] as String?,
        floor: castToType<int>(data['floor']),
        acreage: castToType<int>(data['acreage']),
        numberPeoples: castToType<int>(data['number-peoples']),
        deposit: castToType<int>(data['deposit']),
        electricity: castToType<int>(data['electricity']),
        water: castToType<int>(data['water']),
        intetnet: castToType<int>(data['intetnet']),
        generalServices: castToType<int>(data['general-services']),
      );

  static RoomStruct? maybeFromMap(dynamic data) =>
      data is Map ? RoomStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'user': _user,
        'description': _description,
        'images': _images,
        'title': _title,
        'price': _price,
        'address': _address,
        'location': _location?.toMap(),
        'phone': _phone,
        'floor': _floor,
        'acreage': _acreage,
        'number-peoples': _numberPeoples,
        'deposit': _deposit,
        'electricity': _electricity,
        'water': _water,
        'intetnet': _intetnet,
        'general-services': _generalServices,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'user': serializeParam(
          _user,
          ParamType.int,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          isList: true,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.DataStruct,
        ),
        'phone': serializeParam(
          _phone,
          ParamType.String,
        ),
        'floor': serializeParam(
          _floor,
          ParamType.int,
        ),
        'acreage': serializeParam(
          _acreage,
          ParamType.int,
        ),
        'number-peoples': serializeParam(
          _numberPeoples,
          ParamType.int,
        ),
        'deposit': serializeParam(
          _deposit,
          ParamType.int,
        ),
        'electricity': serializeParam(
          _electricity,
          ParamType.int,
        ),
        'water': serializeParam(
          _water,
          ParamType.int,
        ),
        'intetnet': serializeParam(
          _intetnet,
          ParamType.int,
        ),
        'general-services': serializeParam(
          _generalServices,
          ParamType.int,
        ),
      }.withoutNulls;

  static RoomStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoomStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        user: deserializeParam(
          data['user'],
          ParamType.int,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        location: deserializeStructParam(
          data['location'],
          ParamType.DataStruct,
          false,
          structBuilder: LocationStruct.fromSerializableMap,
        ),
        phone: deserializeParam(
          data['phone'],
          ParamType.String,
          false,
        ),
        floor: deserializeParam(
          data['floor'],
          ParamType.int,
          false,
        ),
        acreage: deserializeParam(
          data['acreage'],
          ParamType.int,
          false,
        ),
        numberPeoples: deserializeParam(
          data['number-peoples'],
          ParamType.int,
          false,
        ),
        deposit: deserializeParam(
          data['deposit'],
          ParamType.int,
          false,
        ),
        electricity: deserializeParam(
          data['electricity'],
          ParamType.int,
          false,
        ),
        water: deserializeParam(
          data['water'],
          ParamType.int,
          false,
        ),
        intetnet: deserializeParam(
          data['intetnet'],
          ParamType.int,
          false,
        ),
        generalServices: deserializeParam(
          data['general-services'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RoomStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RoomStruct &&
        id == other.id &&
        user == other.user &&
        description == other.description &&
        listEquality.equals(images, other.images) &&
        title == other.title &&
        price == other.price &&
        address == other.address &&
        location == other.location &&
        phone == other.phone &&
        floor == other.floor &&
        acreage == other.acreage &&
        numberPeoples == other.numberPeoples &&
        deposit == other.deposit &&
        electricity == other.electricity &&
        water == other.water &&
        intetnet == other.intetnet &&
        generalServices == other.generalServices;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        user,
        description,
        images,
        title,
        price,
        address,
        location,
        phone,
        floor,
        acreage,
        numberPeoples,
        deposit,
        electricity,
        water,
        intetnet,
        generalServices
      ]);
}

RoomStruct createRoomStruct({
  int? id,
  int? user,
  String? description,
  String? title,
  int? price,
  String? address,
  LocationStruct? location,
  String? phone,
  int? floor,
  int? acreage,
  int? numberPeoples,
  int? deposit,
  int? electricity,
  int? water,
  int? intetnet,
  int? generalServices,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RoomStruct(
      id: id,
      user: user,
      description: description,
      title: title,
      price: price,
      address: address,
      location: location ?? (clearUnsetFields ? LocationStruct() : null),
      phone: phone,
      floor: floor,
      acreage: acreage,
      numberPeoples: numberPeoples,
      deposit: deposit,
      electricity: electricity,
      water: water,
      intetnet: intetnet,
      generalServices: generalServices,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RoomStruct? updateRoomStruct(
  RoomStruct? room, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    room
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRoomStructData(
  Map<String, dynamic> firestoreData,
  RoomStruct? room,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (room == null) {
    return;
  }
  if (room.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && room.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final roomData = getRoomFirestoreData(room, forFieldValue);
  final nestedData = roomData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = room.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRoomFirestoreData(
  RoomStruct? room, [
  bool forFieldValue = false,
]) {
  if (room == null) {
    return {};
  }
  final firestoreData = mapToFirestore(room.toMap());

  // Handle nested data for "location" field.
  addLocationStructData(
    firestoreData,
    room.hasLocation() ? room.location : null,
    'location',
    forFieldValue,
  );

  // Add any Firestore field values
  room.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRoomListFirestoreData(
  List<RoomStruct>? rooms,
) =>
    rooms?.map((e) => getRoomFirestoreData(e, true)).toList() ?? [];
