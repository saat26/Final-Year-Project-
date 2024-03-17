import 'package:bank_bot/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/background.dart';
import 'components/home_screen_buttons.dart';

class HomeScreen extends StatefulWidget {
  final User user;
  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User currentUser;

  @override
  void initState() {
    currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
          child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "WELCOME ${currentUser.displayName}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: defaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Spacer(),
                          SvgPicture.asset(
                            "assets/icons/chat.svg",
                            height: 250,
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: defaultPadding * 2),
                    ],
                  ),
                ),
              ],
            ),
            const HomeScreenButtons(),
          ],
        ),
      )),
    );
  }
}
