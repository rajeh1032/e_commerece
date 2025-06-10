class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
  });

  String? message;
  String? statusMsg;
  UserEntity? user;
  String? token;
}

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
