// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:lottie/lottie.dart';
// import 'package:mindmorph/modules/auth/models/login.dart';
// import 'package:velocity_x/velocity_x.dart';

// import '../repositories/login.dart';
// import '/constants/fonts.dart';
// import '/constants/color.dart';

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   // static String routeName = 'login', routePath = '/login';

//   bool _obscureText = true;
//   LoginFormModel loginForm = LoginFormModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       // resizeToAvoidBottomInset: false,
//       body: Container(
//         height: double.infinity,
//         color: themecolor,
//         child: Padding(
//           padding: const EdgeInsets.all(30),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 50.heightBox,
//                 Align(
//                   child: SizedBox(
//                     height: 200,
//                     width: 200,
//                     child: Lottie.asset('assets/images/login.json'),
//                   ),
//                 ),
//                 const Divider(
//                   thickness: 2,
//                   color: titlecolor,
//                   endIndent: 60,
//                   indent: 60,
//                 ),
//                 30.heightBox,
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: 'Login'
//                       .text
//                       .color(titlecolor)
//                       .size(30)
//                       .fontWeight(FontWeight.bold)
//                       .fontFamily(bold)
//                       .make(),
//                 ),
//                 10.heightBox,
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: 'Please fill the inputs below'
//                       .text
//                       .size(14)
//                       .color(subtexColor)
//                       .fontFamily(regular)
//                       .make(),
//                 ),
//                 Column(
//                   children: [
//                     TextFormField(
//                       controller: loginForm.email,
//                       decoration: const InputDecoration(
//                         border: UnderlineInputBorder(),
//                         labelText: 'Email',
//                       ),
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                     TextFormField(
//                       controller: loginForm.password,
//                       decoration: InputDecoration(
//                         border: const UnderlineInputBorder(),
//                         labelText: 'Password',
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _obscureText
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                             color: const Color.fromARGB(255, 65, 60, 75),
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _obscureText = !_obscureText;
//                             });
//                           },
//                         ),
//                       ),
//                       style: const TextStyle(color: Colors.white),
//                       obscureText: _obscureText,
//                     ),
//                     20.heightBox,
//                     TextButton(
//                       style: ButtonStyle(
//                         backgroundColor: MaterialStateProperty.all<Color>(
//                             const Color.fromARGB(255, 24, 35, 115)),
//                         padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                           const EdgeInsets.symmetric(
//                               horizontal: 20.0, vertical: 10.0),
//                         ),
//                         shape: MaterialStateProperty.all<OutlinedBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                         ),
//                         minimumSize: MaterialStateProperty.all<Size>(
//                           const Size(200.0,
//                               40.0), // Adjust the width and height as needed
//                         ),
//                       ),
//                       onPressed: () async {
//                         LoginResponse response = await login(loginForm.data);
//                         SnackBar snackBar;
//                         if (response.status == 200) {
//                           snackBar = SnackBar(
//                             backgroundColor: Colors.green,
//                             content: Text(response.message,
//                                 style: const TextStyle(color: Colors.white)),
//                             action: SnackBarAction(
//                               textColor: const Color.fromARGB(255, 9, 115, 202),
//                               label: 'Proceed to Home Page',
//                               onPressed: () => context.go('/home'),
//                             ),
//                           );
//                           Timer(const Duration(seconds: 1),
//                               () => context.go('/home'));
//                         } else {
//                           snackBar = SnackBar(
//                               backgroundColor: Colors.red,
//                               content: Text(response.message,
//                                   style: const TextStyle(color: Colors.white)));
//                         }
//                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                       },
//                       child: 'Log In'
//                           .text
//                           .color(titlecolor)
//                           .fontFamily(regular)
//                           .size(18)
//                           .make(),
//                     ),
//                     10.heightBox,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                           onPressed: () {},
//                           child: 'Forgot password ?'
//                               .text
//                               .color(titlecolor)
//                               .fontFamily(semibold)
//                               .make(),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             context.go('/signup');
//                           },
//                           child: 'Sign up  '
//                               .text
//                               .color(redColor)
//                               .fontFamily(semibold)
//                               .make(),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
