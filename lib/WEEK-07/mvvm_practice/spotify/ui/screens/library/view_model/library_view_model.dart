import 'package:activity/WEEK-07/mvvm_practice/spotify/data/repositories/history/user_history_repository.dart';
import 'package:flutter/widgets.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../../model/songs/song.dart';
import '../../../states/player_state.dart';
import '../../../states/settings_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepo;
  final AppSettingsState appSetting;
  final PlayerState playerState;
  final UserHistoryRepository userHistoryRepository;

  List<Song> songs = [];
  bool isLoading = false;

  LibraryViewModel({
    required this.songRepo,
    required this.appSetting,
    required this.playerState,
    required this.userHistoryRepository,
  }) {
    load();
  }

  Future<void> load() async {
    isLoading = true;
    notifyListeners();

    songs = songRepo.fetchSongs();

    isLoading = false;
    notifyListeners();
  }

  // get app theme color - background color - for ui usage
  Color get themeColor => appSetting.theme.backgroundColor;

  // handle ontap song
  void ontapSong(Song song) {
    playerState.start(song);
    userHistoryRepository.addToHistory(song.id);
    notifyListeners();
  }

  // get playing status
  bool isPlaying(Song song) {
    if (playerState.currentSong?.id == song.id) {
      return true;
    }
    return false;
  }
}
