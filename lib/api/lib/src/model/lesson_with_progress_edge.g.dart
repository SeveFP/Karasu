// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_with_progress_edge.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonWithProgressEdgeCWProxy {
  LessonWithProgressEdge node(LessonWithProgress node);

  LessonWithProgressEdge cursor(String cursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonWithProgressEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonWithProgressEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonWithProgressEdge call({LessonWithProgress node, String cursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonWithProgressEdge.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonWithProgressEdge.copyWith.fieldName(...)`
class _$LessonWithProgressEdgeCWProxyImpl
    implements _$LessonWithProgressEdgeCWProxy {
  const _$LessonWithProgressEdgeCWProxyImpl(this._value);

  final LessonWithProgressEdge _value;

  @override
  LessonWithProgressEdge node(LessonWithProgress node) => this(node: node);

  @override
  LessonWithProgressEdge cursor(String cursor) => this(cursor: cursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonWithProgressEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonWithProgressEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonWithProgressEdge call({
    Object? node = const $CopyWithPlaceholder(),
    Object? cursor = const $CopyWithPlaceholder(),
  }) {
    return LessonWithProgressEdge(
      node: node == const $CopyWithPlaceholder()
          ? _value.node
          // ignore: cast_nullable_to_non_nullable
          : node as LessonWithProgress,
      cursor: cursor == const $CopyWithPlaceholder()
          ? _value.cursor
          // ignore: cast_nullable_to_non_nullable
          : cursor as String,
    );
  }
}

extension $LessonWithProgressEdgeCopyWith on LessonWithProgressEdge {
  /// Returns a callable class that can be used as follows: `instanceOfLessonWithProgressEdge.copyWith(...)` or like so:`instanceOfLessonWithProgressEdge.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonWithProgressEdgeCWProxy get copyWith =>
      _$LessonWithProgressEdgeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonWithProgressEdge _$LessonWithProgressEdgeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('LessonWithProgressEdge', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['node', 'cursor']);
  final val = LessonWithProgressEdge(
    node: $checkedConvert(
      'node',
      (v) => LessonWithProgress.fromJson(v as Map<String, dynamic>),
    ),
    cursor: $checkedConvert('cursor', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$LessonWithProgressEdgeToJson(
  LessonWithProgressEdge instance,
) => <String, dynamic>{
  'node': instance.node.toJson(),
  'cursor': instance.cursor,
};
