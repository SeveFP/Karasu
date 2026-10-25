import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karasu/services/config_service.dart';
import 'package:karasu/services/lesson_service.dart';
import 'package:karasu/services/openapi_client.dart';
import 'package:toshokan_api/toshokan_api.dart';

import '../config_bundle.dart';

/// Fake HTTP adapter: records each request and answers with an empty page of
/// lessons.
class RecordingAdapter implements HttpClientAdapter {
  final List<RequestOptions> requests = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return ResponseBody.fromString(
      '{"edges": [], "page_info": {"has_previous_page": false, '
      '"has_next_page": false, "start_cursor": "", "end_cursor": ""}}',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  const courseId = 'fb9ffe2c-ad66-4766-9b7b-46fd5d9acd72';

  setUp(() async {
    await ConfigService().loadConfig(
      bundle: TestConfigBundle('test/config/lessons_unlocked.json'),
    );
  });

  test('getLessons without paging sends no first or last', () async {
    final adapter = RecordingAdapter();
    OpenApiClient.instance.api = ToshokanApi(
      dio: Dio(BaseOptions(baseUrl: 'http://toshokan.test'))
        ..httpClientAdapter = adapter,
      basePathOverride: 'http://toshokan.test',
    );

    await LessonService.instance.getLessons(courseId);

    expect(adapter.requests.single.uri.path, '/courses/$courseId/lessons');
    expect(adapter.requests.single.uri.queryParameters, <String, String>{});
  });

  test('getLessons with after and first sends only those', () async {
    final adapter = RecordingAdapter();
    OpenApiClient.instance.api = ToshokanApi(
      dio: Dio(BaseOptions(baseUrl: 'http://toshokan.test'))
        ..httpClientAdapter = adapter,
      basePathOverride: 'http://toshokan.test',
    );

    await LessonService.instance.getLessons(courseId, after: 'c1', first: 5);

    expect(adapter.requests.single.uri.queryParameters, {
      'after': 'c1',
      'first': '5',
    });
  });
}
