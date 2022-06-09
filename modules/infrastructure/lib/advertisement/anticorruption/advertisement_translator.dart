import 'package:domain/advertisement/entities/advertisement.dart'
    as advertisement_domain;
import 'package:infrastructure/advertisement/dto/advertisements.dart'
    as advertisement_firebase;

class AdvertisementTranslator {
  static advertisement_domain.Advertisements firebaseToDomain(
      advertisement_firebase.Advertisements advertisement) {
    return advertisement_domain.Advertisements(
        uid: advertisement.uid,
        content: advertisement.content,
        title: advertisement.title);
  }
}
