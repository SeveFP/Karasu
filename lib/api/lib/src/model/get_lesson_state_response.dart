//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:toshokan_api/src/model/lesson_state.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_lesson_state_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetLessonStateResponse {
  /// Returns a new [GetLessonStateResponse] instance.
  GetLessonStateResponse({

    required  this.lessonState,
  });

      /// Map of lesson UUID to lesson state (lesson_id → LessonState)
  @JsonKey(
    
    name: r'lesson_state',
    required: true,
    includeIfNull: false,
  )


  final Map<String, LessonState> lessonState;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetLessonStateResponse &&
      other.lessonState == lessonState;

    @override
    int get hashCode =>
        lessonState.hashCode;

  factory GetLessonStateResponse.fromJson(Map<String, dynamic> json) => _$GetLessonStateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLessonStateResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

