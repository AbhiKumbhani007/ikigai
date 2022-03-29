import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ikigai/services/user_services.dart';

class UserController extends GetxController {
  UserServices userServices = UserServices();
  var uid = "".obs;
  var name = "".obs;
  var email = "".obs;
  var number = "".obs;
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
    
    // updateUserDetails();
    super.onInit();
  }

  void updateUserId() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        uid.value = "";
      } else {
        print('User is signed in!');
        uid.value = user.uid;
      }
    });
    updateUserDetails();
  }

  void updateUserDetails() {
    userServices.fetchUserDetails(uid.value);
  }
}
