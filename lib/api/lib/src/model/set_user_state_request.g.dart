// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_user_state_request.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SetUserStateRequestCWProxy {
  SetUserStateRequest stateJson(String stateJson);

  SetUserStateRequest currentLessonId(String? currentLessonId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetUserStateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetUserStateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SetUserStateRequest call({String stateJson, String? currentLessonId});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSetUserStateRequest.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSetUserStateRequest.copyWith.fieldName(...)`
class _$SetUserStateRequestCWProxyImpl implements _$SetUserStateRequestCWProxy {
  const _$SetUserStateRequestCWProxyImpl(this._value);

  final SetUserStateRequest _value;

  @override
  SetUserStateRequest stateJson(String stateJson) => this(stateJson: stateJson);

  @override
  SetUserStateRequest currentLessonId(String? currentLessonId) =>
      this(currentLessonId: currentLessonId);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SetUserStateRequest(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SetUserStateRequest(...).copyWith(id: 12, name: "My name")
  /// ````
  SetUserStateRequest call({
    Object? stateJson = const $CopyWithPlaceholder(),
    Object? currentLessonId = const $CopyWithPlaceholder(),
  }) {
    return SetUserStateRequest(
      stateJson: stateJson == const $CopyWithPlaceholder()
          ? _value.stateJson
          // ignore: cast_nullable_to_non_nullable
          : stateJson as String,
      currentLessonId: currentLessonId == const $CopyWithPlaceholder()
          ? _value.currentLessonId
          // ignore: cast_nullable_to_non_nullable
          : currentLessonId as String?,
    );
  }
}

extension $SetUserStateRequestCopyWith on SetUserStateRequest {
  /// Returns a callable class that can be used as follows: `instanceOfSetUserStateRequest.copyWith(...)` or like so:`instanceOfSetUserStateRequest.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SetUserStateRequestCWProxy get copyWith =>
      _$SetUserStateRequestCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetUserStateRequest _$SetUserStateRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SetUserStateRequest',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['state_json']);
        final val = SetUserStateRequest(
          stateJson: $checkedConvert('state_json', (v) => v as String),
          currentLessonId: $checkedConvert(
            'current_lesson_id',
            (v) => v as String?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'stateJson': 'state_json',
        'currentLessonId': 'current_lesson_id',
      },
    );

Map<String, dynamic> _$SetUserStateRequestToJson(
  SetUserStateRequest instance,
) => <String, dynamic>{
  'state_json': instance.stateJson,
  'current_lesson_id': ?instance.currentLessonId,
};
