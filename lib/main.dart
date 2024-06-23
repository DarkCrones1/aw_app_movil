import 'package:mundo_artesano/config/theme/app_theme.dart';
import 'package:mundo_artesano/pages/user_pages/login_page_screen.dart';
import 'package:mundo_artesano/pages/user_pages/recover_page_screen.dart';
import 'package:mundo_artesano/pages/user_pages/signup_page_screen.dart';
import 'package:mundo_artesano/providers/user_providers/login_user_account_provider.dart';
import 'package:mundo_artesano/providers/user_providers/post_user_account_provider.dart';
import 'package:mundo_artesano/widget/navbar/navegation_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserAccountProvider()),
        ChangeNotifierProvider(create: (context) => LoginUserProvider()),
      ],
      child: const MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mundo Artesano',
      theme: AppTheme( selectedColor: 5).theme(),
      home: const LoginPageScreen(),
      routes: {
        '/home': (context) => const NavBarScreen(),
        '/log_in': (context) => const LoginPageScreen(),
        '/sign_up': (context) => const SignUpPageScreen(),
        '/recover_pass': (context) => const RecoverPassPageScreen(),
      },
    );
  }
}
