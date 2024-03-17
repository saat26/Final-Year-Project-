import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../database/fire_auth.dart';
import '../../Home/home_screen.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: _nameTextController,
            validator: (input) =>
                input!.trim().isEmpty ? 'Please enter a valid name' : null,
            // onSaved: (input) => _userName = input!,
            decoration: InputDecoration(
              hintText: "Your Full Name",
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
          const SizedBox(height: defaultPadding / 2),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: _emailTextController,
            validator: (input) =>
                !input!.contains('@') ? 'Please enter a valid email' : null,
            // onSaved: (input) => _email = input!,
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
          const SizedBox(height: defaultPadding / 2),
          TextFormField(
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: kPrimaryColor,
            controller: _passwordTextController,
            validator: (input) =>
                input!.length < 6 ? 'Must be at least 6 characters' : null,
            // onSaved: (input) => _password = input!,
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
          const SizedBox(height: defaultPadding / 2),
          !_isLoading
              ? ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    // if (_isLoading == true) {
                    //   return const CircularProgressIndicator()
                    // }
                    if (_formKey.currentState!.validate()) {
                      User? user = await FireAuth.registerUsingEmailPassword(
                        username: _nameTextController.text,
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                      );

                      setState(() {
                        _isLoading = false;
                        _isLoading = !_isLoading;
                      });
                      if (user != null) {
                        // ignore: use_build_context_synchronously
                        // Navigator.of(context).pushAndRemoveUntil(
                        //   MaterialPageRoute(
                        //     builder: (context) => HomeScreen(user: user),
                        //   ),
                        //   ModalRoute.withName('/'),
                        // );
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen(user: user);
                            },
                          ),
                        );
                      }
                    }
                  },
                  child: Text("Sign Up".toUpperCase()),
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: kPrimaryColor,
                )),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
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
