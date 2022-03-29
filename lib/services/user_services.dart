import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ikigai/controllers/user_controller.dart';

UserController userController = Get.find();

class UserServices {
  CollectionReference usersCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Users");
  void addNewUserToFirebase(
      String uuid, String name, String email, String number) {
    usersCollection.doc(uuid).set({
      "name": name,
      "email": email,
      "number": number,
    });
  }

  Future<void> fetchUserDetails(String uuid) async {
    var userData = await usersCollection.doc(uuid).get();
    userController.name.value = userData["name"];
    userController.email.value = userData["email"];
    userController.number.value = userData["number"];
  }
}
