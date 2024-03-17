import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/feedback_form.dart';

class FeedBackForm extends StatefulWidget {
  const FeedBackForm({super.key});

  @override
  State<FeedBackForm> createState() => _FeedBackFormState();
}

class _FeedBackFormState extends State<FeedBackForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Feedback'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10,top:20),
              child: FeedbackForm(),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
