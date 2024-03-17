// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../constants.dart';

// class HomeScreenTopImage extends StatefulWidget {
//   final User user;
//   const HomeScreenTopImage({Key? key, required this.user}) : super(key: key);

//   @override
//   State<HomeScreenTopImage> createState() => _HomeScreenTopImageState();
// }

// class _HomeScreenTopImageState extends State<HomeScreenTopImage> {
//   late User _currentUser;

//   @override
//   void initState() {
//     _currentUser = widget.user;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text(
//           "WELCOME  ${_currentUser.displayName}",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(height: defaultPadding),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             const Spacer(),
//             SvgPicture.asset(
//               "assets/icons/chat.svg",
//               height: 250,
//             ),
//             const Spacer(),
//           ],
//         ),
//         const SizedBox(height: defaultPadding * 2),
//       ],
//     );
//   }
// }
