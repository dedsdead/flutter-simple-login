import 'package:flutter/material.dart';
import 'package:login_sqlite/common/messages.dart';
import 'package:login_sqlite/components/text_field.dart';
import 'package:login_sqlite/components/user_header.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _loginController = TextEditingController();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _loginController.dispose();
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmaController.dispose();

    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      if (_senhaController.text.trim() != _confirmaController.text.trim()) {
        MessageApp.toastMesssage(
          context,
          MessageApp.errorPasswordMismatch,
        );
        return;
      } else {
        
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Cadastrar Usuário"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const UserHeader(nameHeader: "Cadastrar"),
                FormTextField(
                    controller: _loginController,
                    hintName: "Login",
                    icon: Icons.person_outline,
                    inputType: TextInputType.text),
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
                    top: 20,
                    left: 80,
                    right: 80,
                  ),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _signUp();
                    },
                    child: const Text("Cadastrar"),
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
