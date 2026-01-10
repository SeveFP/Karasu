# toshokan_api.api.LessonsApi

## Load the API package
```dart
import 'package:toshokan_api/api.dart';
```

All URIs are relative to *https://api.example.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createLesson**](LessonsApi.md#createlesson) | **POST** /courses/{courseId}/lessons | Create a new lesson
[**getFocusedLessons**](LessonsApi.md#getfocusedlessons) | **GET** /courses/{courseId}/lessons/focused | Get focused lessons with progress
[**getLessons**](LessonsApi.md#getlessons) | **GET** /courses/{courseId}/lessons | Get lessons for a course


# **createLesson**
> Lesson createLesson(courseId, createLessonRequest)

Create a new lesson

Create a new lesson within a course. The lesson body must reference at least one deck using the markdown form `![deck](uuid)`.

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getLessonsApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Course UUID
final CreateLessonRequest createLessonRequest = ; // CreateLessonRequest | 

try {
    final response = api.createLesson(courseId, createLessonRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling LessonsApi->createLesson: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**| Course UUID | 
 **createLessonRequest** | [**CreateLessonRequest**](CreateLessonRequest.md)|  | 

### Return type

[**Lesson**](Lesson.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getFocusedLessons**
> LessonsWithProgressConnectionResponse getFocusedLessons(courseId)

Get focused lessons with progress

Retrieve lessons around the user's current lesson with completion status

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getLessonsApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Course UUID

try {
    final response = api.getFocusedLessons(courseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling LessonsApi->getFocusedLessons: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**| Course UUID | 

### Return type

[**LessonsWithProgressConnectionResponse**](LessonsWithProgressConnectionResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLessons**
> LessonsConnectionResponse getLessons(courseId, after, before, first, last)

Get lessons for a course

Retrieve paginated list of lessons for a specific course

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getLessonsApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Course UUID
final String after = after_example; // String | Cursor for pagination (fetch lessons after this cursor)
final String before = before_example; // String | Cursor for backward pagination (fetch lessons before this cursor)
final int first = 789; // int | Number of lessons to fetch (default 20)
final int last = 789; // int | Number of lessons to fetch when paginating backward (default 20)

try {
    final response = api.getLessons(courseId, after, before, first, last);
    print(response);
} on DioException catch (e) {
    print('Exception when calling LessonsApi->getLessons: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**| Course UUID | 
 **after** | **String**| Cursor for pagination (fetch lessons after this cursor) | [optional] 
 **before** | **String**| Cursor for backward pagination (fetch lessons before this cursor) | [optional] 
 **first** | **int**| Number of lessons to fetch (default 20) | [optional] [default to 20]
 **last** | **int**| Number of lessons to fetch when paginating backward (default 20) | [optional] [default to 20]

### Return type

[**LessonsConnectionResponse**](LessonsConnectionResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

