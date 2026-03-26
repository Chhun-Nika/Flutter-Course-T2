import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../model/artists/artist.dart';
import '../../config/firebase_config.dart';
import '../../dtos/artist_dto.dart';
import 'artist_repository.dart';

class ArtistRepositoryFirebase implements ArtistRepository {
  final Uri artistsUri = FirebaseConfig.baseUri.replace(path: '/artists.json');

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistsUri);

    if (response.statusCode == 200) {
      Map<String, dynamic> artistsJson = json.decode(response.body);
      List<Artist> result = [];

      for (var a in artistsJson.entries) {
        final String id = a.key;
        final Map<String, dynamic> value = a.value;
        result.add(ArtistDto.fromJson(id, value));
      }

      return result;
    } else {
      throw Exception('Fail to load artist');
    }
  }
}
