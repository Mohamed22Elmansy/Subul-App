import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  static Future<void> cacheThemeIndex(int themeindex) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt("THEME_INDEX", themeindex);
  }

  static Future<int> getCacheThemeIndex() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cacheThemeIndex = sharedPreferences.getInt("THEME_INDEX");
    if (cacheThemeIndex != null) {
      return cacheThemeIndex;
    } else {
      return 1;
    }
  }
}
