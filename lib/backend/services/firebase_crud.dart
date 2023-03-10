import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drug_store/backend/response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _collection = _firestore.collection("Drugs");

class FirebaseCrud {}
