// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_state_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonStateResponseCWProxy {
  LessonStateResponse id(String id);

  LessonStateResponse completed(bool completed);

  LessonStateResponse decks(List<LessonStateResponseDecksInner> decks);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonStateResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonStateResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonStateResponse call({
    String id,
    bool completed,
    List<LessonStateResponseDecksInner> decks,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonStateResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonStateResponse.copyWith.fieldName(...)`
class _$LessonStateResponseCWProxyImpl implements _$LessonStateResponseCWProxy {
  const _$LessonStateResponseCWProxyImpl(this._value);

  final LessonStateResponse _value;

  @override
  LessonStateResponse id(String id) => this(id: id);

  @override
  LessonStateResponse completed(bool completed) => this(completed: completed);

  @override
  LessonStateResponse decks(List<LessonStateResponseDecksInner> decks) =>
      this(decks: decks);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonStateResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonStateResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonStateResponse call({
    Object? id = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
    Object? decks = const $CopyWithPlaceholder(),
  }) {
    return LessonStateResponse(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      completed: completed == const $CopyWithPlaceholder()
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as bool,
      decks: decks == const $CopyWithPlaceholder()
          ? _value.decks
          // ignore: cast_nullable_to_non_nullable
          : decks as List<LessonStateResponseDecksInner>,
    );
  }
}

extension $LessonStateResponseCopyWith on LessonStateResponse {
  /// Returns a callable class that can be used as follows: `instanceOfLessonStateResponse.copyWith(...)` or like so:`instanceOfLessonStateResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonStateResponseCWProxy get copyWith =>
      _$LessonStateResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonStateResponse _$LessonStateResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LessonStateResponse', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'completed', 'decks']);
      final val = LessonStateResponse(
        id: $checkedConvert('id', (v) => v as String),
        completed: $checkedConvert('completed', (v) => v as bool),
        decks: $checkedConvert(
          'decks',
          (v) => (v as List<dynamic>)
              .map(
                (e) => LessonStateResponseDecksInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$LessonStateResponseToJson(
  LessonStateResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'completed': instance.completed,
  'decks': instance.decks.map((e) => e.toJson()).toList(),
};
