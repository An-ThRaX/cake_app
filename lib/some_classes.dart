import 'package:flutter/foundation.dart';

void main() {
  User userOne = User('luigi', 25);
  if (kDebugMode) {
    print('User one name: ${userOne.username}');
  }

  User userTwo = User('mario', 30);
  if (kDebugMode) {
    print('User two name: ${userTwo.username}');
    print(userTwo.login());
  }

  SuperUser userThree = SuperUser('Yoshi', 20);
  if (kDebugMode) {
    print('User three name: ${userThree.username}');
    print(userThree.publish());
    print(userThree.login());
  }
}

class User {
  String? username;
  int? age;

  User(this.username, this.age);

  String login() {
    return ('$username logged in');
  }
}

class SuperUser extends User {
  SuperUser(String username, int age) : super(username, age);

  String publish() {
    return ('published update');
  }
}
