// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_progress_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StudentsProgressResponseCWProxy {
  StudentsProgressResponse edges(List<StudentProgressSummaryEdge> edges);

  StudentsProgressResponse pageInfo(PageInfo pageInfo);

  StudentsProgressResponse totalEnrolled(int totalEnrolled);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentsProgressResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentsProgressResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentsProgressResponse call({
    List<StudentProgressSummaryEdge> edges,
    PageInfo pageInfo,
    int totalEnrolled,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStudentsProgressResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStudentsProgressResponse.copyWith.fieldName(...)`
class _$StudentsProgressResponseCWProxyImpl
    implements _$StudentsProgressResponseCWProxy {
  const _$StudentsProgressResponseCWProxyImpl(this._value);

  final StudentsProgressResponse _value;

  @override
  StudentsProgressResponse edges(List<StudentProgressSummaryEdge> edges) =>
      this(edges: edges);

  @override
  StudentsProgressResponse pageInfo(PageInfo pageInfo) =>
      this(pageInfo: pageInfo);

  @override
  StudentsProgressResponse totalEnrolled(int totalEnrolled) =>
      this(totalEnrolled: totalEnrolled);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentsProgressResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentsProgressResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentsProgressResponse call({
    Object? edges = const $CopyWithPlaceholder(),
    Object? pageInfo = const $CopyWithPlaceholder(),
    Object? totalEnrolled = const $CopyWithPlaceholder(),
  }) {
    return StudentsProgressResponse(
      edges: edges == const $CopyWithPlaceholder()
          ? _value.edges
          // ignore: cast_nullable_to_non_nullable
          : edges as List<StudentProgressSummaryEdge>,
      pageInfo: pageInfo == const $CopyWithPlaceholder()
          ? _value.pageInfo
          // ignore: cast_nullable_to_non_nullable
          : pageInfo as PageInfo,
      totalEnrolled: totalEnrolled == const $CopyWithPlaceholder()
          ? _value.totalEnrolled
          // ignore: cast_nullable_to_non_nullable
          : totalEnrolled as int,
    );
  }
}

extension $StudentsProgressResponseCopyWith on StudentsProgressResponse {
  /// Returns a callable class that can be used as follows: `instanceOfStudentsProgressResponse.copyWith(...)` or like so:`instanceOfStudentsProgressResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StudentsProgressResponseCWProxy get copyWith =>
      _$StudentsProgressResponseCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentsProgressResponse _$StudentsProgressResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'StudentsProgressResponse',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['edges', 'page_info', 'total_enrolled'],
    );
    final val = StudentsProgressResponse(
      edges: $checkedConvert(
        'edges',
        (v) => (v as List<dynamic>)
            .map(
              (e) => StudentProgressSummaryEdge.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      ),
      pageInfo: $checkedConvert(
        'page_info',
        (v) => PageInfo.fromJson(v as Map<String, dynamic>),
      ),
      totalEnrolled: $checkedConvert(
        'total_enrolled',
        (v) => (v as num).toInt(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'pageInfo': 'page_info',
    'totalEnrolled': 'total_enrolled',
  },
);

Map<String, dynamic> _$StudentsProgressResponseToJson(
  StudentsProgressResponse instance,
) => <String, dynamic>{
  'edges': instance.edges.map((e) => e.toJson()).toList(),
  'page_info': instance.pageInfo.toJson(),
  'total_enrolled': instance.totalEnrolled,
};
