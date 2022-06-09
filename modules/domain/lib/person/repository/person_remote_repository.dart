import 'package:domain/domain.dart';

abstract class PersonRemoteRepository {
  Future<Person> loginFirebase(String email, String password);
  Future<void> registerUser(Player player);
  void logoutFirebase();
}
