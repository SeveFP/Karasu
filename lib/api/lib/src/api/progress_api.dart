//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:toshokan_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:toshokan_api/src/model/answer_cards_response.dart';
import 'package:toshokan_api/src/model/card_answer.dart';
import 'package:toshokan_api/src/model/error.dart';
import 'package:toshokan_api/src/model/get_lesson_state_response.dart';

class ProgressApi {

  final Dio _dio;

  const ProgressApi(this._dio);

  /// Submit answers for cards
  /// Submit user&#39;s answers for cards in a deck and update progress
  ///
  /// Parameters:
  /// * [courseId] - Course UUID
  /// * [lessonId] - Lesson UUID
  /// * [deckId] - Deck UUID
  /// * [cardAnswer] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AnswerCardsResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AnswerCardsResponse>> answerCards({ 
    required String courseId,
    required String lessonId,
    required String deckId,
    required List<CardAnswer> cardAnswer,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/courses/{courseId}/lessons/{lessonId}/decks/{deckId}/answer'.replaceAll('{' r'courseId' '}', courseId.toString()).replaceAll('{' r'lessonId' '}', lessonId.toString()).replaceAll('{' r'deckId' '}', deckId.toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'BearerAuth',
          },
        ],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
_bodyData=jsonEncode(cardAnswer);
    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
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
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AnswerCardsResponse? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<AnswerCardsResponse, AnswerCardsResponse>(rawData, 'AnswerCardsResponse', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AnswerCardsResponse>(
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

  /// Get lesson state
  /// Retrieve the completion state of a lesson and its decks
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
  /// Returns a [Future] containing a [Response] with a [GetLessonStateResponse] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetLessonStateResponse>> getLessonState({ 
    required String courseId,
    required String lessonId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/courses/{courseId}/lessons/{lessonId}/state'.replaceAll('{' r'courseId' '}', courseId.toString()).replaceAll('{' r'lessonId' '}', lessonId.toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'http',
            'scheme': 'bearer',
            'name': 'BearerAuth',
          },
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

    GetLessonStateResponse? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetLessonStateResponse, GetLessonStateResponse>(rawData, 'GetLessonStateResponse', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetLessonStateResponse>(
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
