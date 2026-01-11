# toshokan_api.model.LessonState

## Load the model package
```dart
import 'package:toshokan_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**decks** | [**Map&lt;String, DeckState&gt;**](DeckState.md) | Map of deck UUID to deck state (deck_id → DeckState) | 
**isCompleted** | **bool** | Whether all decks in the lesson are completed | 
**completedAt** | [**DateTime**](DateTime.md) | Timestamp when the lesson was completed | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


