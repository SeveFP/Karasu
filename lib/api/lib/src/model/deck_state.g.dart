// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeckStateCWProxy {
  DeckState id(String id);

  DeckState completed(bool completed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckState(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckState call({String id, bool completed});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeckState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeckState.copyWith.fieldName(...)`
class _$DeckStateCWProxyImpl implements _$DeckStateCWProxy {
  const _$DeckStateCWProxyImpl(this._value);

  final DeckState _value;

  @override
  DeckState id(String id) => this(id: id);

  @override
  DeckState completed(bool completed) => this(completed: completed);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckState(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckState call({
    Object? id = const $CopyWithPlaceholder(),
    Object? completed = const $CopyWithPlaceholder(),
  }) {
    return DeckState(
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

extension $DeckStateCopyWith on DeckState {
  /// Returns a callable class that can be used as follows: `instanceOfDeckState.copyWith(...)` or like so:`instanceOfDeckState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeckStateCWProxy get copyWith => _$DeckStateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckState _$DeckStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeckState', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'completed']);
      final val = DeckState(
        id: $checkedConvert('id', (v) => v as String),
        completed: $checkedConvert('completed', (v) => v as bool),
      );
      return val;
    });

Map<String, dynamic> _$DeckStateToJson(DeckState instance) => <String, dynamic>{
  'id': instance.id,
  'completed': instance.completed,
};
