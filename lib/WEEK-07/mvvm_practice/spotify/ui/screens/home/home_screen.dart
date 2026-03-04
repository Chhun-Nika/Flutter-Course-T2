import 'package:activity/WEEK-07/mvvm_practice/spotify/ui/screens/home/view_model/home_view_model.dart';
import 'package:activity/WEEK-07/mvvm_practice/spotify/ui/screens/home/widgets/home_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/history/user_history_repository.dart';
import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';
import '../../states/settings_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettingsState appSettingsState = context.read<AppSettingsState>();
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
        userHistoryRepository: context.read<UserHistoryRepository>(),
        songRepository: context.read<SongRepository>(),
        playerState: context.read<PlayerState>()
      ),
      child: Container(
        color: appSettingsState.theme.backgroundColor,
        child: HomeContent(),
      ),
    );
  }
}
