import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  String? _role;

  User? u;

  User? get user => u;

  String? get role => _role;

  void setUser() {
    this.u = auth.currentUser;
    notifyListeners();
  }

  void setRole(String? r) {
    this._role = r;
    notifyListeners();
  }

  Future<void> SignOut() async {
    await auth.signOut();
    notifyListeners();
  }
}
