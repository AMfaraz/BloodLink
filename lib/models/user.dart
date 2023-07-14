import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String username;
  final String uid;
  final String bio;
  final String email;
  final List<dynamic> followers;
  final List<dynamic> following;

  User(
      {required this.bio,
      required this.email,
      required this.followers,
      required this.following,
      required this.uid,
      required this.username});

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "uid": uid,
      "bio": bio,
      "followers": followers,
      "email": email,
      "following": following
    };
  }

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
        bio: snapshot["bio"],
        email: snapshot["email"],
        followers: snapshot["followers"],
        following: snapshot["following"],
        uid: snapshot["uid"],
        username: snapshot["username"]);
  }
}
