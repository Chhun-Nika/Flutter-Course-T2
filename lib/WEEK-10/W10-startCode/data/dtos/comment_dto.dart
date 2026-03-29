import 'package:activity/WEEK-10/W10-startCode/model/comments/comment.dart';

class CommentDto {
  static const String artistIdKey = 'artistId';
  static const String commentKey = 'comment';
  static const String createdAtKey = 'createdAt';

  static Comment fromJson(Map<String, dynamic> json) {
    assert(json[artistIdKey] is String);
    assert(json[commentKey] is String);
    assert(json[createdAtKey] is String);

    return Comment(
      artistId: json[artistIdKey],
      comment: json[commentKey],
      createdAt: DateTime.parse(json[createdAtKey]),
    );
  }

  Map<String, dynamic> toJson(Comment comment) {
    return {
      artistIdKey: comment.artistId,
      commentKey: comment.comment,
      createdAtKey: comment.createdAt.toString(),
    };
  }
}
