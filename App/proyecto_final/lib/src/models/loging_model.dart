class LoginModel {
  LoginModel({
    this.valido,
    this.titulo,
    this.token,
    this.idUser,
    this.rol,
  });

  bool? valido;
  String? titulo;
  String? token;
  int? idUser;
  String? rol;

  factory LoginModel.fromJson(Map<String, dynamic> parsedJson) {
    return LoginModel(
      valido: parsedJson['valido'] as bool,
      titulo: parsedJson['titulo'],
      token: parsedJson['token'],
      idUser: parsedJson['idUser'] as int,
      rol: parsedJson['rol'],
    );
  }
}
