import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../model/songs/song.dart';
import '../../../states/settings_state.dart';
import '../../../utils/duration_formatter.dart';

class ArtistSongTile extends StatelessWidget {
  final Song song;
  const ArtistSongTile({super.key, required this.song});
  @override
  Widget build(BuildContext context) {
    AppSettingsState settingsState = context.watch<AppSettingsState>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: settingsState.theme.backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.music_note),
            ),
            title: Text(song.title),
            subtitle: Text(
              DurationFormatter.toMinutes(song.duration),
            ),
          ),
          Divider(color: const Color.fromARGB(255, 237, 237, 237)),
        ],
      ),
    );
  }
}
