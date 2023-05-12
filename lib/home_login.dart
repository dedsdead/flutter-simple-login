import 'package:flutter/material.dart';
import 'package:login_sqlite/components/text_field.dart';
import 'package:login_sqlite/components/user_header.dart';
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
                      top: 30, left: 80, right: 80, bottom: 30),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                          context,
                          RoutesApp.update,
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
                        Navigator.pushAndRemoveUntil(
                            context,RoutesApp.generateRoute(RouteSettings()),(route) => false);
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
