import 'package:flutter/material.dart';
import '../view_model/library_item_data.dart';

class LibraryItemTile extends StatelessWidget {
  const LibraryItemTile({
    super.key,
    required this.data,
    required this.isPlaying,
    required this.onTap,
    required this.onLikeClicked
  });

  final LibraryItemData data;
  final bool isPlaying;
  final VoidCallback onTap;
  final VoidCallback onLikeClicked;

  String get getLikeText => data.song.likes == 0 ? 'like' : 'likes';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(data.song.title),
          subtitle: Row(
            children: [
              Text(
                "${data.song.duration.inMinutes} mins - ${data.song.likes.toString()} $getLikeText",
              ),
              // SizedBox(width: 20),
              // Text(data.artist.name),
              // SizedBox(width: 20),
              // Text(data.artist.genre),
            ],
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(data.song.imageUrl.toString()),
          ),
          trailing: IconButton(onPressed: onLikeClicked, icon: Icon(Icons.favorite)),
        ),
      ),
    );
  }
}
