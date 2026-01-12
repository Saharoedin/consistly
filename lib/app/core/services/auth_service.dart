import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<User> ensureAnonymousAuth() async {
    if (_auth.currentUser != null) {
      return _auth.currentUser!;
    }

    final credential = await _auth.signInAnonymously();
    return credential.user!;
  }

  Future<void> saveOnboardingData({
    required String energyLevel,
    required String improvements,
    required String goals,
  }) async {
    final uid = _auth.currentUser!.uid;

    await _firestore.collection('users').doc(uid).set({
      'onboardingCompleted': true,
      'energyLevel': energyLevel,
      'improvements': improvements,
      'goals': goals,
      'createdAt': FieldValue.serverTimestamp(),
      'lastActiveAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }
}
