import '../../model/artists/artist.dart';

class ArtistDto {
  static const String nameKey = 'name';
  static const String imageUrlKey = 'imageUrl';
  static const String genreKey = 'genre';

  static Artist fromJson(String id,Map<String, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[imageUrlKey] is String);
    assert(json[genreKey] is String);

    return Artist(
      id: id,
      name: json[nameKey],
      genre: json[genreKey],
      imageUrl: Uri.parse(json[imageUrlKey]),
    );
  }

  Map<String, dynamic> toJson(Artist artist) {
    return {
      nameKey: artist.name,
      imageUrlKey: artist.imageUrl.toString(),
      genreKey: artist.genre,
    };
  }
}
