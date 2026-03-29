
import 'package:activity/WEEK-10/W10-startCode/data/repositories/comments/comments_repository.dart';
import 'package:activity/WEEK-10/W10-startCode/ui/screens/artists/view_model/artist_detail_view_model.dart';
import 'package:activity/WEEK-10/W10-startCode/ui/screens/artists/widgets/artist_detail_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repositories/artist/artist_repository.dart';
import '../../../model/artist/artist.dart';

class ArtistDetailScreen extends StatelessWidget {
  final Artist artist;
  const ArtistDetailScreen({super.key, required this.artist});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArtistDetailViewModel(
        commentsRepository: context.read<CommentsRepository>(),
        artistId: artist.id, artistRepository: context.read<ArtistRepository>()
      ),
      child: ArtistDetailContent(artist: artist,),
    );
  }
}
