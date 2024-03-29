import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:login_sqlite/common/messages.dart';
import 'package:login_sqlite/components/text_field.dart';
import 'package:login_sqlite/components/user_header.dart';
import 'package:login_sqlite/external/database/bd_sqlite.dart';
import 'package:login_sqlite/routes/view_routes.dart';

class HomeLogin extends StatefulWidget {
  const HomeLogin({super.key});

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login e Cadastro"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              children: <Widget>[
                const UserHeader(nameHeader: "Login"),
                FormTextField(
                  controller: _loginController,
                  hintName: "Login",
                  icon: Icons.person_outline,
                  inputType: TextInputType.text,
                ),
                FormTextField(
                  controller: _senhaController,
                  hintName: "Senha",
                  icon: Icons.lock_outline,
                  inputType: TextInputType.visiblePassword,
                  isObscured: true,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 30, left: 150, right: 150, bottom: 30),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // CRIPTOGRAFIA NA SENHA
                        var bytes = utf8.encode(_senhaController.text);
                        var hash = sha256.convert(bytes);

                        SqLiteDb db = SqLiteDb();

                        await db
                            .login(_loginController.text, hash.toString())
                            .then(
                          (value) {
                            if (value != null) {
                              var route = RouteSettings(
                                name: RoutesApp.update,
                                arguments: value,
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                RoutesApp.generateRoute(route),
                                (route) => false,
                              );
                            } else {
                              MessageApp.toastMesssage(
                                context,
                                MessageApp.errorWrongLoginPassword,
                              );
                            }
                          },
                        ).catchError(
                          (error) {
                            log(error);
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Login"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Não possui uma conta?"),
                    TextButton(
                      onPressed: () {
                        const route = RouteSettings(name: RoutesApp.signUp);
                        Navigator.pushAndRemoveUntil(context,
                            RoutesApp.generateRoute(route), (route) => false);
                      },
                      child: const Text("Cadastre-se"),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
