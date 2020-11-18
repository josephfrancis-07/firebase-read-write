import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/models/intern_model.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;
}




class DetailsRepository extends BaseRepository {
  DetailsRepository();


    List<Internship> getItems() {
    dynamic itemsQuerySnapshot = db
        .collection('interns')
        .snapshots();
    return itemsQuerySnapshot.id.map((doc) {
      return Internship.fromJson(doc.data());
    }).toList();
  }
  addItem(Internship internship) {
    DocumentReference ref = db.collection('interns').doc();
    internship.id = ref.id;
    ref.set(internship.toJson(), SetOptions(merge: true));
  }

  getItemsStream({Internship internship}) {
    AsyncSnapshot.waiting();
    return db.collection('interns').snapshots();
    
  }
}
