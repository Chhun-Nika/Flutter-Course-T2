import 'package:activity/WEEK-06/spotify2/data/repositories/setting/app_setting_repository.dart';
import 'package:flutter/widgets.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  final AppSettingRepository _appSettingRepository;
  AppSettings? _appSettings;

  AppSettingsState(this._appSettingRepository);

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await _appSettingRepository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);
    notifyListeners();
  }
}
