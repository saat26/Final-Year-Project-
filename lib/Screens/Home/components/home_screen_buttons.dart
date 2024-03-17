import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../bot.dart';
import '../../../constants.dart';
import '../../Feedback/feedback.dart';
import '../../ATM_Locator/atm_locator.dart';
import '../../Branch_Locator/branch_locator.dart';

class HomeScreenButtons extends StatelessWidget {
  const HomeScreenButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ATMLocator();
                  },
                ),
              );
            },
            child: Text("ATM Locator".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const BranchLocator();
                  },
                ),
              );
            },
            child: Text("Branch Locator".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Chat(
                      user: user!,
                    );
                  },
                ),
              );
            },
            child: Text("Chat Bot".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const FeedBackForm();
                  },
                ),
              );
            },
            child: Text("FeedBack".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text("Logout".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
