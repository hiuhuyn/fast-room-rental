import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Thue phong Group Code

class ThuePhongGroup {
  static String getBaseUrl({
    String? token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
  }) =>
      'https://dpaquvhgcbgwqjcvsppr.supabase.co';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
    'Content-Type': 'application/json',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
  };
  static UpdatePasswordCall updatePasswordCall = UpdatePasswordCall();
  static SendVerificationCodeCall sendVerificationCodeCall =
      SendVerificationCodeCall();
  static CheckCodeCall checkCodeCall = CheckCodeCall();
  static GetFilteredPostsCall getFilteredPostsCall = GetFilteredPostsCall();
}

class UpdatePasswordCall {
  Future<ApiCallResponse> call({
    String? newPassword = '',
    String? code = '',
    String? email = '',
    String? token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
  }) async {
    final baseUrl = ThuePhongGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "code": "${escapeStringForJson(code)}",
  "new_password": "${escapeStringForJson(newPassword)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UpdatePassword',
      apiUrl: '${baseUrl}/functions/v1/update_password',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
}

class SendVerificationCodeCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
  }) async {
    final baseUrl = ThuePhongGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendVerificationCode',
      apiUrl: '${baseUrl}/functions/v1/send-verification-code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  dynamic massage(dynamic response) => getJsonField(
        response,
        r'''$.massage''',
      );
}

class CheckCodeCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? code = '',
    String? token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
  }) async {
    final baseUrl = ThuePhongGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "code": "${escapeStringForJson(code)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckCode',
      apiUrl: '${baseUrl}/functions/v1/check_code',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic error(dynamic response) => getJsonField(
        response,
        r'''$.error''',
      );
  dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
}

class GetFilteredPostsCall {
  Future<ApiCallResponse> call({
    int? minPrice,
    int? maxPrice,
    String? sort = '',
    List<int>? roomTypeFilterList,
    List<int>? utilitiesFilterList,
    List<int>? furnishingsFilterList,
    int? page = 1,
    int? pageSize = 30,
    int? wardIdFilter,
    int? districtIdFilter,
    int? cityIdFilter,
    String? titleFilter = '',
    String? token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
  }) async {
    final baseUrl = ThuePhongGroup.getBaseUrl(
      token: token,
    );
    final roomTypeFilter = _serializeList(roomTypeFilterList);
    final utilitiesFilter = _serializeList(utilitiesFilterList);
    final furnishingsFilter = _serializeList(furnishingsFilterList);

    final ffApiRequestBody = '''
{
  "min_price": ${minPrice},
  "max_price": ${maxPrice},
  "sort": "${escapeStringForJson(sort)}",
  "room_type_filter": ${roomTypeFilter},
  "utilities_filter": ${utilitiesFilter},
  "furnishings_filter": ${furnishingsFilter},
  "city_id_filter": ${cityIdFilter},
  "ward_id_filter": ${wardIdFilter},
  "district_id_filter": ${districtIdFilter},
  "title_filter": "${escapeStringForJson(titleFilter)}",
  "page": ${page},
  "page_size": ${pageSize}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetFilteredPosts',
      apiUrl: '${baseUrl}/rest/v1/rpc/get_filtered_posts',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRwYXF1dmhnY2Jnd3FqY3ZzcHByIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzcyOTQyNzIsImV4cCI6MjA1Mjg3MDI3Mn0.u3iBr6J1Pw93fxSymBjaPX_33mnbKvAHRloImDSVig0',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Thue phong Group Code

class GetAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName:
          'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAPICopyCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getAPI Copy',
      apiUrl: 'https://api-dev.ictu.vn',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
