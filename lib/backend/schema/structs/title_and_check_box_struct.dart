// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TitleAndCheckBoxStruct extends FFFirebaseStruct {
  TitleAndCheckBoxStruct({
    int? id,
    String? title,
    bool? isCheck,
    String? icon,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _isCheck = isCheck,
        _icon = icon,
        super(firestoreUtilData);

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "isCheck" field.
  bool? _isCheck;
  bool get isCheck => _isCheck ?? false;
  set isCheck(bool? val) => _isCheck = val;

  bool hasIsCheck() => _isCheck != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  static TitleAndCheckBoxStruct fromMap(Map<String, dynamic> data) =>
      TitleAndCheckBoxStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        isCheck: data['isCheck'] as bool?,
        icon: data['icon'] as String?,
      );

  static TitleAndCheckBoxStruct? maybeFromMap(dynamic data) => data is Map
      ? TitleAndCheckBoxStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'isCheck': _isCheck,
        'icon': _icon,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'isCheck': serializeParam(
          _isCheck,
          ParamType.bool,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
      }.withoutNulls;

  static TitleAndCheckBoxStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TitleAndCheckBoxStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        isCheck: deserializeParam(
          data['isCheck'],
          ParamType.bool,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TitleAndCheckBoxStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TitleAndCheckBoxStruct &&
        id == other.id &&
        title == other.title &&
        isCheck == other.isCheck &&
        icon == other.icon;
  }

  @override
  int get hashCode => const ListEquality().hash([id, title, isCheck, icon]);
}

TitleAndCheckBoxStruct createTitleAndCheckBoxStruct({
  int? id,
  String? title,
  bool? isCheck,
  String? icon,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TitleAndCheckBoxStruct(
      id: id,
      title: title,
      isCheck: isCheck,
      icon: icon,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TitleAndCheckBoxStruct? updateTitleAndCheckBoxStruct(
  TitleAndCheckBoxStruct? titleAndCheckBox, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    titleAndCheckBox
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTitleAndCheckBoxStructData(
  Map<String, dynamic> firestoreData,
  TitleAndCheckBoxStruct? titleAndCheckBox,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (titleAndCheckBox == null) {
    return;
  }
  if (titleAndCheckBox.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && titleAndCheckBox.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final titleAndCheckBoxData =
      getTitleAndCheckBoxFirestoreData(titleAndCheckBox, forFieldValue);
  final nestedData =
      titleAndCheckBoxData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = titleAndCheckBox.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTitleAndCheckBoxFirestoreData(
  TitleAndCheckBoxStruct? titleAndCheckBox, [
  bool forFieldValue = false,
]) {
  if (titleAndCheckBox == null) {
    return {};
  }
  final firestoreData = mapToFirestore(titleAndCheckBox.toMap());

  // Add any Firestore field values
  titleAndCheckBox.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTitleAndCheckBoxListFirestoreData(
  List<TitleAndCheckBoxStruct>? titleAndCheckBoxs,
) =>
    titleAndCheckBoxs
        ?.map((e) => getTitleAndCheckBoxFirestoreData(e, true))
        .toList() ??
    [];
