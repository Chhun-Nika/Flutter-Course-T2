import 'package:activity/WEEK-06/spotify2/data/repositories/setting/app_setting_repository.dart';
import 'package:activity/WEEK-06/spotify2/model/settings/app_settings.dart';

class AppSettingRepositoryMock extends AppSettingRepository {
  @override
  Future<AppSettings> load() async {
    return AppSettings(themeColor: ThemeColor.pink);
  }

  @override
  Future<void> save(AppSettings settings) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
