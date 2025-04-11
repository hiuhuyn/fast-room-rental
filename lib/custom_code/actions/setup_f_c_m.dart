// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom actions
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

Future setupFCM() async {
  // Add your function code here!
  if (!Platform.isAndroid) {
    return;
  }
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // Yêu cầu quyền nhận thông báo
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print("🔔 Đã được cấp quyền nhận thông báo!");
  }

  // Lấy FCM Token
  String? token = await messaging.getToken();
  print("📱 FCM Token: $token");
  FFAppState().tokenFCM = token!;

  listenForNotifications();
}

void listenForNotifications() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("🔔 Nhận được thông báo: ${message.notification?.title}");
    // Hiển thị thông báo trong ứng dụng
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print("📌 Người dùng nhấn vào thông báo: ${message.data}");
  });
}
