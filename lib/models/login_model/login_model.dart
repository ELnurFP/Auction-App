class LoginModel {
  final String fin;
  final String phoneNumber;

  LoginModel(this.fin, this.phoneNumber);

  Map<String, dynamic> toJson() => {
        'fin': fin,
        'phoneNumber': phoneNumber,
      };
}
