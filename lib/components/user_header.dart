import 'package:flutter/material.dart';

class UserHeader extends StatelessWidget {
  final String nameHeader;

  const UserHeader({super.key, required this.nameHeader});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          nameHeader,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Image(
          height: 200,
          image: AssetImage("images/login.png"),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Aula de Dispositivos Móveis",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
