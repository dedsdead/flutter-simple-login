import 'package:flutter/material.dart';
import 'package:login_sqlite/components/text_field.dart';
import 'package:login_sqlite/components/user_header.dart';
import 'package:login_sqlite/routes/view_routes.dart';

class UpdateUser extends StatefulWidget {
  const UpdateUser({super.key});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  void _update() {
    if (_formKey.currentState!.validate()) {
      const route = RouteSettings(name: RoutesApp.home);
      Navigator.pushAndRemoveUntil(
          context, RoutesApp.generateRoute(route), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                const UserHeader(nameHeader: "Cadastrar"),
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
                Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 150,
                    right: 150,
                    bottom: 30,
                  ),
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      _update();
                    },
                    child: const Text("Atualizar"),
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
