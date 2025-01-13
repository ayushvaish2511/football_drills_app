import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Map<String, dynamic>>> fetchDrills() async {
    final snapshot = await _firestore.collection('drills').get();
    return snapshot.docs.map((doc) => {
          'id': doc.id,
          ...doc.data(),
        }).toList();
  }

  Future<void> recordDrill({
    required String drillId,
    required String drillName,
    required int count,
  }) async {
    final userId = _auth.currentUser!.uid;
    final userRef = _firestore.collection('users').doc(userId);
    await userRef.collection('participation').doc(drillId).set({
      'drill_name': drillName,
      'count': count,
    });
    await userRef.update({
      'totalCount': FieldValue.increment(count),
    });
  }

  Future<List<Map<String, dynamic>>> fetchUserDrills() async {
    final userId = _auth.currentUser!.uid;
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('participation')
        .get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<List<Map<String, dynamic>>> fetchLeaderboard() async {
    final snapshot = await _firestore
        .collection('users')
        .orderBy('totalCount', descending: true)
        .limit(10)
        .get();
    return snapshot.docs.map((doc) => {
          'username': doc.data()['email'],
          'totalCount': doc.data()['totalCount'],
        }).toList();
  }
}
