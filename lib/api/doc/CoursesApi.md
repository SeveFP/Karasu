# toshokan_api.api.CoursesApi

## Load the API package
```dart
import 'package:toshokan_api/api.dart';
```

All URIs are relative to *https://api.example.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCourse**](CoursesApi.md#createcourse) | **POST** /courses | Create a new course
[**enrollCourse**](CoursesApi.md#enrollcourse) | **POST** /courses/{courseId}/enroll | Enroll in a course
[**getCourse**](CoursesApi.md#getcourse) | **GET** /courses/{courseId} | Get course details
[**getEnrolledCourses**](CoursesApi.md#getenrolledcourses) | **GET** /courses/enrolled | Get enrolled courses


# **createCourse**
> Course createCourse(createCourseRequest)

Create a new course

Create a new course with title and description

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getCoursesApi();
final CreateCourseRequest createCourseRequest = ; // CreateCourseRequest | 

try {
    final response = api.createCourse(createCourseRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->createCourse: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createCourseRequest** | [**CreateCourseRequest**](CreateCourseRequest.md)|  | 

### Return type

[**Course**](Course.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **enrollCourse**
> EnrollCourse200Response enrollCourse(courseId)

Enroll in a course

Enroll the authenticated user in a course

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getCoursesApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Course UUID

try {
    final response = api.enrollCourse(courseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->enrollCourse: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**| Course UUID | 

### Return type

[**EnrollCourse200Response**](EnrollCourse200Response.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCourse**
> Course getCourse(courseId)

Get course details

Retrieve details of a specific course by ID

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getCoursesApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Course UUID

try {
    final response = api.getCourse(courseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->getCourse: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**| Course UUID | 

### Return type

[**Course**](Course.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEnrolledCourses**
> CoursesWithProgressConnectionResponse getEnrolledCourses(after, before, first, last)

Get enrolled courses

Retrieve paginated list of courses the authenticated user is enrolled in, with progress information

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getCoursesApi();
final String after = after_example; // String | Cursor for pagination (fetch courses after this cursor)
final String before = before_example; // String | Cursor for backward pagination (fetch courses before this cursor)
final int first = 789; // int | Number of courses to fetch (default 20)
final int last = 789; // int | Number of courses to fetch when paginating backward (default 20)

try {
    final response = api.getEnrolledCourses(after, before, first, last);
    print(response);
} on DioException catch (e) {
    print('Exception when calling CoursesApi->getEnrolledCourses: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **after** | **String**| Cursor for pagination (fetch courses after this cursor) | [optional] 
 **before** | **String**| Cursor for backward pagination (fetch courses before this cursor) | [optional] 
 **first** | **int**| Number of courses to fetch (default 20) | [optional] [default to 20]
 **last** | **int**| Number of courses to fetch when paginating backward (default 20) | [optional] [default to 20]

### Return type

[**CoursesWithProgressConnectionResponse**](CoursesWithProgressConnectionResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

