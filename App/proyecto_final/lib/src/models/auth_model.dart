class AuthModel {
  AuthModel({
    this.correo,
    this.contrasenia,
  });

  String? correo;
  String? contrasenia;

  Map<String, dynamic> toJson() {
    return {
      'correo': correo,
      'contraseña': contrasenia,
    };
  }
}
