import 'package:cloud_firestore/cloud_firestore.dart';

class MatrixServices {
  CollectionReference matrixCollection = FirebaseFirestore.instance
      .collection("Location")
      .doc("Nalagandla")
      .collection("Matrix");
  Future<void> getSeatStats(String seatNumber, String date) async {
    CollectionReference dateCollection =
        matrixCollection.doc(seatNumber).collection(date);
    final snapShots = await dateCollection.get();
    if (snapShots.docs.length > 0) {
      // fetch the data and list the available slots
      

    } else {
      // implement whole collection
      for (int i = 1; i <= 24; i++) {
        dateCollection.doc("${i}").set({'is_booked': false});
      }
    }
  }
}
