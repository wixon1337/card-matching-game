import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences instance;

  static Future<SharedPreferences> init() async =>
      instance = await SharedPreferences.getInstance();

  static void saveBestScore(int bestScore) {
    SharedPrefs.instance.setInt('best_score', bestScore);
  }

  static int getBestScore() => SharedPrefs.instance.getInt('best_score') ?? 0;
}