// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_linkedin/screen/home.dart';

import '../../other/fixeds.dart';
import '../../other/size.dart';
import '../forget_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  set state(state) {}

  @override

  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passworController = TextEditingController();
  bool remember = false;

  Future signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passworController.text.trim(),
          )
          .then((value) => {
                const MobileScreen(),
                emailController.clear(),
                passworController.clear(),
              });
    } on FirebaseAuthException catch (e) {
      print("Error to login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        // width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/Logo.png",
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      "Join now",
                      style: TextStyle(color: kPrimaryColor, fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passworController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: remember,
                          activeColor: Colors.green[900],
                          onChanged: (value) {
                            setState(() {
                              remember = value!;
                            });
                          },
                        ),
                        Text(
                          "Remember me.",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[800]),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Learn more",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const ForgetPassword(),
                          )),
                      child: const Text(
                        "Forget Password?",
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(55),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: const BorderSide(
                                          color: kPrimaryColor)))),
                      onPressed: () => signIn,
                      //   Navigator.of(context).push(MaterialPageRoute(
                      // builder: (BuildContext context) => const MobileScreen(),
                      // )),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 0.3,
                        width: 100,
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.black),
                        ),
                      ),
                      const Text('OR'),
                      SizedBox(
                        height: 0.3,
                        width: 100,
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: getProportionateScreenHeight(55),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side: const BorderSide(
                                          color: kPrimaryColor)))),
                      onPressed: () {},
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: 60,
                          ),
                          Image.asset(
                            "assets/icons-google.png",
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sign in with Google",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
