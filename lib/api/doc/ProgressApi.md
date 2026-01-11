# toshokan_api.api.ProgressApi

## Load the API package
```dart
import 'package:toshokan_api/api.dart';
```

All URIs are relative to *https://api.example.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**answerCards**](ProgressApi.md#answercards) | **POST** /courses/{courseId}/lessons/{lessonId}/decks/{deckId}/answer | Submit answers for cards
[**getLessonState**](ProgressApi.md#getlessonstate) | **GET** /courses/{courseId}/lessons/{lessonId}/state | Get lesson state


# **answerCards**
> AnswerCardsResponse answerCards(courseId, lessonId, deckId, cardAnswer)

Submit answers for cards

Submit user's answers for cards in a deck and update progress

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getProgressApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Course UUID
final String lessonId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Lesson UUID
final String deckId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Deck UUID
final List<CardAnswer> cardAnswer = ; // List<CardAnswer> | 

try {
    final response = api.answerCards(courseId, lessonId, deckId, cardAnswer);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProgressApi->answerCards: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**| Course UUID | 
 **lessonId** | **String**| Lesson UUID | 
 **deckId** | **String**| Deck UUID | 
 **cardAnswer** | [**List&lt;CardAnswer&gt;**](CardAnswer.md)|  | 

### Return type

[**AnswerCardsResponse**](AnswerCardsResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLessonState**
> GetLessonStateResponse getLessonState(courseId, lessonId)

Get lesson state

Retrieve the completion state of a lesson and its decks

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getProgressApi();
final String courseId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Course UUID
final String lessonId = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Lesson UUID

try {
    final response = api.getLessonState(courseId, lessonId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ProgressApi->getLessonState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **courseId** | **String**| Course UUID | 
 **lessonId** | **String**| Lesson UUID | 

### Return type

[**GetLessonStateResponse**](GetLessonStateResponse.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

