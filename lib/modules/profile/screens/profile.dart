import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:mindmorph/storage/user/user_storage.dart';
import '../../../storage/user/user_json_model.dart';
import '/constants/color.dart';
import './Instructorpage/instrcutorAc.dart';
import 'package:velocity_x/velocity_x.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  UserStorageModel user = UserStorageModel(
    fullName: 'Sobin Rai',
    avatar:
        'https://cdn.britannica.com/09/75509-050-86D8CBBF/Albert-Einstein.jpg',
    email: 'Sobin@sobin.com',
    role: 'STUDENT',
    userId: -1,
    isLogin: false,
  );
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserStorage.user,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // Future hasn't finished yet, return a placeholder
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.data == null) {
          return const Center(
            child: Text('Failed to fetch profile from local storage'),
          );
        } else {
          user = snapshot.data!;
        }

        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(12),
            color: themecolor,
            width: context.screenWidth,
            height: context.screenHeight,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                      child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () => context.go('/home'),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: featureColor,
                              )),
                          90.widthBox,
                          Align(
                            alignment: Alignment.center,
                            child: "My profile"
                                .text
                                .color(featureColor)
                                .bold
                                .size(18)
                                .make(),
                          ),
                        ],
                      ),
                      20.heightBox,
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 170,
                        width: 350,
                        decoration: BoxDecoration(
                            color: backgrounghilghtcolor,
                            borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    20.heightBox,
                                    user.fullName.text
                                        .size(20)
                                        .align(TextAlign.left)
                                        .bold
                                        .color(titlecolor)
                                        .make(),
                                    user.email.text
                                        .size(15)
                                        .semiBold
                                        .align(TextAlign.left)
                                        .color(const Color.fromARGB(
                                            255, 88, 68, 132))
                                        .make(),
                                    20.heightBox,
                                    const Icon(
                                      FontAwesomeIcons.userGraduate,
                                      color: Color.fromARGB(255, 173, 178, 209),
                                    )
                                  ],
                                ),
                                130.widthBox,
                                Column(children: [
                                  Container(
                                    alignment: Alignment.centerRight,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  255, 249, 249, 249)
                                              .withOpacity(0.2),
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: ClipOval(
                                      child: Image.network(
                                        user.avatar,
                                        width: 75,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  10.heightBox,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Instrcutoraccount()),
                                            );
                                          },
                                          icon: const Icon(
                                            FontAwesomeIcons.exchangeAlt,
                                            color: Color.fromARGB(
                                                255, 173, 178, 209),
                                            size: 20,
                                          ))
                                    ],
                                  )
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      10.heightBox,
                      const Divider(
                        thickness: 0.5,
                        color: titlecolor,
                        endIndent: 20,
                        indent: 20,
                      ),
                      35.heightBox,
                      ListView(
                        padding: const EdgeInsets.all(10),
                        shrinkWrap: true,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: listcolor,
                            ),
                            alignment: Alignment.center,
                            child: ListTile(
                              leading: const Icon(
                                Icons.person,
                                color: Color.fromARGB(255, 2, 91, 154),
                                size: 30,
                              ),
                              title: const Text('Personal Information'),
                              trailing: IconButton(
                                  onPressed: () => context.go('/demopage'),
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: titlecolor,
                                  )),
                            ),
                          ),
                          5.heightBox,
                          Container(
                            padding: const EdgeInsets.all(2),
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: listcolor,
                            ),
                            alignment: Alignment.center,
                            child: ListTile(
                              leading: const Icon(
                                FontAwesomeIcons.bookOpen,
                                color: Color.fromARGB(255, 2, 91, 154),
                                size: 40,
                              ),
                              title: const Text(
                                'Book and Notes',
                                style: TextStyle(color: titlecolor),
                              ),
                              trailing: IconButton(
                                  onPressed: () => context.go('/demopage'),
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: titlecolor,
                                  )),
                            ),
                          ),
                          5.heightBox,
                          Container(
                            padding: const EdgeInsets.all(2),
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: listcolor,
                            ),
                            alignment: Alignment.center,
                            child: ListTile(
                              leading: const Icon(
                                Icons.assessment,
                                color: Color.fromARGB(255, 2, 91, 154),
                                size: 40,
                              ),
                              title: const Text('Grade'),
                              trailing: IconButton(
                                  onPressed: () => context.go('/demopage'),
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: titlecolor,
                                  )),
                            ),
                          ),
                          5.heightBox,
                          Container(
                            padding: const EdgeInsets.all(2),
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: listcolor,
                            ),
                            alignment: Alignment.center,
                            child: ListTile(
                              leading: const Icon(
                                Icons.settings,
                                color: Color.fromARGB(255, 2, 91, 154),
                                size: 40,
                              ),
                              title: const Text('Setting & Privacy'),
                              trailing: IconButton(
                                  onPressed: () => context.go('/demopage'),
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: titlecolor,
                                  )),
                            ),
                          ),
                          5.heightBox,
                          Container(
                            height: 70,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: listcolor,
                            ),
                            alignment: Alignment.center,
                            child: ListTile(
                              leading: const Icon(
                                FontAwesomeIcons.arrowRightFromBracket,
                                color: Color.fromARGB(255, 2, 91, 154),
                                size: 40,
                              ),
                              title: const Text('Logout'),
                              trailing: IconButton(
                                  onPressed: () {
                                    UserStorage.logout();
                                    context.go('/login');
                                  },
                                  autofocus: true,
                                  icon: const Icon(
                                    Icons.navigate_next,
                                    color: titlecolor,
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        );
        // if (snapshot.data != null) {}
        // bool status = snapshot.data;
        // if (status) return const Home();
        // return const Login();
      },
    );
  }
}
