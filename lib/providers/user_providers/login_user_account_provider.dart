// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:mundo_artesano/dtos/request/login_request_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginUserProvider extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  Future loginUser(
      String userNameOrEmail, String password, BuildContext context) async {
    final user =
        LoginRequestDto(userNameOrEmail: userNameOrEmail, password: password);

    final response =
        await http.post(Uri.parse('http://localhost:5149/api/Login'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(user));

    if (response.statusCode == 200) {
      if (context.mounted) {
        final json = jsonDecode(response.body)['token'];
        await storage.write(key: 'token', value: json);
        // final token = await getAuthToken();

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Bienvenido ${user.userNameOrEmail}")));
        Navigator.restorablePushNamedAndRemoveUntil(
            context, '/home', (route) => false);
      }
    } else {
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("El correo o contraseña es incorrecta"),
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

  Future<String?> getAuthToken() async {
    return storage.read(key: 'token');
  }

  Future clearAuthToken() async {
    return storage.delete(key: 'token');
  }
}
