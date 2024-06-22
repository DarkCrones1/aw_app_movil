import 'dart:convert';

import 'package:mundo_artesano/dtos/request/user_account_customer_create_request_dto.dart';
import 'package:mundo_artesano/dtos/response/api_response.dart';
import 'package:mundo_artesano/dtos/response/user_account_customer_response_dto.dart';
import 'package:mundo_artesano/providers/user_providers/login_user_account_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserAccountProvider extends ChangeNotifier {
  ApiResponseDto<UserAccountCustomerResponseDto>? _user;
  bool isloading = true;
  ApiResponseDto<UserAccountCustomerResponseDto>? get user => _user;

  Future get() async {
    final userAccount = LoginUserProvider();
    final token = userAccount.getAuthToken();

    final response = await http.get(
        Uri.parse('http://localhost:5149/api/UserAccount/Customer'),
        headers: <String, String>{
          'accept': 'text/plain',
          'Authorization': 'Bearer $token'
        });

    if (response.statusCode == 200) {
      final json = jsonDecode((response.body));
      final ApiResponseDto<UserAccountCustomerResponseDto> data = json;

      _user = data;

      isloading = false;

      notifyListeners();
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future create(String userName, String password, String email,
      BuildContext context) async {
    final user = UserAccountCustomerCreateRequestDto(
        userName: userName, password: password, email: email);

    final response = await http.post(
        Uri.parse('http://localhost:5149/api/UserAccount/Customer'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user));

    if (response.statusCode == 200) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cuenta de usuario creada')));
        Navigator.pop(context);
      }
    } else {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Elija un correo válido"),
              actions: [
                TextButton(
                  child: const Text("Cerrar"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  void logout() {}
}
