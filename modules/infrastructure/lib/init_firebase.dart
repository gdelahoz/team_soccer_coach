import 'package:firebase_core/firebase_core.dart';

Future<void> initFirebase() async {
  final result = await Firebase.initializeApp();
  print(result);
}
