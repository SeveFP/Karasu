// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_edge.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CourseEdgeCWProxy {
  CourseEdge node(Course node);

  CourseEdge cursor(String cursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CourseEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CourseEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  CourseEdge call({Course node, String cursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCourseEdge.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCourseEdge.copyWith.fieldName(...)`
class _$CourseEdgeCWProxyImpl implements _$CourseEdgeCWProxy {
  const _$CourseEdgeCWProxyImpl(this._value);

  final CourseEdge _value;

  @override
  CourseEdge node(Course node) => this(node: node);

  @override
  CourseEdge cursor(String cursor) => this(cursor: cursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CourseEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CourseEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  CourseEdge call({
    Object? node = const $CopyWithPlaceholder(),
    Object? cursor = const $CopyWithPlaceholder(),
  }) {
    return CourseEdge(
      node: node == const $CopyWithPlaceholder()
          ? _value.node
          // ignore: cast_nullable_to_non_nullable
          : node as Course,
      cursor: cursor == const $CopyWithPlaceholder()
          ? _value.cursor
          // ignore: cast_nullable_to_non_nullable
          : cursor as String,
    );
  }
}

extension $CourseEdgeCopyWith on CourseEdge {
  /// Returns a callable class that can be used as follows: `instanceOfCourseEdge.copyWith(...)` or like so:`instanceOfCourseEdge.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CourseEdgeCWProxy get copyWith => _$CourseEdgeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseEdge _$CourseEdgeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CourseEdge', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['node', 'cursor']);
      final val = CourseEdge(
        node: $checkedConvert(
          'node',
          (v) => Course.fromJson(v as Map<String, dynamic>),
        ),
        cursor: $checkedConvert('cursor', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CourseEdgeToJson(CourseEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
      'cursor': instance.cursor,
    };
