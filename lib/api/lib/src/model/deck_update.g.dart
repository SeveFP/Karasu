// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_update.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DeckUpdateCWProxy {
  DeckUpdate title(String? title);

  DeckUpdate description(String? description);

  DeckUpdate isPublic(bool? isPublic);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckUpdate call({String? title, String? description, bool? isPublic});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfDeckUpdate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfDeckUpdate.copyWith.fieldName(...)`
class _$DeckUpdateCWProxyImpl implements _$DeckUpdateCWProxy {
  const _$DeckUpdateCWProxyImpl(this._value);

  final DeckUpdate _value;

  @override
  DeckUpdate title(String? title) => this(title: title);

  @override
  DeckUpdate description(String? description) => this(description: description);

  @override
  DeckUpdate isPublic(bool? isPublic) => this(isPublic: isPublic);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `DeckUpdate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// DeckUpdate(...).copyWith(id: 12, name: "My name")
  /// ````
  DeckUpdate call({
    Object? title = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? isPublic = const $CopyWithPlaceholder(),
  }) {
    return DeckUpdate(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      isPublic: isPublic == const $CopyWithPlaceholder()
          ? _value.isPublic
          // ignore: cast_nullable_to_non_nullable
          : isPublic as bool?,
    );
  }
}

extension $DeckUpdateCopyWith on DeckUpdate {
  /// Returns a callable class that can be used as follows: `instanceOfDeckUpdate.copyWith(...)` or like so:`instanceOfDeckUpdate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DeckUpdateCWProxy get copyWith => _$DeckUpdateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckUpdate _$DeckUpdateFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeckUpdate', json, ($checkedConvert) {
      final val = DeckUpdate(
        title: $checkedConvert('title', (v) => v as String?),
        description: $checkedConvert('description', (v) => v as String?),
        isPublic: $checkedConvert('is_public', (v) => v as bool?),
      );
      return val;
    }, fieldKeyMap: const {'isPublic': 'is_public'});

Map<String, dynamic> _$DeckUpdateToJson(DeckUpdate instance) =>
    <String, dynamic>{
      'title': ?instance.title,
      'description': ?instance.description,
      'is_public': ?instance.isPublic,
    };
