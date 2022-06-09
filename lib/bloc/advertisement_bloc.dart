import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class AdvertisementBLoC extends ChangeNotifier {
  AdvertisementBLoC({required AdvertisementServices advertisementServices})
      : _advertisementServices = advertisementServices,
        super();

  final AdvertisementServices _advertisementServices;
  Advertisements? adv = Advertisements(title: "", content: "", uid: "");

  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();

  Future<Advertisements?> getAdvertisement() async {
    try {
      adv = await _advertisementServices.getAdversiment();
      updateTextcontroller();
      notifyListeners();
    } catch (e) {
      notifyListeners();
      print(e);
    }
    return null;
  }

  void updateDateAndFetchDatah(Advertisements advertisements) async {
    try {
      return await _advertisementServices.updateAdversiment(advertisements);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> updateAdvertisements() async {
    try {
      await _advertisementServices.updateAdversiment(
          Advertisements(title: title.text, content: content.text, uid: ''));
      return true;
    } catch (e) {
      return false;
    }
  }

  void updateTextcontroller() {
    title.text = adv!.getTitle();
    content.text = adv!.getContent();
    notifyListeners();
  }
}
