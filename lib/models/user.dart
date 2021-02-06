enum UserType { TECNICO, ADMINISTRATIVO, TERCEIRIZADO }

class User {
  User(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.password,
      this.type = UserType.TECNICO,
      this.createdAt});

  String id;
  String name;
  String email;
  String phone;
  String password;
  UserType type;
  DateTime createdAt;
}
