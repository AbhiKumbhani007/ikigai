import 'package:cloud_firestore/cloud_firestore.dart';

class EventServices {
  CollectionReference eventsCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Events");

  Future<void> addEventsToFirebase(eventDetails, date) async {
    eventsCollection.doc(date).set({
      "event_array": FieldValue.arrayUnion([eventDetails])
    }, SetOptions(merge: true));
  }
}
