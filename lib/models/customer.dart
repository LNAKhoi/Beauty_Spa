class Customer {

  final String id;
  final String email;
  final String birthday;
  final String fullName;

  Customer(
      {required this.id,
      required this.email,
      required this.birthday,
      required this.fullName});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'birthday': birthday,
      'full_name': fullName
    };
  }

  static Customer fromJson(Map<String, dynamic> json) {
    return Customer(
        id: json['id'],
        email: json['email'],
        birthday: json['birthday'],
        fullName: json['full_name']);
  }
}
