import 'dart:convert';

CustomerResponseDto customerResponseDtoFromJson(String str) =>
    CustomerResponseDto.fromJson(json.decode(str));

String customerResponseDtoToJson(CustomerResponseDto data) =>
    json.encode(data.toJson());

class CustomerResponseDto {
  int id;
  String code;
  String name;
  String firstName;
  String middleName;
  String lastName;
  String phone;
  String cellPhone;
  int gender;
  String genderName;
  DateTime birthDate;
  int age;
  int status;
  String statusName;
  bool isDeleted;

  CustomerResponseDto({
    required this.id,
    required this.code,
    required this.name,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.phone,
    required this.cellPhone,
    required this.gender,
    required this.genderName,
    required this.birthDate,
    required this.age,
    required this.status,
    required this.statusName,
    required this.isDeleted,
  });

  factory CustomerResponseDto.fromJson(Map<String, dynamic> json) =>
      CustomerResponseDto(
        id: json["Id"],
        code: json["Code"],
        name: json["Name"],
        firstName: json["FirstName"],
        middleName: json["MiddleName"],
        lastName: json["LastName"],
        phone: json["Phone"],
        cellPhone: json["CellPhone"],
        gender: json["Gender"],
        genderName: json["GenderName"],
        birthDate: DateTime.parse(json["BirthDate"]),
        age: json["Age"],
        status: json["Status"],
        statusName: json["StatusName"],
        isDeleted: json["IsDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Code": code,
        "Name": name,
        "FirstName": firstName,
        "MiddleName": middleName,
        "LastName": lastName,
        "Phone": phone,
        "CellPhone": cellPhone,
        "Gender": gender,
        "GenderName": genderName,
        "BirthDate": birthDate.toIso8601String(),
        "Age": age,
        "Status": status,
        "StatusName": statusName,
        "IsDeleted": isDeleted,
      };
}
