
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../component/text_field.dart';
import '../resources/auth_method.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String result = await AuthMethod().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (result == 's') {
      setState(() {
        //   _isloading = false;
        //   Navigator.push(context,
        //       MaterialPageRoute(builder: (context) => const HomeScreen()));
      });
      if (kDebugMode) {
        print('Successfully logged in');
      }
    } else {
      if (kDebugMode) {
        print('not Succesful');
      }
    }
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              const Text('ICodegram', style: TextStyle(fontSize: 40, fontFamily: 'Lobster', color: Colors.white),),
              const SizedBox(
                height: 64,
              ),
              TextFieldInput(
                  hintText: 'Enter your email',
                  obsecureText: false,
                  textEditingController: _emailController,
                  textInputType: TextInputType.emailAddress),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                  hintText: 'Enter your password',
                  obsecureText: true,
                  textEditingController: _passwordController,
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 64,
              ),
              InkWell(
                onTap: () {
                  loginUser();
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                      color: Colors.blue),
                  child: _isLoading
                      ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                      : const Text('Login', style: TextStyle(fontFamily: 'Rubik'),),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(flex: 2, child: Container()),

            ],
          ),
        ),
      ),
    );
  }
}
