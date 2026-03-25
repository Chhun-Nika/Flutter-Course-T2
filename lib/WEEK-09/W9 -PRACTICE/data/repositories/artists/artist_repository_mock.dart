import '../../../model/artists/artist.dart';
import 'artist_repository.dart';

class ArtistRepositoryMock implements ArtistRepository {
  final List<Artist> artists = [
    Artist(
      id: '1',
      name: 'Taylor Swift',
      genre: 'Pop',
      imageUrl: Uri.parse('https://example.com/images/taylor_swift.jpg'),
    ),
    Artist(
      id: '2',
      name: 'The Weeknd',
      genre: 'R&B',
      imageUrl: Uri.parse('https://example.com/images/the_weeknd.jpg'),
    ),
    Artist(
      id: '3',
      name: 'Drake',
      genre: 'Hip Hop',
      imageUrl: Uri.parse('https://example.com/images/drake.jpg'),
    ),
  ];
  @override
  Future<List<Artist>> fetchArtists() async {
    return Future.delayed(Duration(seconds: 2), () {
      return artists;
    });
  }
}
