// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bodyless_lesson_with_progress_edge.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$BodylessLessonWithProgressEdgeCWProxy {
  BodylessLessonWithProgressEdge node(BodylessLessonWithProgress node);

  BodylessLessonWithProgressEdge cursor(String cursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodylessLessonWithProgressEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodylessLessonWithProgressEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  BodylessLessonWithProgressEdge call({
    BodylessLessonWithProgress node,
    String cursor,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfBodylessLessonWithProgressEdge.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfBodylessLessonWithProgressEdge.copyWith.fieldName(...)`
class _$BodylessLessonWithProgressEdgeCWProxyImpl
    implements _$BodylessLessonWithProgressEdgeCWProxy {
  const _$BodylessLessonWithProgressEdgeCWProxyImpl(this._value);

  final BodylessLessonWithProgressEdge _value;

  @override
  BodylessLessonWithProgressEdge node(BodylessLessonWithProgress node) =>
      this(node: node);

  @override
  BodylessLessonWithProgressEdge cursor(String cursor) => this(cursor: cursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `BodylessLessonWithProgressEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// BodylessLessonWithProgressEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  BodylessLessonWithProgressEdge call({
    Object? node = const $CopyWithPlaceholder(),
    Object? cursor = const $CopyWithPlaceholder(),
  }) {
    return BodylessLessonWithProgressEdge(
      node: node == const $CopyWithPlaceholder()
          ? _value.node
          // ignore: cast_nullable_to_non_nullable
          : node as BodylessLessonWithProgress,
      cursor: cursor == const $CopyWithPlaceholder()
          ? _value.cursor
          // ignore: cast_nullable_to_non_nullable
          : cursor as String,
    );
  }
}

extension $BodylessLessonWithProgressEdgeCopyWith
    on BodylessLessonWithProgressEdge {
  /// Returns a callable class that can be used as follows: `instanceOfBodylessLessonWithProgressEdge.copyWith(...)` or like so:`instanceOfBodylessLessonWithProgressEdge.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$BodylessLessonWithProgressEdgeCWProxy get copyWith =>
      _$BodylessLessonWithProgressEdgeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodylessLessonWithProgressEdge _$BodylessLessonWithProgressEdgeFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('BodylessLessonWithProgressEdge', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['node', 'cursor']);
  final val = BodylessLessonWithProgressEdge(
    node: $checkedConvert(
      'node',
      (v) => BodylessLessonWithProgress.fromJson(v as Map<String, dynamic>),
    ),
    cursor: $checkedConvert('cursor', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$BodylessLessonWithProgressEdgeToJson(
  BodylessLessonWithProgressEdge instance,
) => <String, dynamic>{
  'node': instance.node.toJson(),
  'cursor': instance.cursor,
};
