// ignore_for_file: unawaited_futures

import 'package:flutter/material.dart';

import 'package:todo/login/login.dart';

import 'package:todo/signUp/signUp.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernamecontroller = TextEditingController();

  final TextEditingController _passwordcontroller = TextEditingController();

  final TextEditingController _confirmationcontroller = TextEditingController();

  final TextEditingController _emailcontroller = TextEditingController();
  String errorMessage = '';

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _globalKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == '') {
                        return "Name can't be null";
                      } else {
                        return null;
                      }
                    },
                    controller: _usernamecontroller,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'User Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {},
                    controller: _passwordcontroller,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.remove_red_eye),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    // validator: (value) {
                    //   if (_confirmationcontroller != _passwordcontroller) {
                    //     return "enter same password";
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    controller: _confirmationcontroller,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.remove_red_eye),
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == '') {
                        return "email can't be null";
                      } else {
                        return null;
                      }
                    },
                    controller: _emailcontroller,
                    style: const TextStyle(fontSize: 15),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      try {
                        if ( //_globalKey.currentState!.validate(),
                            await SignUpRepo().createUser(
                          _emailcontroller.text,
                          _passwordcontroller.text,
                          _usernamecontroller.text,
                        )) {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        }
                      } catch (e) {
                        setState(() {
                          errorMessage = 'not in correct format';
                        });
                      }
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 120,
                      left: 40,
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 125,
                        ),
                        const Text(
                          ' if you already have an account',
                          style: TextStyle(fontSize: 15),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              // ignore: inference_failure_on_instance_creation
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Login',
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
      ),
    );
  }
}
