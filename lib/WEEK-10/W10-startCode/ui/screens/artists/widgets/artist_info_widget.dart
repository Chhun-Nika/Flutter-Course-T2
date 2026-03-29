import 'package:activity/WEEK-06/spotify2/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import '../../../../model/artist/artist.dart';

class ArtistInfoWidget extends StatelessWidget {
  final Artist artist;
  const ArtistInfoWidget({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              artist.imageUrl.toString(),
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(artist.name, style: AppTextStyles.label),
              Text(artist.genre),
            ],
          ),
        ],
      ),
    );
  }
}
