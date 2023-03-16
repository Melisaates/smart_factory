import 'package:cloud_firestore/cloud_firestore.dart';

mixin FirebaseMixin {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic> machineProperties(
          {required String name,
          required String image,
          required String state,
          required String failure_type,
          required String failure_statement}) =>
      {
        'name': name,
        'image':
            'https://www.haliyikamamakinalari.com/image/hali-yikama-makinasi-2700.png',
        'state': state,
        'failure_type': 'var',
        'failure_statement':'' 
      };
  Map<String, dynamic> workerProperties(
          {required String name,
          required String department,
          required String state,
          required int wage}) =>
      {
        'name': name,
        'image':
            'https://w7.pngwing.com/pngs/841/627/png-transparent-computer-icons-consultant-businessperson-sales-sports-personal-company-service-people.png',
        'state': state,
        'department': department,
        'wage': wage
      };
  Map<String, dynamic> doorProperties({
    required String name,
    required String image,
    required String state,
  }) =>
      {
        'name': name,
        'image':
            'https://www.haliyikamamakinalari.com/image/hali-yikama-makinasi-2700.png',
        'state': state,
      };

  //Data eklemek için kullandığımız func.

  void addData(String collectionName, Map<String, dynamic> body) async {
    try {
      await firestore.collection(collectionName).add(body);
    } catch (e) {
      print(e.toString());
    }
  }

  void updateData(
      String collectionName, String docId, Map<String, dynamic> body) async {
    try {
      await firestore.collection(collectionName).doc(docId).update(body);
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData(String collectionName, String docId) async {
    try {
      await firestore.collection(collectionName).doc(docId).delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
