import 'package:activity/WEEK-09/W9%20-PRACTICE/model/artists/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtists();
}
