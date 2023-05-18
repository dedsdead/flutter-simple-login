import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:login_sqlite/common/messages.dart';
import 'package:login_sqlite/components/text_field.dart';
import 'package:login_sqlite/components/user_header.dart';
import 'package:login_sqlite/external/database/bd_sqlite.dart';
import 'package:login_sqlite/model/user_model.dart';
import 'package:login_sqlite/routes/view_routes.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final _loginController = TextEditingController();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late final UserModel user;

  @override
  void didChangeDependencies() {
    user = ModalRoute.of(context)!.settings.arguments as UserModel;
    super.didChangeDependencies();
  }

  _getUserData(UserModel user) {
    setState(() {
      _loginController.text = user.userId;
      _nomeController.text = user.userName;
      _emailController.text = user.userEmail;
    });
  }

  @override
  void dispose() {
    _loginController.dispose();
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmaController.dispose();

    super.dispose();
  }

  void _update() async {
    if (_formKey.currentState!.validate()) {
      if (_senhaController.text.trim() != _confirmaController.text.trim()) {
        MessageApp.toastMesssage(
          context,
          MessageApp.errorPasswordMismatch,
        );
        return;
      } else {
        // CRIPTOGRAFIA NA SENHA
        var bytes = utf8.encode(_senhaController.text);
        var hash = sha256.convert(bytes);

        UserModel user = UserModel(
          userId: _loginController.text,
          userName: _nomeController.text,
          userEmail: _emailController.text,
          userPassword: hash.toString(),
        );

        SqLiteDb db = SqLiteDb();

        await db.updateUser(user).then(
          (value) {
            const route = RouteSettings(name: RoutesApp.home);
            Navigator.pushAndRemoveUntil(
              context,
              RoutesApp.generateRoute(route),
              (route) => false,
            );
          },
        ).catchError(
          (onError) {
            log(onError);
          },
        );
      }
    }
  }

  void _delete() async {
    MessageApp.toastMesssage(
      context,
      MessageApp.confirmDeletion,
      icon: Icons.delete,
      f: () async {
        SqLiteDb db = SqLiteDb();

        await db.deleteUser(user.userId).then(
          (_) {
            const route = RouteSettings(name: RoutesApp.home);
            Navigator.pushAndRemoveUntil(
              context,
              RoutesApp.generateRoute(route),
              (route) => false,
            );
          },
        ).catchError(
          (onError) {
            log(onError);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _getUserData(user);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Atualizar Usuário"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const UserHeader(nameHeader: "Atualizar"),
                FormTextField(
                  controller: _loginController,
                  hintName: "Login",
                  icon: Icons.person_outline,
                  inputType: TextInputType.text,
                  isEnabled: false,
                ),
                FormTextField(
                  controller: _nomeController,
                  hintName: "Nome",
                  icon: Icons.person,
                  inputType: TextInputType.text,
                ),
                FormTextField(
                  controller: _emailController,
                  hintName: "Email",
                  icon: Icons.email_outlined,
                  inputType: TextInputType.emailAddress,
                ),
                FormTextField(
                  controller: _senhaController,
                  hintName: "Senha",
                  icon: Icons.lock_outline,
                  inputType: TextInputType.visiblePassword,
                  isObscured: true,
                ),
                FormTextField(
                  controller: _confirmaController,
                  hintName: "Confirma Senha",
                  icon: Icons.lock_outline,
                  inputType: TextInputType.visiblePassword,
                  isObscured: true,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 50,
                    right: 50,
                    bottom: 30,
                  ),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {
                          _update();
                        },
                        child: const Text(
                          "Atualizar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                        onPressed: () {
                          _delete();
                        },
                        child: const Text(
                          "Deletar",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
