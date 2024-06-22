import 'dart:convert';

UserAccountCustomerCreateRequestDto userAccountCustomerCreateRequestDtoFromJson(
        String str) =>
    UserAccountCustomerCreateRequestDto.fromJson(json.decode(str));

String userAccountCustomerCreateRequestDtoToJson(
        UserAccountCustomerCreateRequestDto data) =>
    json.encode(data.toJson());

class UserAccountCustomerCreateRequestDto {
  String userName;
  String password;
  String email;

  UserAccountCustomerCreateRequestDto({
    required this.userName,
    required this.password,
    required this.email,
  });

  factory UserAccountCustomerCreateRequestDto.fromJson(
          Map<String, dynamic> json) =>
      UserAccountCustomerCreateRequestDto(
        userName: json["UserName"],
        password: json["Password"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "UserName": userName,
        "Password": password,
        "Email": email,
      };
}
