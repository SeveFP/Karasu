//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'enroll_course200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class EnrollCourse200Response {
  /// Returns a new [EnrollCourse200Response] instance.
  EnrollCourse200Response({

     this.success,
  });

  @JsonKey(
    
    name: r'success',
    required: false,
    includeIfNull: false,
  )


  final bool? success;





    @override
    bool operator ==(Object other) => identical(this, other) || other is EnrollCourse200Response &&
      other.success == success;

    @override
    int get hashCode =>
        success.hashCode;

  factory EnrollCourse200Response.fromJson(Map<String, dynamic> json) => _$EnrollCourse200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EnrollCourse200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

