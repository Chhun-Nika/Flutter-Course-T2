
abstract class UserHistoryRepository {
  List<String> getRecentSongIds();

  void addToHistory(String songId);
}
