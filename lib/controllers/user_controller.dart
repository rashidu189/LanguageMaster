import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/user_service.dart';

class UserController extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> fetchUser(int userId) async {
    _user = await UserService.fetchUser(userId);
    notifyListeners();
  }

  Future<void> updateUser(UserModel updatedUser) async {
    await UserService.updateUser(updatedUser);
    _user = updatedUser;
    notifyListeners();
  }

  Future<void> logout() async {
    await UserService.logout();
    _user = null;
    notifyListeners();
  }
}
