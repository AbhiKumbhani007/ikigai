import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EventServices {
  CollectionReference eventsCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Events");

  Future<void> addEventsToFirebase(eventDetails) async {
    eventsCollection.add({
      "title" : eventDetails["title"],
      "user_registered" : eventDetails["user_registered"]
    }); 
  }
}
