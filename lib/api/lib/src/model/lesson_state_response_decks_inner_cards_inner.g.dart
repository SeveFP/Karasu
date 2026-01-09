// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_state_response_decks_inner_cards_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonStateResponseDecksInnerCardsInnerCWProxy {
  LessonStateResponseDecksInnerCardsInner id(String id);

  LessonStateResponseDecksInnerCardsInner completed(bool completed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonStateResponseDecksInnerCardsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonStateResponseDecksInnerCardsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonStateResponseDecksInnerCardsInner call({String id, bool completed});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonStateResponseDecksInnerCardsInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonStateResponseDecksInnerCardsInner.copyWith.fieldName(...)`
class _$LessonStateResponseDecksInnerCardsInnerCWProxyImpl
    implements _$LessonStateResponseDecksInnerCardsInnerCWProxy {
  const _$LessonStateResponseDecksInnerCardsInnerCWProxyImpl(this._value);

  final LessonStateResponseDecksInnerCardsInner _value;

  @override
  LessonStateResponseDecksInnerCardsInner id(String id) => this(id: id);

  @override
  LessonStateResponseDecksInnerCardsInner completed(bool completed) =>
      this(completed: completed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonStateResponseDecksInnerCardsInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonStateResponseDecksInnerCardsInner(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonStateResponseDecksInnerCardsInner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
  }) {
    return LessonStateResponseDecksInnerCardsInner(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      completed: completed == const $CopyWithPlaceholder()
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as bool,
    );
  }
}

extension $LessonStateResponseDecksInnerCardsInnerCopyWith
    on LessonStateResponseDecksInnerCardsInner {
  /// Returns a callable class that can be used as follows: `instanceOfLessonStateResponseDecksInnerCardsInner.copyWith(...)` or like so:`instanceOfLessonStateResponseDecksInnerCardsInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonStateResponseDecksInnerCardsInnerCWProxy get copyWith =>
      _$LessonStateResponseDecksInnerCardsInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonStateResponseDecksInnerCardsInner
_$LessonStateResponseDecksInnerCardsInnerFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LessonStateResponseDecksInnerCardsInner', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['id', 'completed']);
      final val = LessonStateResponseDecksInnerCardsInner(
        id: $checkedConvert('id', (v) => v as String),
        completed: $checkedConvert('completed', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$LessonStateResponseDecksInnerCardsInnerToJson(
  LessonStateResponseDecksInnerCardsInner instance,
) => <String, dynamic>{'id': instance.id, 'completed': instance.completed};
