// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_courses_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AllCoursesResponseCWProxy {
  AllCoursesResponse edges(List<CourseEdge> edges);

  AllCoursesResponse pageInfo(PageInfo pageInfo);

  AllCoursesResponse totalCount(int totalCount);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AllCoursesResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AllCoursesResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  AllCoursesResponse call({
    List<CourseEdge> edges,
    PageInfo pageInfo,
    int totalCount,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAllCoursesResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAllCoursesResponse.copyWith.fieldName(...)`
class _$AllCoursesResponseCWProxyImpl implements _$AllCoursesResponseCWProxy {
  const _$AllCoursesResponseCWProxyImpl(this._value);

  final AllCoursesResponse _value;

  @override
  AllCoursesResponse edges(List<CourseEdge> edges) => this(edges: edges);

  @override
  AllCoursesResponse pageInfo(PageInfo pageInfo) => this(pageInfo: pageInfo);

  @override
  AllCoursesResponse totalCount(int totalCount) => this(totalCount: totalCount);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AllCoursesResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AllCoursesResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  AllCoursesResponse call({
    Object? edges = const $CopyWithPlaceholder(),
    Object? pageInfo = const $CopyWithPlaceholder(),
    Object? totalCount = const $CopyWithPlaceholder(),
  }) {
    return AllCoursesResponse(
      edges: edges == const $CopyWithPlaceholder()
          ? _value.edges
          // ignore: cast_nullable_to_non_nullable
          : edges as List<CourseEdge>,
      pageInfo: pageInfo == const $CopyWithPlaceholder()
          ? _value.pageInfo
          // ignore: cast_nullable_to_non_nullable
          : pageInfo as PageInfo,
      totalCount: totalCount == const $CopyWithPlaceholder()
          ? _value.totalCount
          // ignore: cast_nullable_to_non_nullable
          : totalCount as int,
    );
  }
}

extension $AllCoursesResponseCopyWith on AllCoursesResponse {
  /// Returns a callable class that can be used as follows: `instanceOfAllCoursesResponse.copyWith(...)` or like so:`instanceOfAllCoursesResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AllCoursesResponseCWProxy get copyWith =>
      _$AllCoursesResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllCoursesResponse _$AllCoursesResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AllCoursesResponse',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['edges', 'page_info', 'total_count'],
        );
        final val = AllCoursesResponse(
          edges: $checkedConvert(
            'edges',
            (v) => (v as List<dynamic>)
                .map((e) => CourseEdge.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          pageInfo: $checkedConvert(
            'page_info',
            (v) => PageInfo.fromJson(v as Map<String, dynamic>),
          ),
          totalCount: $checkedConvert('total_count', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {'pageInfo': 'page_info', 'totalCount': 'total_count'},
    );

Map<String, dynamic> _$AllCoursesResponseToJson(AllCoursesResponse instance) =>
    <String, dynamic>{
      'edges': instance.edges.map((e) => e.toJson()).toList(),
      'page_info': instance.pageInfo.toJson(),
      'total_count': instance.totalCount,
    };
