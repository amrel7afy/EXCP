import 'dart:convert';

class User {
   String? firstName, middleName, lastName, phoneNumber, email, password;

  User({
     this.lastName,
     this.middleName,
     this.phoneNumber,
     this.firstName,
     this.email,
     this.password,
  });

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      lastName: jsonData['lastName'],
      middleName: jsonData['middleName'],
      phoneNumber: jsonData['phoneNumber'],
      firstName: jsonData['firstName'],
      email: jsonData['email'],
      password: 'password',
    );
  }
 @override
  String toString() {
  return 'Person{firstName: $firstName, middleName: $middleName, lastName: $lastName, phoneNumber: $phoneNumber, email: $email, password: $password}';
  }

  static Map<String, dynamic> toMap(User user) => {
        'lastName': user.lastName,
        'middleName': user.middleName,
        'phoneNumber': user.phoneNumber,
        'firstName': user.firstName,
        'email': user.email,
        'password': user.password,
      };

  static String encode(List<User> users) => json.encode(
        users.map<Map<String, dynamic>>((user) => User.toMap(user)).toList(),
      );

  static List<User> decode(String users) =>
      (json.decode(users) as List<dynamic>)
          .map<User>((item) => User.fromJson(item))
          .toList();
}
