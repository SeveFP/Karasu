// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_progress_summary.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StudentProgressSummaryCWProxy {
  StudentProgressSummary userId(String userId);

  StudentProgressSummary username(String? username);

  StudentProgressSummary nick(String? nick);

  StudentProgressSummary currentLessonId(String currentLessonId);

  StudentProgressSummary lessonsCompleted(int lessonsCompleted);

  StudentProgressSummary totalLessons(int totalLessons);

  StudentProgressSummary totalCorrectAnswers(int totalCorrectAnswers);

  StudentProgressSummary totalIncorrectAnswers(int totalIncorrectAnswers);

  StudentProgressSummary enrolledAt(DateTime enrolledAt);

  StudentProgressSummary lastActivityAt(DateTime lastActivityAt);

  StudentProgressSummary lessonDetails(
    List<LessonProgressDetail>? lessonDetails,
  );

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentProgressSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentProgressSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentProgressSummary call({
    String userId,
    String? username,
    String? nick,
    String currentLessonId,
    int lessonsCompleted,
    int totalLessons,
    int totalCorrectAnswers,
    int totalIncorrectAnswers,
    DateTime enrolledAt,
    DateTime lastActivityAt,
    List<LessonProgressDetail>? lessonDetails,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStudentProgressSummary.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStudentProgressSummary.copyWith.fieldName(...)`
class _$StudentProgressSummaryCWProxyImpl
    implements _$StudentProgressSummaryCWProxy {
  const _$StudentProgressSummaryCWProxyImpl(this._value);

  final StudentProgressSummary _value;

  @override
  StudentProgressSummary userId(String userId) => this(userId: userId);

  @override
  StudentProgressSummary username(String? username) => this(username: username);

  @override
  StudentProgressSummary nick(String? nick) => this(nick: nick);

  @override
  StudentProgressSummary currentLessonId(String currentLessonId) =>
      this(currentLessonId: currentLessonId);

  @override
  StudentProgressSummary lessonsCompleted(int lessonsCompleted) =>
      this(lessonsCompleted: lessonsCompleted);

  @override
  StudentProgressSummary totalLessons(int totalLessons) =>
      this(totalLessons: totalLessons);

  @override
  StudentProgressSummary totalCorrectAnswers(int totalCorrectAnswers) =>
      this(totalCorrectAnswers: totalCorrectAnswers);

  @override
  StudentProgressSummary totalIncorrectAnswers(int totalIncorrectAnswers) =>
      this(totalIncorrectAnswers: totalIncorrectAnswers);

  @override
  StudentProgressSummary enrolledAt(DateTime enrolledAt) =>
      this(enrolledAt: enrolledAt);

  @override
  StudentProgressSummary lastActivityAt(DateTime lastActivityAt) =>
      this(lastActivityAt: lastActivityAt);

  @override
  StudentProgressSummary lessonDetails(
    List<LessonProgressDetail>? lessonDetails,
  ) => this(lessonDetails: lessonDetails);

  @override
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentProgressSummary(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentProgressSummary(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentProgressSummary call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? nick = const $CopyWithPlaceholder(),
    Object? currentLessonId = const $CopyWithPlaceholder(),
    Object? lessonsCompleted = const $CopyWithPlaceholder(),
    Object? totalLessons = const $CopyWithPlaceholder(),
    Object? totalCorrectAnswers = const $CopyWithPlaceholder(),
    Object? totalIncorrectAnswers = const $CopyWithPlaceholder(),
    Object? enrolledAt = const $CopyWithPlaceholder(),
    Object? lastActivityAt = const $CopyWithPlaceholder(),
    Object? lessonDetails = const $CopyWithPlaceholder(),
  }) {
    return StudentProgressSummary(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String,
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String?,
      nick: nick == const $CopyWithPlaceholder()
          ? _value.nick
          // ignore: cast_nullable_to_non_nullable
          : nick as String?,
      currentLessonId: currentLessonId == const $CopyWithPlaceholder()
          ? _value.currentLessonId
          // ignore: cast_nullable_to_non_nullable
          : currentLessonId as String,
      lessonsCompleted: lessonsCompleted == const $CopyWithPlaceholder()
          ? _value.lessonsCompleted
          // ignore: cast_nullable_to_non_nullable
          : lessonsCompleted as int,
      totalLessons: totalLessons == const $CopyWithPlaceholder()
          ? _value.totalLessons
          // ignore: cast_nullable_to_non_nullable
          : totalLessons as int,
      totalCorrectAnswers: totalCorrectAnswers == const $CopyWithPlaceholder()
          ? _value.totalCorrectAnswers
          // ignore: cast_nullable_to_non_nullable
          : totalCorrectAnswers as int,
      totalIncorrectAnswers:
          totalIncorrectAnswers == const $CopyWithPlaceholder()
          ? _value.totalIncorrectAnswers
          // ignore: cast_nullable_to_non_nullable
          : totalIncorrectAnswers as int,
      enrolledAt: enrolledAt == const $CopyWithPlaceholder()
          ? _value.enrolledAt
          // ignore: cast_nullable_to_non_nullable
          : enrolledAt as DateTime,
      lastActivityAt: lastActivityAt == const $CopyWithPlaceholder()
          ? _value.lastActivityAt
          // ignore: cast_nullable_to_non_nullable
          : lastActivityAt as DateTime,
      lessonDetails: lessonDetails == const $CopyWithPlaceholder()
          ? _value.lessonDetails
          // ignore: cast_nullable_to_non_nullable
          : lessonDetails as List<LessonProgressDetail>?,
    );
  }
}

extension $StudentProgressSummaryCopyWith on StudentProgressSummary {
  /// Returns a callable class that can be used as follows: `instanceOfStudentProgressSummary.copyWith(...)` or like so:`instanceOfStudentProgressSummary.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StudentProgressSummaryCWProxy get copyWith =>
      _$StudentProgressSummaryCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentProgressSummary _$StudentProgressSummaryFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'StudentProgressSummary',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'user_id',
        'current_lesson_id',
        'lessons_completed',
        'total_lessons',
        'total_correct_answers',
        'total_incorrect_answers',
        'enrolled_at',
        'last_activity_at',
      ],
    );
    final val = StudentProgressSummary(
      userId: $checkedConvert('user_id', (v) => v as String),
      username: $checkedConvert('username', (v) => v as String?),
      nick: $checkedConvert('nick', (v) => v as String?),
      currentLessonId: $checkedConvert('current_lesson_id', (v) => v as String),
      lessonsCompleted: $checkedConvert(
        'lessons_completed',
        (v) => (v as num).toInt(),
      ),
      totalLessons: $checkedConvert('total_lessons', (v) => (v as num).toInt()),
      totalCorrectAnswers: $checkedConvert(
        'total_correct_answers',
        (v) => (v as num).toInt(),
      ),
      totalIncorrectAnswers: $checkedConvert(
        'total_incorrect_answers',
        (v) => (v as num).toInt(),
      ),
      enrolledAt: $checkedConvert(
        'enrolled_at',
        (v) => DateTime.parse(v as String),
      ),
      lastActivityAt: $checkedConvert(
        'last_activity_at',
        (v) => DateTime.parse(v as String),
      ),
      lessonDetails: $checkedConvert(
        'lesson_details',
        (v) => (v as List<dynamic>?)
            ?.map(
              (e) => LessonProgressDetail.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userId': 'user_id',
    'currentLessonId': 'current_lesson_id',
    'lessonsCompleted': 'lessons_completed',
    'totalLessons': 'total_lessons',
    'totalCorrectAnswers': 'total_correct_answers',
    'totalIncorrectAnswers': 'total_incorrect_answers',
    'enrolledAt': 'enrolled_at',
    'lastActivityAt': 'last_activity_at',
    'lessonDetails': 'lesson_details',
  },
);

Map<String, dynamic> _$StudentProgressSummaryToJson(
  StudentProgressSummary instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'username': ?instance.username,
  'nick': ?instance.nick,
  'current_lesson_id': instance.currentLessonId,
  'lessons_completed': instance.lessonsCompleted,
  'total_lessons': instance.totalLessons,
  'total_correct_answers': instance.totalCorrectAnswers,
  'total_incorrect_answers': instance.totalIncorrectAnswers,
  'enrolled_at': instance.enrolledAt.toIso8601String(),
  'last_activity_at': instance.lastActivityAt.toIso8601String(),
  'lesson_details': ?instance.lessonDetails?.map((e) => e.toJson()).toList(),
};
