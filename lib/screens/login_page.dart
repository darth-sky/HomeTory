import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/components/My_textfield.dart';
import 'package:my_app/components/constants.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/cubit/auth/auth_cubit.dart';
import 'package:my_app/cubit/auth/auth_cubit.dart';
import 'package:my_app/dto/login.dart';
import 'package:my_app/main.dart';
// import 'package:my_app/main.dart';
import 'package:my_app/screens/routes/signUp_screen.dart';
import 'package:my_app/services/data_services.dart';
import 'package:my_app/utils/secure_storage_util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  void signUserIn(BuildContext context) {
    String username = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (username == '' && password == '') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: 'Home Screen')),
      );
      // Navigator.pushReplacementNamed(context, "/");
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Username atau password salah.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // void sendLogin(context, AuthCubit authCubit) async {
  //   final email = _emailController.text;
  //   final password = _passwordController.text;
  //   debugPrint("send login here");
  //   final response = await DataService.sendLoginData(email, password);
  //   debugPrint(response.toString());
  //   if (response.statusCode == 200) {
  //     debugPrint("sending success");
  //     final data = jsonDecode(response.body);
  //     final loggedIn = Login.fromJson(data);
  //     await SecureStorageUtil.storage
  //         .write(key: tokenStoreName, value: loggedIn.accessToken);
  //     authCubit.login(loggedIn.accessToken);
  //     Navigator.pushReplacementNamed(context, "/");
  //     debugPrint(loggedIn.accessToken);
  //   } else {
  //     debugPrint("failed not");
  //   }
  // }

  void signUserUp() {}
  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('HomeTory'),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/HomeStock.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Welcome!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextfield(
                controller: _emailController,
                hintText: 'Username / Account',
                obscureText: false,
                prefixIcon: Icons.person,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextfield(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                prefixIcon: Icons.password,
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Lupa Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login Test',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()),
                          );
                        },
                        child: Text(
                          'Tidak Punya Akun? SIGN UP',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.black,
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
