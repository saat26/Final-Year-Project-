import 'package:flutter/material.dart';
import '../../components/background.dart';
// import '../../constants.dart';
// import '../../responsive.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';
// import 'components/socal_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SignUpScreenTopImage(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: SignUpForm(),
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   children: [
              //     Spacer(),
              //     Expanded(
              //       flex: 8,
              //       child:
              //     ),
              //     Spacer(),
              //   ],
              // ),
              // const SocalSignUp()
            ],
          ),

          //  Responsive(
          //   mobile: MobileSignupScreen(),
          //   desktop: Row(
          //     children: [
          //       Expanded(
          //         child: SignUpScreenTopImage(),
          //       ),
          //       Expanded(
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             SizedBox(
          //               width: 450,
          //               child: SignUpForm(),
          //             ),
          //             SizedBox(height: defaultPadding / 2),
          //             // SocalSignUp()
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

// class MobileSignupScreen extends StatelessWidget {
//   const MobileSignupScreen({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         SignUpScreenTopImage(),
//         Row(
//           children: [
//             Spacer(),
//             Expanded(
//               flex: 8,
//               child: SignUpForm(),
//             ),
//             Spacer(),
//           ],
//         ),
//         // const SocalSignUp()
//       ],
//     );
//   }
// }
