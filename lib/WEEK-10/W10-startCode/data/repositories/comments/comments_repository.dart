import 'package:activity/WEEK-10/W10-startCode/model/comments/comment.dart';

abstract class CommentsRepository {
  Future<List<Comment>> fetchComments(String artistId);

  Future<void> addComment(Comment newComment);
}
