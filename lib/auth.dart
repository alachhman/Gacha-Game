import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

// Removed auth from being private
// Can be streamed to other class by using authSerive.auth

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore db = Firestore.instance;

  Observable<FirebaseUser> user; // firebase user
  Observable<Map<String, dynamic>> profile; // custom user data in Firestore
  PublishSubject loading = PublishSubject();

  // constructor
  AuthService() {
    user = Observable(auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return db
            .collection('users1')
            .document(u.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        return Observable.just({});
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    loading.add(true);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = await auth.signInWithGoogle(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    updateUserData(user);
    print("signed in " + user.displayName);
    loading.add(false);
    return user;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = db.collection('users1').document(user.uid);
    // When a new user is created this will be the information stored on the database
    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'displayName': user.displayName,
      'lastSeen': DateTime.now(),
      'Unit List': []
    }, merge: true);
  }


  void signOut() {
    auth.signOut();
  }
}



// TODO refactor global to InheritedWidget
final AuthService authService = AuthService();
