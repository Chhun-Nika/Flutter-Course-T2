import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../model/songs/song.dart';
import 'song_repository.dart';

class SongRepositoryHttp extends SongRepository {
  Uri songsUri = Uri.https('fooapi.com', '/api/songs');

  @override
  Future<Song?> fetchSongById(String id) {
    // TODO: implement fetchSongById
    throw UnimplementedError();
  }

  @override
  Future<List<Song>> fetchSongs() async {
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonBody = json.decode(response.body);
      List<dynamic> jsonData = jsonBody["data"];
      print(jsonData);
    }

    // TODO: implement fetchSongs
    throw UnimplementedError();
  }
}

void main() async {
  SongRepositoryHttp songRepositoryHttp = SongRepositoryHttp();
  songRepositoryHttp.fetchSongs();
}
