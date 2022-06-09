import 'package:domain/advertisement/entities/advertisement.dart';

abstract class AdvertisementsFirebaseRepository<T extends Advertisements> {
  Future<void> saveAdvertisements(T advertsiment);
  Future<T?> getAdvertisement();
  Future<void> updateAdvertisement(T advertisement);
}
