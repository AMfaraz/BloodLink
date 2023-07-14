import "package:firebase_auth/firebase_auth.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user.dart' as modelUser;

//for adding authenticating methods
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<modelUser.User> getUserDetail() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot userSnap =
        await _firestore.collection("users").doc(currentUser.uid).get();

    return modelUser.User.fromSnap(userSnap);
  }

  Future<String> signUp(
      {required String email,
      required String password,
      required String username}) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty && username.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //adding to firestore

        modelUser.User user = modelUser.User(
            bio: "Enter your bio",
            email: email,
            followers: [],
            following: [],
            uid: cred.user!.uid,
            username: username);

        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toJson());

        res = "succes";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        res = "Invalid email";
      } else if (e.code == "weak-password") {
        res = "Weak password please enter a strong password";
      }
    } on Exception catch (e) {
      // TODO
      res = e.toString();
    }

    return res;
  }

  Future<String> login(
      {required String email, required String password}) async {
    String res = "Some error occured";

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        UserCredential cred = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        res = "succes";
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        res = "Invalid email";
      } else if (e.code == "weak-password") {
        res = "Weak password please enter a strong password";
      }
    } on Exception catch (e) {
      // TODO
      res = e.toString();
    }

    return res;
  }
}
