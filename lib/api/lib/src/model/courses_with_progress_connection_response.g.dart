// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_with_progress_connection_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CoursesWithProgressConnectionResponseCWProxy {
  CoursesWithProgressConnectionResponse edges(
    List<CourseWithProgressEdge> edges,
  );

  CoursesWithProgressConnectionResponse pageInfo(PageInfo pageInfo);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CoursesWithProgressConnectionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CoursesWithProgressConnectionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CoursesWithProgressConnectionResponse call({
    List<CourseWithProgressEdge> edges,
    PageInfo pageInfo,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCoursesWithProgressConnectionResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCoursesWithProgressConnectionResponse.copyWith.fieldName(...)`
class _$CoursesWithProgressConnectionResponseCWProxyImpl
    implements _$CoursesWithProgressConnectionResponseCWProxy {
  const _$CoursesWithProgressConnectionResponseCWProxyImpl(this._value);

  final CoursesWithProgressConnectionResponse _value;

  @override
  CoursesWithProgressConnectionResponse edges(
    List<CourseWithProgressEdge> edges,
  ) => this(edges: edges);

  @override
  CoursesWithProgressConnectionResponse pageInfo(PageInfo pageInfo) =>
      this(pageInfo: pageInfo);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CoursesWithProgressConnectionResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CoursesWithProgressConnectionResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  CoursesWithProgressConnectionResponse call({
    Object? edges = const $CopyWithPlaceholder(),
    Object? pageInfo = const $CopyWithPlaceholder(),
  }) {
    return CoursesWithProgressConnectionResponse(
      edges: edges == const $CopyWithPlaceholder()
          ? _value.edges
          // ignore: cast_nullable_to_non_nullable
          : edges as List<CourseWithProgressEdge>,
      pageInfo: pageInfo == const $CopyWithPlaceholder()
          ? _value.pageInfo
          // ignore: cast_nullable_to_non_nullable
          : pageInfo as PageInfo,
    );
  }
}

extension $CoursesWithProgressConnectionResponseCopyWith
    on CoursesWithProgressConnectionResponse {
  /// Returns a callable class that can be used as follows: `instanceOfCoursesWithProgressConnectionResponse.copyWith(...)` or like so:`instanceOfCoursesWithProgressConnectionResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CoursesWithProgressConnectionResponseCWProxy get copyWith =>
      _$CoursesWithProgressConnectionResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoursesWithProgressConnectionResponse
_$CoursesWithProgressConnectionResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CoursesWithProgressConnectionResponse',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['edges', 'page_info']);
        final val = CoursesWithProgressConnectionResponse(
          edges: $checkedConvert(
            'edges',
            (v) => (v as List<dynamic>)
                .map(
                  (e) => CourseWithProgressEdge.fromJson(
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

Map<String, dynamic> _$CoursesWithProgressConnectionResponseToJson(
  CoursesWithProgressConnectionResponse instance,
) => <String, dynamic>{
  'edges': instance.edges.map((e) => e.toJson()).toList(),
  'page_info': instance.pageInfo.toJson(),
};
