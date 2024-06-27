import 'package:apps/models/pendaftar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final COLLECTION_REF = 'pendaftar';
  final firestore = FirebaseFirestore.instance;
  late final CollectionReference userRef;
  FirestoreService(){
    userRef = firestore.collection(COLLECTION_REF);
  }
  void tambah(pendaftar pendaftar){
    DocumentReference documentReference= userRef.doc(pendaftar.nama);
    documentReference.set(pendaftar);
  }
}
