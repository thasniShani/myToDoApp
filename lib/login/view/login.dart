import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo/home/home.dart';
import 'package:todo/login/login.dart';

import 'package:todo/signUp/signUp.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  void _clear() {
    _emailcontroller.clear();
    _passwordcontroller.clear();
  }

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hello',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
                ),
                const Text(
                  'Sign in to your account',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (value) {
                      if (value == '') {
                        return "Name can't be null";
                      } else {
                        return null;
                      }
                    },

                  controller: _emailcontroller,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                    hintText: 'User Name',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _passwordcontroller,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal,
                      ),
                    ),
                    hintText: 'Password',
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      if (await LoginRepo().signIn(
                        _emailcontroller.text,
                        _passwordcontroller.text,
                      )) {
                        _clear();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ));
                      }
                    } catch (e) {
                      setState(() {
                        errorMessage = 'invalid email/password';
                      });
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Text(
                  errorMessage,
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 120,
                    left: 50,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 125,
                      ),
                      const Text(
                        ' Dont have an account',
                        style: TextStyle(fontSize: 15),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            // ignore: inference_failure_on_instance_creation
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
