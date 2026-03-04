import 'package:activity/WEEK-07/mvvm_practice/spotify/data/repositories/history/user_history_repository.dart';
import 'package:activity/WEEK-07/mvvm_practice/spotify/ui/screens/library/view_model/library_view_model.dart';
import 'package:activity/WEEK-07/mvvm_practice/spotify/ui/screens/library/widgets/library_content.dart';
import 'package:activity/WEEK-07/mvvm_practice/spotify/ui/states/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingsState appSettingsState = context.read<AppSettingsState>();

    return ChangeNotifierProvider(
      create: (context) => LibraryViewModel(
        songRepo: context.read<SongRepository>(),
        appSetting: context.read<AppSettingsState>(),
        playerState: context.read<PlayerState>(),
        userHistoryRepository: context.read<UserHistoryRepository>()
      ),
      child: Container(
        color: appSettingsState.theme.backgroundColor,
        child: const LibraryViewContent(),
      ),
    );
  }
}
