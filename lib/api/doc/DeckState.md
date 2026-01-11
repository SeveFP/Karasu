# toshokan_api.model.DeckState

## Load the model package
```dart
import 'package:toshokan_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cards** | [**Map&lt;String, CardState&gt;**](CardState.md) | Map of card UUID to card state (card_id → CardState) | 
**isCompleted** | **bool** | Whether all cards in the deck are completed | 
**completedAt** | [**DateTime**](DateTime.md) | Timestamp when the deck was completed | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


