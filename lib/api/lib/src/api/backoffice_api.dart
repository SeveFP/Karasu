//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:toshokan_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:toshokan_api/src/model/all_courses_response.dart';
import 'package:toshokan_api/src/model/error.dart';
import 'package:toshokan_api/src/model/lessons_connection_response.dart';
import 'package:toshokan_api/src/model/set_user_state_request.dart';
import 'package:toshokan_api/src/model/students_progress_response.dart';
import 'package:toshokan_api/src/model/user_state_response.dart';

class BackofficeApi {
  final Dio _dio;

  const BackofficeApi(this._dio);

  /// Get a course&#39;s lessons with their bodies (Admin only)
  /// Retrieve the course&#39;s lessons, oldest first, with their bodies.  **Requires admin access** (&#x60;X-Admin-Token&#x60; header).
  ///
  /// Parameters:
  /// * [courseId] - Course UUID
  /// * [after] - Cursor for pagination (fetch lessons after this cursor)
  /// * [before] - Cursor for backward pagination (fetch lessons before this cursor)
  /// * [first] - Number of lessons to fetch (default 20)
  /// * [last] - Number of lessons to fetch when paginating backward (default 20)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [LessonsConnectionResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<LessonsConnectionResponse>> adminGetLessons({
    required String courseId,
    String? after,
    String? before,
    int? first = 20,
    int? last = 20,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/courses/{courseId}/lessons'.replaceAll(
      '{'
      r'courseId'
      '}',
      courseId.toString(),
    );
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'AdminAuth',
            'keyName': 'X-Admin-Token',
            'where': 'header',
          },
          {'type': 'http', 'scheme': 'bearer', 'name': 'BearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (after != null) r'after': after,
      if (before != null) r'before': before,
      if (first != null) r'first': first,
      if (last != null) r'last': last,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    LessonsConnectionResponse? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<LessonsConnectionResponse, LessonsConnectionResponse>(
              rawData,
              'LessonsConnectionResponse',
              growable: true,
            );
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<LessonsConnectionResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// List all courses (Admin only)
  /// Retrieve paginated list of all courses in the system.  **Requires admin access** (&#x60;X-Admin-Token&#x60; header).
  ///
  /// Parameters:
  /// * [after] - Cursor for pagination (fetch courses after this cursor)
  /// * [before] - Cursor for backward pagination
  /// * [first] - Number of courses to fetch (default 20)
  /// * [last] - Number of courses to fetch when paginating backward (default 20)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AllCoursesResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AllCoursesResponse>> getAllCourses({
    String? after,
    String? before,
    int? first = 20,
    int? last = 20,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/courses';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'AdminAuth',
            'keyName': 'X-Admin-Token',
            'where': 'header',
          },
          {'type': 'http', 'scheme': 'bearer', 'name': 'BearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (after != null) r'after': after,
      if (before != null) r'before': before,
      if (first != null) r'first': first,
      if (last != null) r'last': last,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AllCoursesResponse? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<AllCoursesResponse, AllCoursesResponse>(
              rawData,
              'AllCoursesResponse',
              growable: true,
            );
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AllCoursesResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get students progress for a course (Admin only)
  /// Retrieve paginated list of student progress for a specific course. This endpoint is for professors/admins to track student progress.  **Requires admin access** (&#x60;X-Admin-Token&#x60; header).
  ///
  /// Parameters:
  /// * [courseId] - Course UUID
  /// * [after] - Cursor for pagination (fetch students after this cursor)
  /// * [before] - Cursor for backward pagination
  /// * [first] - Number of students to fetch (default 20)
  /// * [detailed] - Include detailed per-lesson breakdown
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [StudentsProgressResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<StudentsProgressResponse>> getStudentsProgress({
    required String courseId,
    String? after,
    String? before,
    int? first = 20,
    bool? detailed = false,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/courses/{courseId}/students/progress'.replaceAll(
      '{'
      r'courseId'
      '}',
      courseId.toString(),
    );
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'AdminAuth',
            'keyName': 'X-Admin-Token',
            'where': 'header',
          },
          {'type': 'http', 'scheme': 'bearer', 'name': 'BearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (after != null) r'after': after,
      if (before != null) r'before': before,
      if (first != null) r'first': first,
      if (detailed != null) r'detailed': detailed,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    StudentsProgressResponse? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<StudentsProgressResponse, StudentsProgressResponse>(
              rawData,
              'StudentsProgressResponse',
              growable: true,
            );
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<StudentsProgressResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Get user state for debugging (Admin only)
  /// Retrieve the full state JSON for a user in a course. This is a debug/admin endpoint for troubleshooting user progress issues.  **Requires admin access** (&#x60;X-Admin-Token&#x60; header).
  ///
  /// Parameters:
  /// * [courseId] - Course UUID
  /// * [userId] - User UUID
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [UserStateResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<UserStateResponse>> getUserState({
    required String courseId,
    required String userId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/courses/{courseId}/users/{userId}/state'
        .replaceAll(
          '{'
          r'courseId'
          '}',
          courseId.toString(),
        )
        .replaceAll(
          '{'
          r'userId'
          '}',
          userId.toString(),
        );
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'AdminAuth',
            'keyName': 'X-Admin-Token',
            'where': 'header',
          },
          {'type': 'http', 'scheme': 'bearer', 'name': 'BearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    UserStateResponse? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<UserStateResponse, UserStateResponse>(
              rawData,
              'UserStateResponse',
              growable: true,
            );
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<UserStateResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// Set user state for debugging (Admin only)
  /// Overwrite the full state JSON for a user in a course. This is a debug/admin endpoint for emergency fixes or state corrections.  **Requires admin access** (&#x60;X-Admin-Token&#x60; header).  **Warning:** Use with caution. This completely replaces the user&#39;s progress state.
  ///
  /// Parameters:
  /// * [courseId] - Course UUID
  /// * [userId] - User UUID
  /// * [setUserStateRequest]
  /// * [sync_] - Trigger sync after updating state
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [UserStateResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<UserStateResponse>> setUserState({
    required String courseId,
    required String userId,
    required SetUserStateRequest setUserStateRequest,
    bool? sync_ = false,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/courses/{courseId}/users/{userId}/state'
        .replaceAll(
          '{'
          r'courseId'
          '}',
          courseId.toString(),
        )
        .replaceAll(
          '{'
          r'userId'
          '}',
          userId.toString(),
        );
    final _options = Options(
      method: r'PUT',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'AdminAuth',
            'keyName': 'X-Admin-Token',
            'where': 'header',
          },
          {'type': 'http', 'scheme': 'bearer', 'name': 'BearerAuth'},
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (sync_ != null) r'sync': sync_,
    };

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(setUserStateRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    UserStateResponse? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<UserStateResponse, UserStateResponse>(
              rawData,
              'UserStateResponse',
              growable: true,
            );
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<UserStateResponse>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }
}
