import '../data/repositories/songs/song_repository_mock.dart';
import '../model/songs/song.dart';

void main() async {
  //   Instantiate the  song_repository_mock
  SongRepositoryMock songRepositoryMock = SongRepositoryMock();

  // Test both the success and the failure of the post request

  // Handle the Future using 2 ways  (2 tests)
  // - Using then() with .catchError().
  // songRepositoryMock
  //     .fetchSongById("s8")
  //     .then((value) {
  //       print("fetched song: ${value?.title}");
  //     })
  //     .catchError((error) {
  //       print("Error: $error");
  //     });
  // - Using async/await with try/catch.

  try {
    Song? fetchedSong = await songRepositoryMock.fetchSongById("s1");
    print("fetched song: ${fetchedSong?.title}");
  } catch (e) {
    print("Error: $e");
  }
}
