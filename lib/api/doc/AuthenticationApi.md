# toshokan_api.api.AuthenticationApi

## Load the API package
```dart
import 'package:toshokan_api/api.dart';
```

All URIs are relative to *https://api.example.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**logIn**](AuthenticationApi.md#login) | **POST** /login | Login
[**signUp**](AuthenticationApi.md#signup) | **POST** /signup | Register a new user


# **logIn**
> TokenResponse logIn(logInRequest)

Login

Authenticate with username and password to receive a token

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getAuthenticationApi();
final LogInRequest logInRequest = ; // LogInRequest | 

try {
    final response = api.logIn(logInRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->logIn: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **logInRequest** | [**LogInRequest**](LogInRequest.md)|  | 

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **signUp**
> TokenResponse signUp(signUpRequest)

Register a new user

Create a new user account and receive an authentication token

### Example
```dart
import 'package:toshokan_api/api.dart';

final api = ToshokanApi().getAuthenticationApi();
final SignUpRequest signUpRequest = ; // SignUpRequest | 

try {
    final response = api.signUp(signUpRequest);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthenticationApi->signUp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **signUpRequest** | [**SignUpRequest**](SignUpRequest.md)|  | 

### Return type

[**TokenResponse**](TokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

