// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_connection_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonsConnectionResponseCWProxy {
  LessonsConnectionResponse edges(List<LessonEdge> edges);

  LessonsConnectionResponse pageInfo(PageInfo pageInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonsConnectionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonsConnectionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonsConnectionResponse call({List<LessonEdge> edges, PageInfo pageInfo});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonsConnectionResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonsConnectionResponse.copyWith.fieldName(...)`
class _$LessonsConnectionResponseCWProxyImpl
    implements _$LessonsConnectionResponseCWProxy {
  const _$LessonsConnectionResponseCWProxyImpl(this._value);

  final LessonsConnectionResponse _value;

  @override
  LessonsConnectionResponse edges(List<LessonEdge> edges) => this(edges: edges);

  @override
  LessonsConnectionResponse pageInfo(PageInfo pageInfo) =>
      this(pageInfo: pageInfo);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonsConnectionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonsConnectionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonsConnectionResponse call({
    Object? edges = const $CopyWithPlaceholder(),
    Object? pageInfo = const $CopyWithPlaceholder(),
  }) {
    return LessonsConnectionResponse(
      edges: edges == const $CopyWithPlaceholder()
          ? _value.edges
          // ignore: cast_nullable_to_non_nullable
          : edges as List<LessonEdge>,
      pageInfo: pageInfo == const $CopyWithPlaceholder()
          ? _value.pageInfo
          // ignore: cast_nullable_to_non_nullable
          : pageInfo as PageInfo,
    );
  }
}

extension $LessonsConnectionResponseCopyWith on LessonsConnectionResponse {
  /// Returns a callable class that can be used as follows: `instanceOfLessonsConnectionResponse.copyWith(...)` or like so:`instanceOfLessonsConnectionResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonsConnectionResponseCWProxy get copyWith =>
      _$LessonsConnectionResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonsConnectionResponse _$LessonsConnectionResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('LessonsConnectionResponse', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['edges', 'page_info']);
  final val = LessonsConnectionResponse(
    edges: $checkedConvert(
      'edges',
      (v) => (v as List<dynamic>)
          .map((e) => LessonEdge.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    pageInfo: $checkedConvert(
      'page_info',
      (v) => PageInfo.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
}, fieldKeyMap: const {'pageInfo': 'page_info'});

Map<String, dynamic> _$LessonsConnectionResponseToJson(
  LessonsConnectionResponse instance,
) => <String, dynamic>{
  'edges': instance.edges.map((e) => e.toJson()).toList(),
  'page_info': instance.pageInfo.toJson(),
};
