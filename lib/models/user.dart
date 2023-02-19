class User {
  final String id;
  final String phoneNumber;
  final String birthday;
  final String fullName;

  User(
      {required this.id,
      required this.phoneNumber,
      required this.birthday,
      required this.fullName});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phone_number': phoneNumber,
      'birthday': birthday,
      'full_name': fullName
    };
  }

  static User fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        phoneNumber: json['phone_number'],
        birthday: json['birthday'],
        fullName: json['full_name']);
  }
}
