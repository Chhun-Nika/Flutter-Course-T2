import 'package:flutter/widgets.dart';
import '../../../../data/repositories/history/user_history_repository.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../states/player_state.dart';

class HomeViewModel extends ChangeNotifier {
  final UserHistoryRepository userHistoryRepository;
  final SongRepository songRepository;
  final PlayerState playerState;

  List<Song> history = [];
  bool isEmpty = false;

  HomeViewModel({
    required this.userHistoryRepository,
    required this.songRepository,
    required this.playerState,
  }) {
    getRecentSongs();
  }

  Future<void> getRecentSongs() async {
    final songIds = userHistoryRepository.getRecentSongIds();
    if (userHistoryRepository.getRecentSongIds().isEmpty) {
      isEmpty = true;
      notifyListeners();
      return;
    }
    isEmpty = false;
    for (var id in songIds) {
      final song = songRepository.fetchSongById(id);
      if (song != null) {
        history.add(song);
      }
    }
    notifyListeners();
  }

  bool getPlayerState(Song song) {
    if (song.id == playerState.currentSong?.id) {
      return true;
    }
    return false;
  }
}
