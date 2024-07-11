class SignUpRequest {
  final String userName;
  final String name;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpRequest({

    required this.userName,
    required this.name,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });



  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'name': name,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  @override
  String toString() {
    return 'SignUpRequest{userName: $userName, name: $name, firstName: $firstName, middleName: $middleName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword}';
  }
}
