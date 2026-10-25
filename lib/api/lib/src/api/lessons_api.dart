//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:toshokan_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:toshokan_api/src/model/bodyless_lessons_with_progress_connection_response.dart';
import 'package:toshokan_api/src/model/create_lesson_request.dart';
import 'package:toshokan_api/src/model/error.dart';
import 'package:toshokan_api/src/model/get_focused_lessons200_response.dart';
import 'package:toshokan_api/src/model/lesson.dart';
import 'package:toshokan_api/src/model/update_lesson_request.dart';

class LessonsApi {
  final Dio _dio;

  const LessonsApi(this._dio);

  /// Create a new lesson
  /// Create a new lesson within a course. The lesson body must reference at least one deck using the markdown form &#x60;![deck](uuid)&#x60;.  **Note:** This endpoint may require admin access (&#x60;X-Admin-Token&#x60; header) depending on server configuration.
  ///
  /// Parameters:
  /// * [courseId] - Course UUID
  /// * [createLessonRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Lesson] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Lesson>> createLesson({
    required String courseId,
    required CreateLessonRequest createLessonRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/courses/{courseId}/lessons'.replaceAll(
      '{'
      r'courseId'
      '}',
      courseId.toString(),
    );
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'BearerAuth'},
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(createLessonRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(_dio.options, _path),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Lesson? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<Lesson, Lesson>(rawData, 'Lesson', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Lesson>(
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

  /// Get lessons with progress (deprecated)
  /// Deprecated: use &#x60;GET /courses/{courseId}/lessons&#x60;.  Retrieve the course&#39;s lessons, oldest first, with the user&#39;s progress on each one. Use &#x60;bodyless&#x3D;true&#x60; to leave out lesson bodies.
  ///
  /// Parameters:
  /// * [courseId] - Course UUID
  /// * [bodyless] - If true, omit lesson body from response for faster pagination
  /// * [first] - Number of items to retrieve from the start (forward pagination)
  /// * [last] - Number of items to retrieve from the end (backward pagination)
  /// * [after] - Cursor to retrieve items after (forward pagination)
  /// * [before] - Cursor to retrieve items before (backward pagination)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetFocusedLessons200Response] as data
  /// Throws [DioException] if API call or serialization fails
  @Deprecated('This operation has been deprecated')
  Future<Response<GetFocusedLessons200Response>> getFocusedLessons({
    required String courseId,
    bool? bodyless = false,
    int? first,
    int? last,
    String? after,
    String? before,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/courses/{courseId}/lessons/focused'.replaceAll(
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
          {'type': 'http', 'scheme': 'bearer', 'name': 'BearerAuth'},
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (bodyless != null) r'bodyless': bodyless,
      if (first != null) r'first': first,
      if (last != null) r'last': last,
      if (after != null) r'after': after,
      if (before != null) r'before': before,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetFocusedLessons200Response? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              GetFocusedLessons200Response,
              GetFocusedLessons200Response
            >(rawData, 'GetFocusedLessons200Response', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetFocusedLessons200Response>(
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

  /// Get a lesson
  /// Retrieve one lesson of the course, with its body.
  ///
  /// Parameters:
  /// * [courseId] - Course UUID
  /// * [lessonId] - Lesson UUID
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Lesson] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Lesson>> getLesson({
    required String courseId,
    required String lessonId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/courses/{courseId}/lessons/{lessonId}'
        .replaceAll(
          '{'
          r'courseId'
          '}',
          courseId.toString(),
        )
        .replaceAll(
          '{'
          r'lessonId'
          '}',
          lessonId.toString(),
        );
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
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

    Lesson? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<Lesson, Lesson>(rawData, 'Lesson', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Lesson>(
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

  /// Get lessons for a course with progress
  /// Retrieve the course&#39;s lessons, oldest first, with the user&#39;s progress on each one. Lessons come without their body. Fetch a lesson&#39;s body with &#x60;GET /courses/{courseId}/lessons/{lessonId}&#x60;.
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
  /// Returns a [Future] containing a [Response] with a [BodylessLessonsWithProgressConnectionResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<BodylessLessonsWithProgressConnectionResponse>> getLessons({
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
    final _path = r'/courses/{courseId}/lessons'.replaceAll(
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

    BodylessLessonsWithProgressConnectionResponse? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<
              BodylessLessonsWithProgressConnectionResponse,
              BodylessLessonsWithProgressConnectionResponse
            >(
              rawData,
              'BodylessLessonsWithProgressConnectionResponse',
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

    return Response<BodylessLessonsWithProgressConnectionResponse>(
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

  /// Update a lesson
  /// Update one or more fields of an existing lesson.  **Note:** This endpoint may require admin access (&#x60;X-Admin-Token&#x60; header) depending on server configuration. When &#x60;ADMIN_ONLY_UPDATE_LESSON&#x3D;true&#x60;, only requests with a valid admin token will be accepted.  At least one field must be provided. Returns 400 if no fields are provided. If the body field is updated, it must still contain at least one deck reference in the format &#x60;![deck](uuid)&#x60;.
  ///
  /// Parameters:
  /// * [courseId] - Course UUID
  /// * [lessonId] - Lesson UUID
  /// * [updateLessonRequest]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [Lesson] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<Lesson>> updateLesson({
    required String courseId,
    required String lessonId,
    required UpdateLessonRequest updateLessonRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/courses/{courseId}/lessons/{lessonId}'
        .replaceAll(
          '{'
          r'courseId'
          '}',
          courseId.toString(),
        )
        .replaceAll(
          '{'
          r'lessonId'
          '}',
          lessonId.toString(),
        );
    final _options = Options(
      method: r'PATCH',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {'type': 'http', 'scheme': 'bearer', 'name': 'BearerAuth'},
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      _bodyData = jsonEncode(updateLessonRequest);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _options.compose(_dio.options, _path),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    Lesson? _responseData;

    try {
      final rawData = _response.data;
      _responseData = rawData == null
          ? null
          : deserialize<Lesson, Lesson>(rawData, 'Lesson', growable: true);
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<Lesson>(
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
