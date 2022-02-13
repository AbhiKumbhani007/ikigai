import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  var uid = "".obs;
  @override
  void onInit() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        uid.value = "";
      } else {
        print('User is signed in!');
        uid.value = user.uid;
      }
    });
    super.onInit();
  }
}
