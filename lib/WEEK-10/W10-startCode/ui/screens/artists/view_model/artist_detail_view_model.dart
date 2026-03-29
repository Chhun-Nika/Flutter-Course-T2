import 'package:activity/WEEK-10/W10-startCode/data/repositories/artist/artist_repository.dart';
import 'package:activity/WEEK-10/W10-startCode/data/repositories/comments/comments_repository.dart';
import 'package:activity/WEEK-10/W10-startCode/ui/utils/async_value.dart';
import 'package:flutter/material.dart';

import '../../../../model/comments/comment.dart';
import '../../../../model/songs/song.dart';

class ArtistDetailViewModel extends ChangeNotifier {
  final CommentsRepository commentsRepository;
  final ArtistRepository artistRepository;
  final String artistId;
  AsyncValue<List<Comment>> commentsValue = AsyncValue.loading();
  AsyncValue<List<Song>> songsValue = AsyncValue.loading();
  ArtistDetailViewModel({
    required this.commentsRepository,
    required this.artistId,
    required this.artistRepository,
  }) {
    _init();
  }

  void _init() {
    fetchComments();
    fetchSongsByArtist();
  }

  Future<void> fetchComments() async {
    commentsValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Comment> comments = await commentsRepository.fetchComments(artistId);
      commentsValue = AsyncValue.success(comments);
    } catch (e) {
      commentsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  Future<void> fetchSongsByArtist() async {
    songsValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Song> songsByArtist = await artistRepository.fetchSongsByArtists(
        artistId,
      );
      songsValue = AsyncValue.success(songsByArtist);
    } catch (e) {
      songsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }

  Future<void> addComment(Comment comment) async {
    await commentsRepository.addComment(comment);
    final current = commentsValue.data ?? [];
    commentsValue = AsyncValue.success([comment, ...current]);
    notifyListeners();
  }
}
