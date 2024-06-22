import 'dart:convert';

UserAccountCustomerResponseDto userAccountCustomerResponseDtoFromJson(
        String str) =>
    UserAccountCustomerResponseDto.fromJson(json.decode(str));

String userAccountCustomerResponseDtoToJson(
        UserAccountCustomerResponseDto data) =>
    json.encode(data.toJson());

class UserAccountCustomerResponseDto {
  int id;
  int customerId;
  String userName;
  String email;
  String fullName;
  String phone;
  String cellPhone;
  int userAccountType;
  String userAccountTypeName;
  bool isDeleted;

  UserAccountCustomerResponseDto({
    required this.id,
    required this.customerId,
    required this.userName,
    required this.email,
    required this.fullName,
    required this.phone,
    required this.cellPhone,
    required this.userAccountType,
    required this.userAccountTypeName,
    required this.isDeleted,
  });

  factory UserAccountCustomerResponseDto.fromJson(Map<String, dynamic> json) =>
      UserAccountCustomerResponseDto(
        id: json["Id"],
        customerId: json["CustomerId"],
        userName: json["UserName"],
        email: json["Email"],
        fullName: json["FullName"],
        phone: json["Phone"],
        cellPhone: json["CellPhone"],
        userAccountType: json["UserAccountType"],
        userAccountTypeName: json["UserAccountTypeName"],
        isDeleted: json["IsDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CustomerId": customerId,
        "UserName": userName,
        "Email": email,
        "FullName": fullName,
        "Phone": phone,
        "CellPhone": cellPhone,
        "UserAccountType": userAccountType,
        "UserAccountTypeName": userAccountTypeName,
        "IsDeleted": isDeleted,
      };
}
