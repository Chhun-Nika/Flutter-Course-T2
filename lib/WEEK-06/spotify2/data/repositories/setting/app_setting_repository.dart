import 'package:activity/WEEK-06/spotify2/model/settings/app_settings.dart';

abstract class AppSettingRepository {
  Future<AppSettings> load();
  Future<void> save(AppSettings settings);
}
