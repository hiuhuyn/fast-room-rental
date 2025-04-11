// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CitiesStruct extends FFFirebaseStruct {
  CitiesStruct({
    int? code,
    String? name,
    String? fullName,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _name = name,
        _fullName = fullName,
        _image = image,
        super(firestoreUtilData);

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  set fullName(String? val) => _fullName = val;

  bool hasFullName() => _fullName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  static CitiesStruct fromMap(Map<String, dynamic> data) => CitiesStruct(
        code: castToType<int>(data['code']),
        name: data['name'] as String?,
        fullName: data['full_name'] as String?,
        image: data['image'] as String?,
      );

  static CitiesStruct? maybeFromMap(dynamic data) =>
      data is Map ? CitiesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'name': _name,
        'full_name': _fullName,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'full_name': serializeParam(
          _fullName,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static CitiesStruct fromSerializableMap(Map<String, dynamic> data) =>
      CitiesStruct(
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        fullName: deserializeParam(
          data['full_name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CitiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CitiesStruct &&
        code == other.code &&
        name == other.name &&
        fullName == other.fullName &&
        image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([code, name, fullName, image]);
}

CitiesStruct createCitiesStruct({
  int? code,
  String? name,
  String? fullName,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CitiesStruct(
      code: code,
      name: name,
      fullName: fullName,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CitiesStruct? updateCitiesStruct(
  CitiesStruct? cities, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cities
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCitiesStructData(
  Map<String, dynamic> firestoreData,
  CitiesStruct? cities,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cities == null) {
    return;
  }
  if (cities.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cities.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final citiesData = getCitiesFirestoreData(cities, forFieldValue);
  final nestedData = citiesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cities.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCitiesFirestoreData(
  CitiesStruct? cities, [
  bool forFieldValue = false,
]) {
  if (cities == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cities.toMap());

  // Add any Firestore field values
  cities.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCitiesListFirestoreData(
  List<CitiesStruct>? citiess,
) =>
    citiess?.map((e) => getCitiesFirestoreData(e, true)).toList() ?? [];
