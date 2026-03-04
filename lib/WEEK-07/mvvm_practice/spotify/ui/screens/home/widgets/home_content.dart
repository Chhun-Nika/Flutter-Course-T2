import 'package:activity/WEEK-07/mvvm_practice/spotify/ui/screens/home/view_model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/songs/song.dart';
import '../../../theme/theme.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 16),
        Text("Home", style: AppTextStyles.heading),

        SizedBox(height: 50),

        Expanded(
          child: homeViewModel.isEmpty
              ? const Center(child: Text("No recent songs"),)
              : ListView.builder(
                  itemCount: homeViewModel.history.length,
                  itemBuilder: (context, index) => SongTile(
                    song: homeViewModel.history[index],
                    isPlaying: homeViewModel.getPlayerState(
                      homeViewModel.history[index],
                    ),
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
  });

  final Song song;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
