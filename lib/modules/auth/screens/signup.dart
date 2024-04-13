import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:lottie/lottie.dart';
import 'package:mindmorph/modules/auth/models/signup.dart';
import '../repositories/signup.dart';
import '/constants/color.dart';
import '/constants/fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // final _formKey = GlobalKey<FormState>();

  SignupFormModel user = SignupFormModel();

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickMedia();

    if (pickedFile != null) {
      setState(() {
        user.avatar = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: themecolor,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Expanded(
                child: Column(
                  children: [
                    50.heightBox,
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 180,
                          width: 180,
                          child: Lottie.asset('assets/images/signup.json'),
                        )),
                    const Divider(
                      thickness: 2,
                      color: titlecolor,
                      endIndent: 60,
                      indent: 60,
                    ),
                    30.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: 'Sign up'
                          .text
                          .color(titlecolor)
                          .size(30)
                          .fontWeight(FontWeight.bold)
                          .fontFamily(bold)
                          .make(),
                    ),
                    10.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: 'Please fill the inputs below'
                          .text
                          .size(14)
                          .color(subtexColor)
                          .fontFamily(regular)
                          .make(),
                    ),
                    Column(
                      children: [
                        TextFormField(
                          // style: TextStyle(color: Colors.green),
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Full Name'),
                          controller: user.fullName,
                          // controller: userForm.fullName,
                        ),
                        TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Email address',
                            ),
                            controller: user.email),
                        TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Password',
                            ),
                            controller: user.password),
                        DropdownButtonFormField(
                          value: 'Student',
                          onChanged: (value) {
                            setState(() {
                              user.role.text = value.toString();
                            });
                          },
                          items: ['Student', 'Instructor']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(color: Colors.blue),
                              ),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                              labelText: 'Are you Student or Instructor?'),
                        ),
                        const SizedBox(height: 15),
                        TextButton(
                          onPressed: () async {
                            await _getImage();
                          },
                          child: const Text(
                            'Profile Picture',
                            style: TextStyle(
                              color: Color.fromARGB(255, 45, 40, 40),
                            ),
                          ),
                        ),
                        user.avatar != null
                            ? Image.file(
                                user.avatar!,
                                height: 100,
                              )
                            : Container(),
                        TextFormField(
                          controller: user.birthdate,
                          decoration:
                              const InputDecoration(labelText: 'Birthdate'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your birthdate';
                            }
                            return null;
                          },
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            if (selectedDate != null) {
                              user.birthdate.text =
                                  selectedDate.toIso8601String().split('T')[0];
                            }
                          },
                        ),
                        20.heightBox,
                        TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 24, 35, 115)),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                const Size(200.0,
                                    40.0), // Adjust the width and height as needed
                              ),
                            ),
                            onPressed: () async {
                              SignupResponse response = await signup(user.data);
                              SnackBar snackBar;
                              if (response.status == 201) {
                                snackBar = SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text(response.message.trim(),
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  action: SnackBarAction(
                                    textColor:
                                        const Color.fromARGB(255, 9, 115, 202),
                                    label: 'Proceed to Login',
                                    onPressed: () => context.go('/login'),
                                  ),
                                );
                                Timer(const Duration(seconds: 3),
                                    () => context.go('/login'));
                              } else {
                                snackBar = SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(response.message,
                                        style: const TextStyle(
                                            color: Colors.white)));
                              }
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                            child: 'Sign Up'
                                .text
                                .color(titlecolor)
                                .fontFamily(regular)
                                .size(18)
                                .make()),
                        30.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: 'Already have an account?'
                                  .text
                                  .color(titlecolor)
                                  .fontFamily(semibold)
                                  .make(),
                            ),
                            TextButton(
                              onPressed: () {
                                // Get.to(() => Login());
                                context.go('/login');
                              },
                              child: 'Sign In '
                                  .text
                                  .color(redColor)
                                  .fontFamily(semibold)
                                  .make(),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
