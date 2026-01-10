// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lessons_with_progress_connection_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonsWithProgressConnectionResponseCWProxy {
  LessonsWithProgressConnectionResponse edges(
    List<LessonWithProgressEdge> edges,
  );

  LessonsWithProgressConnectionResponse pageInfo(PageInfo pageInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonsWithProgressConnectionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonsWithProgressConnectionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonsWithProgressConnectionResponse call({
    List<LessonWithProgressEdge> edges,
    PageInfo pageInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonsWithProgressConnectionResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonsWithProgressConnectionResponse.copyWith.fieldName(...)`
class _$LessonsWithProgressConnectionResponseCWProxyImpl
    implements _$LessonsWithProgressConnectionResponseCWProxy {
  const _$LessonsWithProgressConnectionResponseCWProxyImpl(this._value);

  final LessonsWithProgressConnectionResponse _value;

  @override
  LessonsWithProgressConnectionResponse edges(
    List<LessonWithProgressEdge> edges,
  ) => this(edges: edges);

  @override
  LessonsWithProgressConnectionResponse pageInfo(PageInfo pageInfo) =>
      this(pageInfo: pageInfo);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonsWithProgressConnectionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonsWithProgressConnectionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonsWithProgressConnectionResponse call({
    Object? edges = const $CopyWithPlaceholder(),
    Object? pageInfo = const $CopyWithPlaceholder(),
  }) {
    return LessonsWithProgressConnectionResponse(
      edges: edges == const $CopyWithPlaceholder()
          ? _value.edges
          // ignore: cast_nullable_to_non_nullable
          : edges as List<LessonWithProgressEdge>,
      pageInfo: pageInfo == const $CopyWithPlaceholder()
          ? _value.pageInfo
          // ignore: cast_nullable_to_non_nullable
          : pageInfo as PageInfo,
    );
  }
}

extension $LessonsWithProgressConnectionResponseCopyWith
    on LessonsWithProgressConnectionResponse {
  /// Returns a callable class that can be used as follows: `instanceOfLessonsWithProgressConnectionResponse.copyWith(...)` or like so:`instanceOfLessonsWithProgressConnectionResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonsWithProgressConnectionResponseCWProxy get copyWith =>
      _$LessonsWithProgressConnectionResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonsWithProgressConnectionResponse
_$LessonsWithProgressConnectionResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LessonsWithProgressConnectionResponse',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['edges', 'page_info']);
        final val = LessonsWithProgressConnectionResponse(
          edges: $checkedConvert(
            'edges',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => LessonWithProgressEdge.fromJson(
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
      },
      fieldKeyMap: const {'pageInfo': 'page_info'},
    );

Map<String, dynamic> _$LessonsWithProgressConnectionResponseToJson(
  LessonsWithProgressConnectionResponse instance,
) => <String, dynamic>{
  'edges': instance.edges.map((e) => e.toJson()).toList(),
  'page_info': instance.pageInfo.toJson(),
};
