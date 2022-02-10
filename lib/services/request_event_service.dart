import 'package:cloud_firestore/cloud_firestore.dart';

class RequestEvent {
  CollectionReference eventsCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("");

  Future<void> addRequestToFirebase() async {}
}
