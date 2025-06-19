class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
  });

  String? message;
  LoginUserEntity? user;
  String? token;
  String? statusMsg;
}

class LoginUserEntity {
  LoginUserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
