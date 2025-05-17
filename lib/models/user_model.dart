class UserModel {
  final int id;
  final String email;
  final String name;
  final bool isActive;
  final String mobileNo;
  final String permission;
  final String password;
  final String joinedDate;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.isActive,
    required this.mobileNo,
    required this.permission,
    required this.password,
    required this.joinedDate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      isActive: json['isActive'],
      mobileNo: json['mobileNo'],
      permission: json['permission'],
      password: json['password'],
      joinedDate: json['joinedDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'isActive': isActive,
      'mobileNo': mobileNo,
      'permission': permission,
      'password': password,
      'joinedDate': joinedDate,
    };
  }
}
