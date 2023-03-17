import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drug_store/backend/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection("Drugs");

class FirebaseCrud {
  // Method to add drug in the db
  static Future<Response> addDrug({
    required String name,
    required String description,
    required String price,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "drug_name": name,
      "description": description,
      "price": price,
    };

    var result = await documentReferencer.set(data).whenComplete(() {
      response.code = 200;
      response.message = "Successfully added to the db";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //Read Drug records
  static Stream<QuerySnapshot> getDrugRecord() {
    CollectionReference notesItemCollection = _collection;
    return notesItemCollection.snapshots();
  }

  //Update drugs record method
  static Future<Response> updateDrug({
    required String name,
    required String description,
    required String price,
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _collection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "drug_name": name,
      "description": description,
      "price": price,
    };

    await documentReferencer.update(data).whenComplete(() {
      response.code = 200;
      response.message = "Record updated successfully in the db";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }

  //* Delete Drug record
  static Future<Response> deleteDrug({
    required String docId,
  }) async {
    Response response = Response();
    DocumentReference documentReferencer = _collection.doc(docId);

    await documentReferencer.delete().whenComplete(() {
      response.code = 200;
      response.message = "Deleted successfully";
    }).catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }
}
