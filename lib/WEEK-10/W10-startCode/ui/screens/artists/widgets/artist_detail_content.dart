import 'package:activity/WEEK-09/W9%20-PRACTICE/ui/theme/theme.dart';
import 'package:activity/WEEK-10/W10-startCode/model/artist/artist.dart';
import 'package:activity/WEEK-10/W10-startCode/model/comments/comment.dart';
import 'package:activity/WEEK-10/W10-startCode/ui/screens/artists/view_model/artist_detail_view_model.dart';
import 'package:activity/WEEK-10/W10-startCode/ui/screens/artists/widgets/artist_info_widget.dart';
import 'package:activity/WEEK-10/W10-startCode/ui/screens/artists/widgets/artist_song_tile.dart';
import 'package:activity/WEEK-10/W10-startCode/ui/screens/artists/widgets/comment_tile.dart';
import 'package:activity/WEEK-10/W10-startCode/ui/utils/async_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../model/songs/song.dart';
import '../../../states/settings_state.dart';
import 'comment_form.dart';

class ArtistDetailContent extends StatelessWidget {
  final Artist artist;

  const ArtistDetailContent({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    ArtistDetailViewModel vm = context.watch<ArtistDetailViewModel>();
    AsyncValue<List<Comment>> asyncCommentValue = vm.commentsValue;
    AsyncValue<List<Song>> asyncSongValue = vm.songsValue;

    Widget songsContent;

    switch (asyncSongValue.state) {
      case AsyncValueState.loading:
        songsContent = Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        songsContent = Center(
          child: Text(
            'error = ${asyncSongValue.error!}',
            style: TextStyle(color: Colors.red),
          ),
        );
        break;
      case AsyncValueState.success:
        List<Song> songs = asyncSongValue.data!;
        songsContent = Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: songs.length,
            itemBuilder: (context, index) => ArtistSongTile(song: songs[index]),
          ),
        );
    }

    Widget commentContent;
    switch (asyncCommentValue.state) {
      case AsyncValueState.loading:
        commentContent = const Center(child: CircularProgressIndicator());
        break;
      case AsyncValueState.error:
        commentContent = Center(
          child: Text(
            'error = ${asyncCommentValue.error!}',
            style: const TextStyle(color: Colors.red),
          ),
        );
        break;
      case AsyncValueState.success:
        List<Comment> comments = asyncCommentValue.data!;
        commentContent = comments.isEmpty
            ? const Text('No comments yet')
            : ListView.separated(
                shrinkWrap: true,
                itemCount: comments.length,
                itemBuilder: (context, index) =>
                    CommentTile(comment: comments[index], index: index + 1),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
              );
        break;
    }

    AppSettingsState settingsState = context.watch<AppSettingsState>();
    return Scaffold(
      backgroundColor: settingsState.theme.backgroundColor,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Artist Details"),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20, bottom: 100, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ArtistInfoWidget(artist: artist),
            const SizedBox(height: 20),
            Text("Songs", style: AppTextStyles.label),
            const SizedBox(height: 10),
            songsContent,
            const SizedBox(height: 20),
            Text("Comments", style: AppTextStyles.label),
            commentContent,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return CommentForm(
                onSubmit: (value) {
                  vm.addComment(
                    Comment(
                      artistId: artist.id,
                      comment: value,
                      createdAt: DateTime.now(),
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text("Add Comment"),
      ),
    );
    ;
  }
}
