import '../../../model/artists/artist.dart';
import 'artist_repository.dart';

class ArtistRepositoryMock implements ArtistRepository {
  final List<Artist> artists = [
    Artist(
      name: 'Taylor Swift',
      genre: 'Pop',
      imageUrl: Uri.parse('https://example.com/images/taylor_swift.jpg'),
    ),
    Artist(
      name: 'The Weeknd',
      genre: 'R&B',
      imageUrl: Uri.parse('https://example.com/images/the_weeknd.jpg'),
    ),
    Artist(
      name: 'Drake',
      genre: 'Hip Hop',
      imageUrl: Uri.parse('https://example.com/images/drake.jpg'),
    ),
    Artist(
      name: 'Billie Eilish',
      genre: 'Alternative Pop',
      imageUrl: Uri.parse('https://example.com/images/billie_eilish.jpg'),
    ),
    Artist(
      name: 'Bruno Mars',
      genre: 'Funk Pop',
      imageUrl: Uri.parse('https://example.com/images/bruno_mars.jpg'),
    ),
  ];
  @override
  Future<List<Artist>> fetchArtists() async {
    return Future.delayed(Duration(seconds: 2), () {
      return artists;
    });
  }
}
