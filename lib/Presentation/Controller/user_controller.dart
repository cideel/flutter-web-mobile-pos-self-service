import 'package:get/get.dart';
import 'package:posweb/Model/User.dart';

class UserController extends GetxController {
  var user = Rxn<User>();

  void setUser(User newUser) {
    user.value = newUser;
  }

  User? get getUser => user.value;

  void clearUser() {
    user.value = null;
  }
}
