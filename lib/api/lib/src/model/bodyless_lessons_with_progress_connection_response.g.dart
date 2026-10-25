// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bodyless_lessons_with_progress_connection_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BodylessLessonsWithProgressConnectionResponseCWProxy {
  BodylessLessonsWithProgressConnectionResponse edges(
    List<BodylessLessonWithProgressEdge> edges,
  );

  BodylessLessonsWithProgressConnectionResponse pageInfo(PageInfo pageInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodylessLessonsWithProgressConnectionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodylessLessonsWithProgressConnectionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  BodylessLessonsWithProgressConnectionResponse call({
    List<BodylessLessonWithProgressEdge> edges,
    PageInfo pageInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBodylessLessonsWithProgressConnectionResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBodylessLessonsWithProgressConnectionResponse.copyWith.fieldName(...)`
class _$BodylessLessonsWithProgressConnectionResponseCWProxyImpl
    implements _$BodylessLessonsWithProgressConnectionResponseCWProxy {
  const _$BodylessLessonsWithProgressConnectionResponseCWProxyImpl(this._value);

  final BodylessLessonsWithProgressConnectionResponse _value;

  @override
  BodylessLessonsWithProgressConnectionResponse edges(
    List<BodylessLessonWithProgressEdge> edges,
  ) => this(edges: edges);

  @override
  BodylessLessonsWithProgressConnectionResponse pageInfo(PageInfo pageInfo) =>
      this(pageInfo: pageInfo);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodylessLessonsWithProgressConnectionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodylessLessonsWithProgressConnectionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  BodylessLessonsWithProgressConnectionResponse call({
    Object? edges = const $CopyWithPlaceholder(),
    Object? pageInfo = const $CopyWithPlaceholder(),
  }) {
    return BodylessLessonsWithProgressConnectionResponse(
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

extension $BodylessLessonsWithProgressConnectionResponseCopyWith
    on BodylessLessonsWithProgressConnectionResponse {
  /// Returns a callable class that can be used as follows: `instanceOfBodylessLessonsWithProgressConnectionResponse.copyWith(...)` or like so:`instanceOfBodylessLessonsWithProgressConnectionResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BodylessLessonsWithProgressConnectionResponseCWProxy get copyWith =>
      _$BodylessLessonsWithProgressConnectionResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodylessLessonsWithProgressConnectionResponse
_$BodylessLessonsWithProgressConnectionResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'BodylessLessonsWithProgressConnectionResponse',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['edges', 'page_info']);
    final val = BodylessLessonsWithProgressConnectionResponse(
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
  },
  fieldKeyMap: const {'pageInfo': 'page_info'},
);

Map<String, dynamic> _$BodylessLessonsWithProgressConnectionResponseToJson(
  BodylessLessonsWithProgressConnectionResponse instance,
) => <String, dynamic>{
  'edges': instance.edges.map((e) => e.toJson()).toList(),
  'page_info': instance.pageInfo.toJson(),
};
