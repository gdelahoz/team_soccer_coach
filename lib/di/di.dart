import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:infrastructure/person/repository/coach_remote_repository.dart';

void diInitializer() {
  if (!GetIt.I.isRegistered<EventRemoteRepository>()) {
    GetIt.I.registerSingleton<EventRemoteRepository>(EventRemoteRepository());
  }

  if (!GetIt.I.isRegistered<EventServices>()) {
    GetIt.I.registerSingleton<EventServices>(
        EventServices(remoteRepo: GetIt.I.get<EventRemoteRepository>()));
  }

  if (!GetIt.I.isRegistered<TeamFirebaseRepositoryImpl>()) {
    GetIt.I.registerSingleton<TeamFirebaseRepositoryImpl>(
        TeamFirebaseRepositoryImpl());
  }

  if (!GetIt.I.isRegistered<TeamServices>()) {
    GetIt.I.registerSingleton<TeamServices>(
        TeamServices(remoteRepo: GetIt.I.get<TeamFirebaseRepositoryImpl>()));
  }

  if (!GetIt.I.isRegistered<AdvertisementFirebaseRepositoryImpl>()) {
    GetIt.I.registerSingleton<AdvertisementFirebaseRepositoryImpl>(
        AdvertisementFirebaseRepositoryImpl());
  }
  if (!GetIt.I.isRegistered<AdvertisementServices>()) {
    GetIt.I.registerSingleton<AdvertisementServices>(AdvertisementServices(
        remoteRepo: GetIt.I.get<AdvertisementFirebaseRepositoryImpl>()));
  }

  if (!GetIt.I.isRegistered<CoachRemoteRepository>()) {
    GetIt.I.registerSingleton<CoachRemoteRepository>(CoachRemoteRepository());
  }

  if (!GetIt.I.isRegistered<PersonServices>()) {
    GetIt.I.registerSingleton<PersonServices>(
        PersonServices(remoteRepo: GetIt.I.get<CoachRemoteRepository>()));
  }
}
