import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              hintText: "Digite seu login",
              labelText: 'Login',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).errorColor),
              ),
              prefix: const Icon(Icons.person_outline),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 30, right: 30, left: 30),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              hintText: "Digite sua senha",
              labelText: 'Senha',
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).errorColor),
              ),
              prefix: const Icon(Icons.lock_outline),
            ),
          ),
        ),
      ],
    );
  }
}
