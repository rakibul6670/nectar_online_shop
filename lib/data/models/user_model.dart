class UserModel {
  final String name;
  final String email;

  //================ Constructor ===============
  UserModel({required this.name, required this.email});

  //============= Factory Constructor=============
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json["name"], email: json["email"]);
  }

  //==================== to JSON ======================
  Map<String, dynamic> toJson() {
    return {"name": name, "email": email};
  }
}
