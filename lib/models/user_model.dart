enum UserRole { client, provider }

class UserModel {
  const UserModel({required this.id, required this.name, required this.role, this.location = 'Kathmandu'});
  final String id, name, location;
  final UserRole role;
}
