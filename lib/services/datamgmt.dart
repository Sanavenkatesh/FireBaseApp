import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DataManagement {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var db = Firestore.instance.collection("designs");
  getMahesh() async {
    return await db.where("type", isEqualTo: "mahesh").getDocuments();
  }
  getAllu() async{
    return await db.where("type", isEqualTo: "Allu").getDocuments();
  }
  getPrabhas() async{
    return await db.where("type", isEqualTo: "Prabhas").getDocuments();
  }

  getCurretntUser() async{
    FirebaseUser currentUser;
    currentUser = await _auth.currentUser();
    return currentUser;
  }
}