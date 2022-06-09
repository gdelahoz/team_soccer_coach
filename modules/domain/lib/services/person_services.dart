import 'package:domain/domain.dart';

class PersonServices<T extends Person> {
  PersonServices({required PersonRemoteRepository remoteRepo})
      : _remoteRepo = remoteRepo,
        super();

  final PersonRemoteRepository _remoteRepo;

  Future<void> registerPlayer(Player player) async {
    try {
      await _remoteRepo.registerUser(player);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
