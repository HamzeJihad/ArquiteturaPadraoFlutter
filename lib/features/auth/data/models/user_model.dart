class UserModel {
    String id;
    String name;
    String email;
    String phone;
    bool isActive;
    List<String> roles;

    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.isActive,
        required this.roles,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        isActive: json["isActive"],
        roles: List<String>.from(json["roles"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "isActive": isActive,
        "roles": List<dynamic>.from(roles.map((x) => x)),
    };
}
