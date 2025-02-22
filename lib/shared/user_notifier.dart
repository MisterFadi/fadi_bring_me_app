import 'package:fadi_bring_me_app/shared/user_repository.dart';
import 'package:flutter/material.dart';

class UserNotifier extends ChangeNotifier {
  final UserRepository _userRepository;
  String? _username;

  UserNotifier(this._userRepository, String userId) {
    loadUsername(userId);
  }

  String? get username => _username;

  Future<void> loadUsername(String userId) async {
    _username = await _userRepository.loadUsername(userId);
    notifyListeners();
  }

  Future<void> saveUsername(String userId, String newUsername) async {
    await _userRepository.saveUsername(userId, newUsername);
    _username = newUsername;
    notifyListeners();
  }
}
