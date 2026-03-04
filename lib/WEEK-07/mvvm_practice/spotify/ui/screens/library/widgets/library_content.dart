import 'package:activity/WEEK-07/mvvm_practice/spotify/model/songs/song.dart';
import 'package:activity/WEEK-07/mvvm_practice/spotify/ui/screens/library/view_model/library_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme.dart';

class LibraryViewContent extends StatelessWidget {
  const LibraryViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final libraryViewModel = context.watch<LibraryViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16),
        Text("Library", style: AppTextStyles.heading),
    
        SizedBox(height: 50),
    
        Expanded(
          child: libraryViewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: libraryViewModel.songs.length,
                  itemBuilder: (context, index) => SongTile(
                    song: libraryViewModel.songs[index],
                    isPlaying: libraryViewModel.isPlaying(
                      libraryViewModel.songs[index],
                    ),
                    onTap: () {
                      libraryViewModel.ontapSong(
                        libraryViewModel.songs[index],
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
