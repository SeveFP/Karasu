// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_state_response_decks_inner.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonStateResponseDecksInnerCWProxy {
  LessonStateResponseDecksInner id(String id);

  LessonStateResponseDecksInner completed(bool completed);

  LessonStateResponseDecksInner cards(
    List<LessonStateResponseDecksInnerCardsInner> cards,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonStateResponseDecksInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonStateResponseDecksInner(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonStateResponseDecksInner call({
    String id,
    bool completed,
    List<LessonStateResponseDecksInnerCardsInner> cards,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonStateResponseDecksInner.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonStateResponseDecksInner.copyWith.fieldName(...)`
class _$LessonStateResponseDecksInnerCWProxyImpl
    implements _$LessonStateResponseDecksInnerCWProxy {
  const _$LessonStateResponseDecksInnerCWProxyImpl(this._value);

  final LessonStateResponseDecksInner _value;

  @override
  LessonStateResponseDecksInner id(String id) => this(id: id);

  @override
  LessonStateResponseDecksInner completed(bool completed) =>
      this(completed: completed);

  @override
  LessonStateResponseDecksInner cards(
    List<LessonStateResponseDecksInnerCardsInner> cards,
  ) => this(cards: cards);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonStateResponseDecksInner(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonStateResponseDecksInner(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonStateResponseDecksInner call({
    Object? id = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
    Object? cards = const $CopyWithPlaceholder(),
  }) {
    return LessonStateResponseDecksInner(
      id: id == const $CopyWithPlaceholder()
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      completed: completed == const $CopyWithPlaceholder()
          ? _value.completed
          // ignore: cast_nullable_to_non_nullable
          : completed as bool,
      cards: cards == const $CopyWithPlaceholder()
          ? _value.cards
          // ignore: cast_nullable_to_non_nullable
          : cards as List<LessonStateResponseDecksInnerCardsInner>,
    );
  }
}

extension $LessonStateResponseDecksInnerCopyWith
    on LessonStateResponseDecksInner {
  /// Returns a callable class that can be used as follows: `instanceOfLessonStateResponseDecksInner.copyWith(...)` or like so:`instanceOfLessonStateResponseDecksInner.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonStateResponseDecksInnerCWProxy get copyWith =>
      _$LessonStateResponseDecksInnerCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonStateResponseDecksInner _$LessonStateResponseDecksInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('LessonStateResponseDecksInner', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['id', 'completed', 'cards']);
  final val = LessonStateResponseDecksInner(
    id: $checkedConvert('id', (v) => v as String),
    completed: $checkedConvert('completed', (v) => v as bool),
    cards: $checkedConvert(
      'cards',
      (v) => (v as List<dynamic>)
          .map(
            (e) => LessonStateResponseDecksInnerCardsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$LessonStateResponseDecksInnerToJson(
  LessonStateResponseDecksInner instance,
) => <String, dynamic>{
  'id': instance.id,
  'completed': instance.completed,
  'cards': instance.cards.map((e) => e.toJson()).toList(),
};
