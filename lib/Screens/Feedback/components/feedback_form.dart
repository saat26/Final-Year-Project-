// import 'package:firebase_auth/firebase_auth.dart';
import 'package:bank_bot/Screens/Home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../constants.dart';
import '../../../database/fire_auth.dart';
// import '../../Home/home_screen.dart';
// import '../../Home/home_screen.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _messageTextController = TextEditingController();
  // bool _isLoading = false;
  double rating = 3;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              controller: _nameTextController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              // maxLines: 10,
              decoration: InputDecoration(
                labelText: "Please write your name!",
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(0.4)),
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5))),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field Required';
                } else {
                  return null;
                }
              },
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              controller: _messageTextController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: "Please tell us what you think.",
                labelStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    color: Colors.black.withOpacity(0.4)),
                border: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5))),
                enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.5))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor)),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Field Required';
                } else {
                  return null;
                }
              },
            ),
          ),
          const SizedBox(height: defaultPadding * 3),
          const Text(
            'Please tell us How You feel',
          ),
          const SizedBox(height: defaultPadding),
          RatingBar.builder(
            initialRating: 3,
            itemCount: 5,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: Colors.red,
                  );
                case 1:
                  return const Icon(
                    Icons.sentiment_dissatisfied,
                    color: Colors.redAccent,
                  );
                case 2:
                  return const Icon(
                    Icons.sentiment_neutral,
                    color: Colors.amber,
                  );
                case 3:
                  return const Icon(
                    Icons.sentiment_satisfied,
                    color: Colors.lightGreen,
                  );
                case 4:
                  return const Icon(
                    Icons.sentiment_very_satisfied,
                    color: Colors.green,
                  );
              }
              return widget;
            },
            onRatingUpdate: (newRating) {
              setState(() {
                rating = newRating; 
              });
              print(rating);
            },
          ),
          const SizedBox(height: defaultPadding * 2),
          Hero(
            tag: "feedback_btn",
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await FireAuth.feedback(
                    fName: _nameTextController.text,
                    fMessage: _messageTextController.text,
                    rating: rating,
                  );
                  _nameTextController.clear();
                  _messageTextController.clear();

                  User? user = FirebaseAuth.instance.currentUser;

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(user: user!),
                    ),
                  );
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Feedback Sended Successfully...!'),
                    backgroundColor: kPrimaryColor.withOpacity(0.7),
                    margin: const EdgeInsets.all(15),
                  ));
                }
              },
              child: Text("Send feedback".toUpperCase()),
            ),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
