//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SignUpRequest {
  /// Returns a new [SignUpRequest] instance.
  SignUpRequest({

    required  this.username,

    required  this.password,

     this.nick,

     this.bio,
  });

      /// Unique username
  @JsonKey(
    
    name: r'username',
    required: true,
    includeIfNull: false,
  )


  final String username;



      /// User password
  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



      /// Display name
  @JsonKey(
    
    name: r'nick',
    required: false,
    includeIfNull: false,
  )


  final String? nick;



      /// User biography
  @JsonKey(
    
    name: r'bio',
    required: false,
    includeIfNull: false,
  )


  final String? bio;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SignUpRequest &&
      other.username == username &&
      other.password == password &&
      other.nick == nick &&
      other.bio == bio;

    @override
    int get hashCode =>
        username.hashCode +
        password.hashCode +
        nick.hashCode +
        bio.hashCode;

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

