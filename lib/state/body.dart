import 'package:flutter/material.dart';
import 'package:my_linkedin/screen/sign/sign_in.dart';
import 'package:my_linkedin/screen/sign/sign_up.dart';
import '../other/fixeds.dart';
import '../other/size.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  late final String? text, image;
  List<Map<String, String>> splashData = [
    {"text": "Find and land your next job", "image": "assets/image1.jpg"},
    {"text": "build your network on the go", "image": "assets/image2.jpg"},
    {"text": "stay ahead with for your career", "image": "assets/image3.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                'assets/Logo.png',
              ),
            ),
            /* const Text(
              "HELLO   WORLED I AM LINKEDIN",
              style: TextStyle(
                color: Colors.green,
                fontSize: 30,
              ),
            ),*/
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image!"],
                  text: splashData[index]['text!'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    // Spacer(flex: 1),
                    const SizedBox(
                      height: 20,
                    ),

                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(55),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(kPrimaryColor),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: const BorderSide(
                                        color: kPrimaryColor)))),
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => SignUp(),
                        )),
                        child: Text(
                          "Join now",
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

                    SizedBox(
                      width: double.infinity,
                      height: getProportionateScreenHeight(55),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    side: const BorderSide(
                                        color: Colors.black)))),
                        onPressed: () {
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                width: 60,
                              ),
                              Image.asset(
                                "assets/icons-google.png",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Join with Google",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(18),
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        },
                        child: null,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),

                    GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => SignIn(),
                            )),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      width: currentPage == index ? 10 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.grey[800] : Colors.white,

        /* border: Border.all(
          color: currentPage == index ? Colors.grey[800] : Colors.black ,

        ),
        borderRadius: BorderRadius.circular(10),//Border.all*/
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SplashContent({String? image, String? text}) {}
}
