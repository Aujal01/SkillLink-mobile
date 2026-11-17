import 'package:flutter/foundation.dart';
import '../models/user_model.dart';
import '../repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this.repository);
  final AuthRepository repository;
  UserModel? user; bool isLoading = false; String? error;
  Future<void> signIn(String name, UserRole role) async { isLoading = true; error = null; notifyListeners(); try { user = await repository.signIn(name, role); } catch (e) { error = e.toString(); } finally { isLoading = false; notifyListeners(); } }
}
