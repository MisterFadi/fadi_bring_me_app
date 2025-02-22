import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<void> saveUsername(String userId, String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username_$userId', username);
  }

  Future<String?> loadUsername(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username_$userId');
  }
}
