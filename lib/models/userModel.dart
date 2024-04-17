class User {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? speciality;
  final String? accountType;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.speciality,
    this.accountType,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      speciality: json['speciality'] ?? "",
      accountType: json['accountType'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'speciality': speciality,
      'accountType': accountType,
    };
  }
}

class Users {
  List<User>? users = [];
  Users({this.users});
  factory Users.fromJsonList(List<dynamic> jsonList) {
    List<User> usersList = jsonList.map((json) => User.fromJson(json)).toList();
    return Users(users: usersList);
  }

  List<Map<String, dynamic>> toJsonList() {
    return users!.map((user) => user.toJson()).toList();
  }
}
