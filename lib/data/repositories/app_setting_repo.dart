import '../../model/settings/app_settings.dart';

abstract class AppSettingsRepo {
  Future<AppSettings> load();
  Future<void> save(AppSettings settings);
}

class MockAppSettingsRepository implements AppSettingsRepo {
  AppSettings? _cache;

  @override
  Future<AppSettings> load() async {
    return _cache ?? AppSettings(themeColor: ThemeColor.blue);
  }

  @override
  Future<void> save(AppSettings settings) async {
    _cache = settings;
  }
}
