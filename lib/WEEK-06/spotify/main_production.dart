import 'package:activity/WEEK-06/spotify/data/repositories/songs/song_repository.dart';
import 'package:activity/WEEK-06/spotify/data/repositories/songs/song_repository_remote.dart';
import 'package:activity/WEEK-06/spotify/main_common.dart';
import 'package:provider/provider.dart';

List<Provider> get providersLocal {
  return [Provider<SongRepository>(create: (context) => SongRepositoryRemote())];
}

void main() {
  mainCommon(providersLocal);
}
