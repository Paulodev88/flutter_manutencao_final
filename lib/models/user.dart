enum UserType { TECNICO, ADMINISTRATIVO, TERCEIRIZADO }

class User {
  User(
      {this.name,
      this.email,
      this.phone,
      this.password,
      this.type = UserType.TECNICO});

  String name;
  String email;
  String phone;
  String password;
  UserType type;
}
