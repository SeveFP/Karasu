# toshokan_api.model.LessonWithProgress

## Load the model package
```dart
import 'package:toshokan_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Lesson UUID | 
**courseId** | **String** | Parent course UUID | 
**order** | **int** | Lesson order within course | 
**title** | **String** | Lesson title | 
**description** | **String** | Lesson description | 
**body** | **String** | Lesson content body (may contain deck references) | 
**createdAt** | [**DateTime**](DateTime.md) | Creation timestamp | 
**editedAt** | [**DateTime**](DateTime.md) | Last edit timestamp | [optional] 
**deletedAt** | [**DateTime**](DateTime.md) | Deletion timestamp | [optional] 
**isCompleted** | **bool** | Whether user has completed this lesson | 
**isCurrent** | **bool** | Whether this is the user's current lesson | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


