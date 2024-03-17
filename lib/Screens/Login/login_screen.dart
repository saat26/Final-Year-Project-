import 'package:flutter/material.dart';

import '../../components/background.dart';
// import '../../responsive.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LoginScreenTopImage(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: LoginForm(),
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     Spacer(),
              //     Expanded(
              //       flex: 8,
              //       child: LoginForm(),
              //     ),
              //     Spacer(),
              //   ],
              // ),
            ],
          ),
        ),
      ),
      //     mobile: MobileLoginScreen(),
      //       desktop: Row(
      //         children: [
      //           Expanded(
      //             child: LoginScreenTopImage(),
      //           ),
      //           Expanded(
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SizedBox(
      //                   width: 450,
      //                   child: LoginForm(),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     child:  Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: <Widget>[
      //     LoginScreenTopImage(),
      //     Row(
      //       children: [
      //         Spacer(),
      //         Expanded(
      //           flex: 8,
      //           child: LoginForm(),
      //         ),
      //         Spacer(),
      //       ],
      //     ),
      //   ],
      // ),
      //     ),
      //   // ),
    );
  }
}

// class MobileLoginScreen extends StatelessWidget {
//   const MobileLoginScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         LoginScreenTopImage(),
//         Row(
//           children: [
//             Spacer(),
//             Expanded(
//               flex: 8,
//               child: LoginForm(),
//             ),
//             Spacer(),
//           ],
//         ),
//       ],
//     );
//   }
// }
