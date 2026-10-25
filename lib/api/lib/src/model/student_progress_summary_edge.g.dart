// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_progress_summary_edge.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StudentProgressSummaryEdgeCWProxy {
  StudentProgressSummaryEdge node(StudentProgressSummary node);

  StudentProgressSummaryEdge cursor(String cursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentProgressSummaryEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentProgressSummaryEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentProgressSummaryEdge call({StudentProgressSummary node, String cursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStudentProgressSummaryEdge.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStudentProgressSummaryEdge.copyWith.fieldName(...)`
class _$StudentProgressSummaryEdgeCWProxyImpl
    implements _$StudentProgressSummaryEdgeCWProxy {
  const _$StudentProgressSummaryEdgeCWProxyImpl(this._value);

  final StudentProgressSummaryEdge _value;

  @override
  StudentProgressSummaryEdge node(StudentProgressSummary node) =>
      this(node: node);

  @override
  StudentProgressSummaryEdge cursor(String cursor) => this(cursor: cursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentProgressSummaryEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentProgressSummaryEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentProgressSummaryEdge call({
    Object? node = const $CopyWithPlaceholder(),
    Object? cursor = const $CopyWithPlaceholder(),
  }) {
    return StudentProgressSummaryEdge(
      node: node == const $CopyWithPlaceholder()
          ? _value.node
          // ignore: cast_nullable_to_non_nullable
          : node as StudentProgressSummary,
      cursor: cursor == const $CopyWithPlaceholder()
          ? _value.cursor
          // ignore: cast_nullable_to_non_nullable
          : cursor as String,
    );
  }
}

extension $StudentProgressSummaryEdgeCopyWith on StudentProgressSummaryEdge {
  /// Returns a callable class that can be used as follows: `instanceOfStudentProgressSummaryEdge.copyWith(...)` or like so:`instanceOfStudentProgressSummaryEdge.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StudentProgressSummaryEdgeCWProxy get copyWith =>
      _$StudentProgressSummaryEdgeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentProgressSummaryEdge _$StudentProgressSummaryEdgeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('StudentProgressSummaryEdge', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['node', 'cursor']);
  final val = StudentProgressSummaryEdge(
    node: $checkedConvert(
      'node',
      (v) => StudentProgressSummary.fromJson(v as Map<String, dynamic>),
    ),
    cursor: $checkedConvert('cursor', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$StudentProgressSummaryEdgeToJson(
  StudentProgressSummaryEdge instance,
) => <String, dynamic>{
  'node': instance.node.toJson(),
  'cursor': instance.cursor,
};
