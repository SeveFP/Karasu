// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PageInfoCWProxy {
  PageInfo hasPreviousPage(bool hasPreviousPage);

  PageInfo hasNextPage(bool hasNextPage);

  PageInfo startCursor(String startCursor);

  PageInfo endCursor(String endCursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  PageInfo call({
    bool hasPreviousPage,
    bool hasNextPage,
    String startCursor,
    String endCursor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPageInfo.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPageInfo.copyWith.fieldName(...)`
class _$PageInfoCWProxyImpl implements _$PageInfoCWProxy {
  const _$PageInfoCWProxyImpl(this._value);

  final PageInfo _value;

  @override
  PageInfo hasPreviousPage(bool hasPreviousPage) =>
      this(hasPreviousPage: hasPreviousPage);

  @override
  PageInfo hasNextPage(bool hasNextPage) => this(hasNextPage: hasNextPage);

  @override
  PageInfo startCursor(String startCursor) => this(startCursor: startCursor);

  @override
  PageInfo endCursor(String endCursor) => this(endCursor: endCursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PageInfo(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PageInfo(...).copyWith(id: 12, name: "My name")
  /// ````
  PageInfo call({
    Object? hasPreviousPage = const $CopyWithPlaceholder(),
    Object? hasNextPage = const $CopyWithPlaceholder(),
    Object? startCursor = const $CopyWithPlaceholder(),
    Object? endCursor = const $CopyWithPlaceholder(),
  }) {
    return PageInfo(
      hasPreviousPage: hasPreviousPage == const $CopyWithPlaceholder()
          ? _value.hasPreviousPage
          // ignore: cast_nullable_to_non_nullable
          : hasPreviousPage as bool,
      hasNextPage: hasNextPage == const $CopyWithPlaceholder()
          ? _value.hasNextPage
          // ignore: cast_nullable_to_non_nullable
          : hasNextPage as bool,
      startCursor: startCursor == const $CopyWithPlaceholder()
          ? _value.startCursor
          // ignore: cast_nullable_to_non_nullable
          : startCursor as String,
      endCursor: endCursor == const $CopyWithPlaceholder()
          ? _value.endCursor
          // ignore: cast_nullable_to_non_nullable
          : endCursor as String,
    );
  }
}

extension $PageInfoCopyWith on PageInfo {
  /// Returns a callable class that can be used as follows: `instanceOfPageInfo.copyWith(...)` or like so:`instanceOfPageInfo.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PageInfoCWProxy get copyWith => _$PageInfoCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PageInfo',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'has_previous_page',
        'has_next_page',
        'start_cursor',
        'end_cursor',
      ],
    );
    final val = PageInfo(
      hasPreviousPage: $checkedConvert('has_previous_page', (v) => v as bool),
      hasNextPage: $checkedConvert('has_next_page', (v) => v as bool),
      startCursor: $checkedConvert('start_cursor', (v) => v as String),
      endCursor: $checkedConvert('end_cursor', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'hasPreviousPage': 'has_previous_page',
    'hasNextPage': 'has_next_page',
    'startCursor': 'start_cursor',
    'endCursor': 'end_cursor',
  },
);

Map<String, dynamic> _$PageInfoToJson(PageInfo instance) => <String, dynamic>{
  'has_previous_page': instance.hasPreviousPage,
  'has_next_page': instance.hasNextPage,
  'start_cursor': instance.startCursor,
  'end_cursor': instance.endCursor,
};
