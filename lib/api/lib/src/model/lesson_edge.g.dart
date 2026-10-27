// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_edge.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LessonEdgeCWProxy {
  LessonEdge node(Lesson node);

  LessonEdge cursor(String cursor);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonEdge call({Lesson node, String cursor});
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLessonEdge.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLessonEdge.copyWith.fieldName(...)`
class _$LessonEdgeCWProxyImpl implements _$LessonEdgeCWProxy {
  const _$LessonEdgeCWProxyImpl(this._value);

  final LessonEdge _value;

  @override
  LessonEdge node(Lesson node) => this(node: node);

  @override
  LessonEdge cursor(String cursor) => this(cursor: cursor);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LessonEdge(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LessonEdge(...).copyWith(id: 12, name: "My name")
  /// ````
  LessonEdge call({
    Object? node = const $CopyWithPlaceholder(),
    Object? cursor = const $CopyWithPlaceholder(),
  }) {
    return LessonEdge(
      node: node == const $CopyWithPlaceholder()
          ? _value.node
          // ignore: cast_nullable_to_non_nullable
          : node as Lesson,
      cursor: cursor == const $CopyWithPlaceholder()
          ? _value.cursor
          // ignore: cast_nullable_to_non_nullable
          : cursor as String,
    );
  }
}

extension $LessonEdgeCopyWith on LessonEdge {
  /// Returns a callable class that can be used as follows: `instanceOfLessonEdge.copyWith(...)` or like so:`instanceOfLessonEdge.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LessonEdgeCWProxy get copyWith => _$LessonEdgeCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonEdge _$LessonEdgeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('LessonEdge', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['node', 'cursor']);
      final val = LessonEdge(
        node: $checkedConvert(
          'node',
          (v) => Lesson.fromJson(v as Map<String, dynamic>),
        ),
        cursor: $checkedConvert('cursor', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$LessonEdgeToJson(LessonEdge instance) =>
    <String, dynamic>{
      'node': instance.node.toJson(),
      'cursor': instance.cursor,
    };
