import 'dart:convert';

import 'package:activity/WEEK-10/W10-startCode/data/config/firebase_config.dart';
import 'package:http/http.dart' as http;

import '../../../model/songs/song.dart';
import '../../dtos/song_dto.dart';
import 'song_repository.dart';

class SongRepositoryFirebase extends SongRepository {
  final Uri songsUri = FirebaseConfig.baseUri.replace(path: '/songs.json');
  List<Song>? _cachedSongs;

  @override
  Future<List<Song>> fetchSongs({bool forceRefresh = false}) async {
    if (!forceRefresh && _cachedSongs != null) {
      return _cachedSongs!;
    }
    final http.Response response = await http.get(songsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      List<Song> result = [];
      for (final entry in songJson.entries) {
        result.add(SongDto.fromJson(entry.key, entry.value));
      }
      _cachedSongs = result;
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Song?> fetchSongById(String id) async {}

  @override
  Future<void> likeSong(String id) async {
    // url to get a specific likes from song id
    // 1 - using patch
    // final url = FirebaseConfig.baseUri.replace(path: '/songs/$id.json');
    // final http.Response response = await http.get(url);
    // final Map<String, dynamic> likeJson = json.decode(response.body);
    // final newLikes = likeJson["likes"] + 1;
    // await http.patch(url, body: json.encode({"likes" : newLikes}));

    // 2 - using put
    // the url is return the value of likes for a specific song id; response would be an int
    final url = FirebaseConfig.baseUri.replace(path: '/songs/$id/likes.json');
    final http.Response response = await http.get(url);
    final int likeJson = json.decode(response.body);
    final newLikes = likeJson + 1;
    // url access to the value of a specific attribute so use put instead(response gives back 1 value only)
    await http.put(url, body: json.encode(newLikes));
  }
}
