// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_sign_in/google_sign_in.dart';

// // abstract class BaseAuth{
// // Stream<String> get onAuthStateChanged;
// // Future<String> signInWithEmailAndPassword(
// //   String email,String Password,
// // );
// // Future<String> createUserWithEmailAndPassword(
// //   String email,String Password,
// // );
// // Future<String> createUser();
// // Future<void>  signOut();
// // Future<String>signInWithGoogle();
// // }

// // class Auth implements BaseAuth{
// //   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// //   final GoogleSignIn _googleSignIn = GoogleSignIn();
// //   @override
  
// //   Stream<String> get onAuthStateChanged => _firebaseAuth.onAuthStateChanged.map(
// //     (FirebaseUser user) => user.uid,
// //   );

// //   @override
// //   Future<String> createUser() async{
// //     // TODO: implement createUser
// //     return(await _firebaseAuth.currentUser()).uid;  
// //   }

// //   @override
// //   Future<String> createUserWithEmailAndPassword(String email, String Password)async {
// //     // TODO: implement createUserWithEmailAndPassword
// //     return(await _firebaseAuth.createUserWithEmailAndPassword(email: email, password:Password)).uid;
// //   }



// //   @override
// //   Future<String> signInWithEmailAndPassword(String email, String Password)async {
// //     // TODO: implement signInWithEmailAndPassword
// //     return(await _firebaseAuth.signInWithEmailAndPassword(email: email, password:Password)).uid;
// //   }

// //   @override
// //   Future<String> signInWithGoogle() async { 
// //     final GoogleSignInAccount? account = await _googleSignIn.signIn();
// //     final GoogleSignInAuthentication _auth = await account!.authentication;
// //     final AuthCredential credential = GoogleAuthProvider.getCredential(
// //       idToken: _auth.idToken, accessToken: _auth.accessToken,
// //       );
// //       return (await _firebaseAuth.signInWithCredential(credential)).uid;
// //   }

// //   @override
// //   Future<void> signOut() async {
// //     try{
// //        await  FirebaseAuth.instance.signOut();
// //     }catch(e) {
// //       return FirebaseAuth.instance.signOut();
// //     }

// //   }
// // }

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// // abstract class BaseAuth{
// // Stream<String> get onAuthStateChanged;
// // Future<String> signInWithEmailAndPassword(
// //   String email,String Password,
// // );
// // Future<String> createUserWithEmailAndPassword(
// //   String email,String Password,
// // );
// // Future<String> createUser();
// // Future<void>  signOut();
// // Future<String>signInWithGoogle();
// // }


// class Auth  {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


//   Stream<String> get onAuthStateChanged {
//     return _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) => user?.uid);
//   }

//   //user CREATION
//   User _userFromFirebaseUser(FirebaseUser user) {
//     return user != null ? User(uid:user.uid) : null;
//   }

//   Future<String> signIn(String email, String password) async {
//     AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//     FirebaseUser user = result.user;
//     return user.uid;
//   }

//   Future<String> signUp(String email, String password) async {
//     AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email, password: password);
//     FirebaseUser user = result.user;
//     return user.uid;
//   }
//   Stream<User> get user {
//     return _firebaseAuth.onAuthStateChanged
//     //.map((FirebaseUser user)=> userFromFirebaseUser(user));
//     .map(_userFromFirebaseUser);
//   }

//   Future<FirebaseUser> getCurrentUser() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     return user;
//   }

//   Future signOut() async {
//     try{
//        await  _firebaseAuth.signOut();
//       //widget.logoutCallback();
//     }catch(e) {
//       print(e.toString());
//       return _firebaseAuth.signOut();
//     }

//   }

//   Future<void> sendEmailVerification() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     user.sendEmailVerification();
//   }

//   Future<bool> isEmailVerified() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     return user.isEmailVerified;
//   }
// }



import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:foodlocker/Services/user_model.dart';

class AuthService{
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  User? _userFromFirebase(auth.User? user) {
    if (user==null){
      return null;
    }
    return User(user.uid,user.email);
  }
  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
   }
Future<User?> signInWithEmailAndPassword(
  String email,
  String password,
)async{
  // ignore: non_constant_identifier_names
  final Credential= await _firebaseAuth.signInWithEmailAndPassword(
    email: email, password: password
    );
    return _userFromFirebase(Credential.user);
}
   Future<User?>createUserWithEmailAndPassword(
     String email, String password)
     async {}
     Future<void>signOut()async{
       return await _firebaseAuth.signOut();
     }
}