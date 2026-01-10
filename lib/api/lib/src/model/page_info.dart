//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'page_info.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PageInfo {
  /// Returns a new [PageInfo] instance.
  PageInfo({

    required  this.hasPreviousPage,

    required  this.hasNextPage,

    required  this.startCursor,

    required  this.endCursor,
  });

      /// Whether there are more results before the current page
  @JsonKey(
    
    name: r'has_previous_page',
    required: true,
    includeIfNull: false,
  )


  final bool hasPreviousPage;



      /// Whether there are more results after the current page
  @JsonKey(
    
    name: r'has_next_page',
    required: true,
    includeIfNull: false,
  )


  final bool hasNextPage;



      /// Cursor of the first item in the current page
  @JsonKey(
    
    name: r'start_cursor',
    required: true,
    includeIfNull: false,
  )


  final String startCursor;



      /// Cursor of the last item in the current page
  @JsonKey(
    
    name: r'end_cursor',
    required: true,
    includeIfNull: false,
  )


  final String endCursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PageInfo &&
      other.hasPreviousPage == hasPreviousPage &&
      other.hasNextPage == hasNextPage &&
      other.startCursor == startCursor &&
      other.endCursor == endCursor;

    @override
    int get hashCode =>
        hasPreviousPage.hashCode +
        hasNextPage.hashCode +
        startCursor.hashCode +
        endCursor.hashCode;

  factory PageInfo.fromJson(Map<String, dynamic> json) => _$PageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PageInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

