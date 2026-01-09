//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/lesson_progress.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lesson_state.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class LessonState {
  /// Returns a new [LessonState] instance.
  LessonState({

    required  this.lessonState,
  });

      /// Map of lesson UUID to lesson progress (lesson_id → LessonProgress)
  @JsonKey(
    
    name: r'lesson_state',
    required: true,
    includeIfNull: false,
  )


  final Map<String, LessonProgress> lessonState;





    @override
    bool operator ==(Object other) => identical(this, other) || other is LessonState &&
      other.lessonState == lessonState;

    @override
    int get hashCode =>
        lessonState.hashCode;

  factory LessonState.fromJson(Map<String, dynamic> json) => _$LessonStateFromJson(json);

  Map<String, dynamic> toJson() => _$LessonStateToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

