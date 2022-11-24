import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff06283D),
                  Color(0xff256D85),
                  Color(0xff47B5FF)
                ],
                stops: [
                  0.2,
                  0.5,
                  0.8
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter),
          ),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Image.asset(
                  'Assets/images/user.png',
                  scale: 13,
                ),
                const SizedBox(
                  height: 25.0,
                ),
                _textFieldEmail(),
                const SizedBox(
                  height: 25.0,
                ),
                _textFieldPass(),
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 240),
                  child: CheckboxListTile(
                    title: const Text('Recordarme'),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: _check,
                    onChanged: ((value) {
                      setState(() {
                        _check = value!;
                      });
                    }),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                _loginButton(),
              ])),
        ),
      ),
    );
  }

  Widget _textFieldEmail() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextField(
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.person_outline),
            labelText: 'Correo',
            hintText: '@example.com'),
        controller: emailController,
      ),
    );
  }

  Widget _textFieldPass() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: TextField(
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.lock_outlined),
          labelText: 'Constraseña',
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
        color: Colors.blueGrey,
        margin: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: TextButton(
          onPressed: (() {
            Navigator.popAndPushNamed(context, 'area');
          }),
          child: const Text(
            'Ingresar',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ));
  }
}
