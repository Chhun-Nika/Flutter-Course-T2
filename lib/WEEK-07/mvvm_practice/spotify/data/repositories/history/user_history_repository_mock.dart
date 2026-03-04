import 'package:activity/WEEK-07/mvvm_practice/spotify/data/repositories/history/user_history_repository.dart';

class UserHistoryRepositoryMock extends UserHistoryRepository {
  final List<String> _history = [];
  @override
  void addToHistory(String songId) {
    // remove the existing history, to avoid displaying song diplicately
    _history.remove(songId);
    // the lastest song will be ad the top so it will be added to the index 0
    _history.insert(0, songId);
  }

  @override
  List<String> getRecentSongIds() {
    return _history;
  }
}
