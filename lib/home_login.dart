import 'package:flutter/material.dart';
import 'package:login_sqlite/screen/login_form.dart';

class HomeLogin extends StatefulWidget {
  const HomeLogin({super.key});

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login com sqLite",
      theme: ThemeData(
          primarySwatch: Colors.grey,
          secondaryHeaderColor: Colors.black,
          errorColor: Colors.pink),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Login e Cadastro"),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 50),
          child: Center(
            child: Column(
              children: <Widget>[
                const Text(
                  "Login",
                  style: TextStyle(
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
                const LoginForm(),
                Container(
                  padding: const EdgeInsets.only(
                      top: 30, left: 80, right: 80, bottom: 30),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("Login"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Possui uma conta?"),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Inscreva-se"),
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
