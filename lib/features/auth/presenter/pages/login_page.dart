import 'package:clean_arch_experts/features/auth/presenter/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  const LoginPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await controller
                .doLogin(email: 'email@email.com', password: '123456')
                .catchError((e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    e.message,
                  ),
                ),
              );
            }).then(
              (value) => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Logado com sucesso!',
                  ),
                ),
              ),
            );
          },
          child: Text('Logar'),
        ),
      ),
    );
  }
}
