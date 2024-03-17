import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../database/fire_auth.dart';
import '../../Home/home_screen.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: _emailController,
            onSaved: (email) {},
            validator: validateEmail,
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: const Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    width: 3, color: kPrimaryColor), //<-- SEE HERE
                borderRadius: BorderRadius.circular(50.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: _passwordController,
              validator: validateEmptyField,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      width: 3, color: kPrimaryColor), //<-- SEE HERE
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: !_isLoading
                ? ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      // _isLoading = false : const CircularProgressIndicator();
                      if (_formKey.currentState!.validate()) {
                        User? user = await FireAuth.signInUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        if (user != null) {
                          setState(() {
                            _isLoading = false;
                            _isLoading = !_isLoading;
                          });
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(user: user)),
                          );
                        }
                      }
                    },
                    // {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) {
                    //         return const HomeScreen();
                    //       },
                    //     ),
                    //   );
                    // },
                    child: Text(
                      "Login".toUpperCase(),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  )),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
