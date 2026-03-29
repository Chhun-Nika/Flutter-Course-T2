import '../../../model/artist/artist.dart';
import '../../../model/songs/song.dart';

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtists({bool forceRefresh = false});

  Future<Artist?> fetchArtistById(String id);

  Future<List<Song>> fetchSongsByArtists(String artistId);
}
