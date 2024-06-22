import 'dart:convert';

LoginRequestDto userCreateRequestDtoFromJson(String str) =>
    LoginRequestDto.fromJson(json.decode(str));

String userCreateRequestDtoToJson(LoginRequestDto data) =>
    json.encode(data.toJson());

class LoginRequestDto {
  LoginRequestDto({required this.userNameOrEmail, required this.password});

  final String userNameOrEmail;
  final String password;

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      LoginRequestDto(
          userNameOrEmail: json["userName"], password: json["password"]);

  Map<String, dynamic> toJson() =>
      {"userNameOrEmail": userNameOrEmail, "password": password};
}
