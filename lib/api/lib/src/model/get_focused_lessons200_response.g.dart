// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_focused_lessons200_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$GetFocusedLessons200ResponseCWProxy {
  GetFocusedLessons200Response edges(
    List<BodylessLessonWithProgressEdge> edges,
  );

  GetFocusedLessons200Response pageInfo(PageInfo pageInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetFocusedLessons200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetFocusedLessons200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetFocusedLessons200Response call({
    List<BodylessLessonWithProgressEdge> edges,
    PageInfo pageInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfGetFocusedLessons200Response.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfGetFocusedLessons200Response.copyWith.fieldName(...)`
class _$GetFocusedLessons200ResponseCWProxyImpl
    implements _$GetFocusedLessons200ResponseCWProxy {
  const _$GetFocusedLessons200ResponseCWProxyImpl(this._value);

  final GetFocusedLessons200Response _value;

  @override
  GetFocusedLessons200Response edges(
    List<BodylessLessonWithProgressEdge> edges,
  ) => this(edges: edges);

  @override
  GetFocusedLessons200Response pageInfo(PageInfo pageInfo) =>
      this(pageInfo: pageInfo);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `GetFocusedLessons200Response(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// GetFocusedLessons200Response(...).copyWith(id: 12, name: "My name")
  /// ````
  GetFocusedLessons200Response call({
    Object? edges = const $CopyWithPlaceholder(),
    Object? pageInfo = const $CopyWithPlaceholder(),
  }) {
    return GetFocusedLessons200Response(
      edges: edges == const $CopyWithPlaceholder()
          ? _value.edges
          // ignore: cast_nullable_to_non_nullable
          : edges as List<BodylessLessonWithProgressEdge>,
      pageInfo: pageInfo == const $CopyWithPlaceholder()
          ? _value.pageInfo
          // ignore: cast_nullable_to_non_nullable
          : pageInfo as PageInfo,
    );
  }
}

extension $GetFocusedLessons200ResponseCopyWith
    on GetFocusedLessons200Response {
  /// Returns a callable class that can be used as follows: `instanceOfGetFocusedLessons200Response.copyWith(...)` or like so:`instanceOfGetFocusedLessons200Response.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$GetFocusedLessons200ResponseCWProxy get copyWith =>
      _$GetFocusedLessons200ResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFocusedLessons200Response _$GetFocusedLessons200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('GetFocusedLessons200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['edges', 'page_info']);
  final val = GetFocusedLessons200Response(
    edges: $checkedConvert(
      'edges',
      (v) => (v as List<dynamic>)
          .map(
            (e) => BodylessLessonWithProgressEdge.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
    pageInfo: $checkedConvert(
      'page_info',
      (v) => PageInfo.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
}, fieldKeyMap: const {'pageInfo': 'page_info'});

Map<String, dynamic> _$GetFocusedLessons200ResponseToJson(
  GetFocusedLessons200Response instance,
) => <String, dynamic>{
  'edges': instance.edges.map((e) => e.toJson()).toList(),
  'page_info': instance.pageInfo.toJson(),
};
