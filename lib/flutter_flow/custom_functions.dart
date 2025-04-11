import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

List<dynamic> splitList(
  List<dynamic> original,
  int groupSize,
) {
  List<List<dynamic>> result = [];

  for (int i = 0; i < original.length; i += groupSize) {
    // Tạo một nhóm con từ i đến i + groupSize hoặc đến cuối danh sách
    var chunk = original.sublist(
      i,
      (i + groupSize > original.length) ? original.length : i + groupSize,
    );
    result.add(chunk);
  }

  return result;
}

String timeAgo(DateTime startDate) {
  final now = DateTime.now();
  final difference = now.difference(startDate);

  if (difference.inDays >= 30) {
    final months = (difference.inDays / 30).floor();
    return "$months tháng trước";
  } else if (difference.inDays >= 1) {
    return "${difference.inDays} ngày trước";
  } else if (difference.inHours >= 1) {
    return "${difference.inHours} giờ trước";
  } else if (difference.inMinutes >= 1) {
    return "${difference.inMinutes} phút trước";
  } else {
    return "Vừa xong";
  }
}

MediaType? checkUrlMediaType(String? url) {
  if (url == null || url.isEmpty) return null;

  final imageExtensions = ["jpg", "jpeg", "png", "gif", "bmp", "webp"];
  final videoExtensions = ["mp4", "mov", "avi", "wmv", "flv", "mkv", "webm"];

  final uri = Uri.tryParse(url);
  if (uri == null || !uri.hasAbsolutePath) return null;

  final extension = uri.path.split('.').last.toLowerCase();

  if (imageExtensions.contains(extension)) {
    return MediaType.image;
  } else if (videoExtensions.contains(extension)) {
    return MediaType.video;
  }

  return MediaType.unknown;
}

DateTime? convertStringToDate(String? value) {
  if (value == null) return null;
  try {
    return DateTime.parse(value!);
  } catch (e) {
    // Bỏ qua
  }
  // Danh sách các định dạng ngày tháng có thể gặp
  final formats = [
    'yyyy/MM/dd',
    'yyyy-MM-dd',
    'yyyy/M/d',
    'yyyy-M-d',
    'yyyy.MM.dd',
    'yyyy.MM.d',
    'yyyy年MM月dd日',
    'dd/MM/yyyy',
  ];

  for (var format in formats) {
    try {
      return DateFormat(format).parseStrict(value!);
    } catch (e) {
      // Bỏ qua
    }
  }
  return null;
}

MediaType? checkTypeMediaFile(FFUploadedFile? file) {
  if (file == null || file.name == null) return MediaType.unknown;

  /// Lấy phần mở rộng của file (vd: .mp4, .jpg)
  String extension = file.name!.split('.').last.toLowerCase();

  /// Kiểm tra theo phần mở rộng
  if (['mp4', 'avi', 'mov', 'mkv'].contains(extension)) {
    return MediaType.video;
  } else if (['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'].contains(extension)) {
    return MediaType.image;
  } else if (['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx', 'txt', 'zip']
      .contains(extension)) {
    return MediaType.file;
  }

  return MediaType.unknown;
}
