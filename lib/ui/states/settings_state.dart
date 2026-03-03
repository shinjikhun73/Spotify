import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/data/repositories/app_setting_repo.dart';

import '../../model/settings/app_settings.dart';

class AppSettingsState extends ChangeNotifier {
  AppSettings? _appSettings;
  final AppSettingsRepo repository;

  AppSettingsState(this.repository) {
    init();
  }

  Future<void> init() async {
    // Might be used to load data from repository
    _appSettings = await repository.load();
    notifyListeners();
  }

  ThemeColor get theme => _appSettings?.themeColor ?? ThemeColor.blue;

  Future<void> changeTheme(ThemeColor themeColor) async {
    if (_appSettings == null) return;
    _appSettings = _appSettings!.copyWith(themeColor: themeColor);

    notifyListeners();
  }
}
