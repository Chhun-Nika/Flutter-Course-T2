import 'dart:convert';
import 'package:activity/WEEK-09/W9%20-PRACTICE/data/config/firebase_config.dart';
import 'package:activity/WEEK-10/W10-startCode/data/dtos/comment_dto.dart';
import 'package:activity/WEEK-10/W10-startCode/data/repositories/comments/comments_repository.dart';
import 'package:activity/WEEK-10/W10-startCode/model/comments/comment.dart';
import 'package:http/http.dart' as http;

class CommentsRepositoryFirebase implements CommentsRepository {
  @override
  Future<List<Comment>> fetchComments(String artistId) async {
    final url = FirebaseConfig.baseUri.replace(
      path: '/comments.json',
      queryParameters: {'orderBy': '"artistId"', 'equalTo': '"$artistId"'},
    );

    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> commentsJson = json.decode(response.body);
      List<Comment> result = [];
      for (final entry in commentsJson.entries) {
        result.add(CommentDto.fromJson(entry.value));
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load comments');
    }
  }

  @override
  Future<void> addComment(Comment comment) async {
    final url = FirebaseConfig.baseUri.replace(path: '/comments.json');
    final http.Response response = await http.post(
      url,
      body: json.encode({
        'artistId': comment.artistId,
        'comment': comment.comment,
        'createdAt': comment.createdAt.toIso8601String(),
      }),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add comment');
    }
  }
}
