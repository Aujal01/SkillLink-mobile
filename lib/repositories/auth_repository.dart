import '../core/network/api_client.dart';
import '../models/user_model.dart';

class AuthRepository {
  AuthRepository(this.client);
  final ApiClient client;
  Future<UserModel> signIn(String name, UserRole role) async => UserModel(id: 'demo-user', name: name.isEmpty ? 'Guest' : name, role: role);
}
