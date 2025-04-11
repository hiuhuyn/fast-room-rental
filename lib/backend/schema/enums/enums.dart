import 'package:collection/collection.dart';

enum Role {
  tenant,
  landlord,
  admin,
}

enum PageTagNavigationBar {
  home,
  search,
  notification,
  chat,
  profile,
}

enum Sort {
  newest,
  price_asc,
  price_desc,
}

enum MediaType {
  image,
  video,
  unknown,
  file,
}

enum InputType {
  text,
  number,
  date,
}

enum MessageType {
  media,
  text,
  post,
}

enum BookingsStatusCheck {
  /// Chờ xác nhận
  pending,

  /// Đã xác nhận
  ///
  confirmed,

  /// Xác nhận đã xem
  viewed,

  /// Quá hạn
  expired,

  /// Đã huỷ
  cancelled,
}

enum TypeNoti {
  message,
  unknown,
}

enum RoomStatus {
  available,
  booked,
  occupied,
  under_maintenance,
  unavailable,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (PageTagNavigationBar):
      return PageTagNavigationBar.values.deserialize(value) as T?;
    case (Sort):
      return Sort.values.deserialize(value) as T?;
    case (MediaType):
      return MediaType.values.deserialize(value) as T?;
    case (InputType):
      return InputType.values.deserialize(value) as T?;
    case (MessageType):
      return MessageType.values.deserialize(value) as T?;
    case (BookingsStatusCheck):
      return BookingsStatusCheck.values.deserialize(value) as T?;
    case (TypeNoti):
      return TypeNoti.values.deserialize(value) as T?;
    case (RoomStatus):
      return RoomStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
