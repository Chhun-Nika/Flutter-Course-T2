import 'dart:convert';

import 'package:activity/WEEK-10/W10-startCode/data/config/firebase_config.dart';
import 'package:activity/WEEK-10/W10-startCode/data/dtos/song_dto.dart';
import 'package:activity/WEEK-10/W10-startCode/model/songs/song.dart';
import 'package:http/http.dart' as http;

import '../../../model/artist/artist.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase implements ArtistRepository {
  final Uri artistsUri = FirebaseConfig.baseUri.replace(path: '/artists.json');
  List<Artist>? _cachedArtists;

  @override
  Future<List<Artist>> fetchArtists({bool forceRefresh = false}) async {
    // checking cache first 
    if (!forceRefresh && _cachedArtists != null) {
      return _cachedArtists!;
    }

    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songJson = json.decode(response.body);

      List<Artist> result = [];
      for (final entry in songJson.entries) {
        result.add(ArtistDto.fromJson(entry.key, entry.value));
      }
      _cachedArtists = result;
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load posts');
    }
  }

  @override
  Future<Artist?> fetchArtistById(String id) async {}

  @override
  Future<List<Song>> fetchSongsByArtists(String artistId) async {
    final uri = FirebaseConfig.baseUri.replace(
    path: '/songs.json',
    queryParameters: {
      'orderBy': '"artistId"',
      'equalTo': '"$artistId"',
    },
  );
  final http.Response response = await http.get(uri);
  if (response.statusCode == 200) {
      // 1 - Send the retrieved list of songs
      Map<String, dynamic> songsArtistJson = json.decode(response.body);

      List<Song> result = [];
      for (final entry in songsArtistJson.entries) {
        result.add(SongDto.fromJson(entry.key, entry.value));
      }
      return result;
    } else {
      // 2- Throw expcetion if any issue
      throw Exception('Failed to load songs');
    }
  }
}
