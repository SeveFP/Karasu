# toshokan_api.api.DecksApi

## Load the API package
```dart
import 'package:toshokan_api/api.dart';
```

All URIs are relative to *https://api.example.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createDeck**](DecksApi.md#createdeck) | **POST** /decks | Create a new deck
[**deleteDeck**](DecksApi.md#deletedeck) | **DELETE** /decks/{id} | Delete a deck
[**getDeck**](DecksApi.md#getdeck) | **GET** /decks/{id} | Get deck details


# **createDeck**
> Deck createDeck(deckInput)

Create a new deck

Create a new flashcard deck

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getDecksApi();
final DeckInput deckInput = ; // DeckInput | 

try {
    final response = api.createDeck(deckInput);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DecksApi->createDeck: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deckInput** | [**DeckInput**](DeckInput.md)|  | 

### Return type

[**Deck**](Deck.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteDeck**
> deleteDeck(id)

Delete a deck

Delete an existing deck

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getDecksApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Deck UUID

try {
    api.deleteDeck(id);
} on DioException catch (e) {
    print('Exception when calling DecksApi->deleteDeck: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Deck UUID | 

### Return type

void (empty response body)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getDeck**
> Deck getDeck(id)

Get deck details

Retrieve details of a specific deck including all cards

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getDecksApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Deck UUID

try {
    final response = api.getDeck(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DecksApi->getDeck: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Deck UUID | 

### Return type

[**Deck**](Deck.md)

### Authorization

[BearerAuth](../README.md#BearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

