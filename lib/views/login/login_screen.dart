import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_manufacturing_platform/controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userNameController =
      TextEditingController(text: '28022');
  final TextEditingController passwordController =
      TextEditingController(text: 'Prakash1!');
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.all(18)),
            Stack(
              children: [
                const Image(image: AssetImage('assets/images/banner.png')),
                Positioned(
                    top: 100,
                    left: 60,
                    right: 40,
                    bottom: 10,
                    child: buildText()),
              ],
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: const EdgeInsets.all(40),
              color: Colors.black,
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Username",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.all(6),
                        child: TextFormField(
                          enabled: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: userNameController,
                          obscureText: false,
                          cursorColor: const Color.fromARGB(255, 178, 215, 245),
                          decoration: const InputDecoration(
                            hintText: "please enter a valid Employee Id",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Container(
                        height: 50,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        padding: const EdgeInsets.all(6),
                        margin: const EdgeInsets.all(6),
                        child: TextFormField(
                          enabled: true,
                          controller: passwordController,
                          obscureText: isHidden,
                          cursorColor: const Color.fromARGB(255, 178, 215, 245),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return 'Please enter Password';
                            }

                            String pattern = r'^.{6,}$';
                            RegExp regex = RegExp(pattern);
                            if (!regex.hasMatch(password)) {
                              return 'Password must be atleast 6 characters';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Password must be atleast 6 characters",
                              border: InputBorder.none,
                              suffix: IconButton(
                                  onPressed: togglePassword,
                                  icon: Icon(isHidden
                                      ? Icons.visibility_off
                                      : Icons.visibility))),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {},
                              child: const Text(
                                " Forrgot Password",
                                style: TextStyle(color: Colors.white),
                              )),
                          ElevatedButton(
                              onPressed: () {
                                provider.appLogin(
                                    context,
                                    userNameController.text,
                                    passwordController.text);
                              },
                              child: const Text("Login"),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              )))),
                        ],
                      )
                    ],
                  )),
            ),
            const SizedBox(
                width: 200,
                child: Image(image: AssetImage("assets/images/TE.png"))),
            const SizedBox(
              height: 30,
            ),
            const Text(" ©  2021 Tata elxsi  |  Terms Policy"),
            // const SizedBox(
            //   height: 20,
            // ),
            // Center(
            //   child: Container(
            //     width: 100,
            //     height: 5,
            //     decoration: const BoxDecoration(
            //         color: Colors.black,
            //         borderRadius: BorderRadius.all(Radius.circular(10))),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  void togglePassword() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  Widget buildText() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            "Industrial Smart Tracking system",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
          Text(
            "Tether smart manufacturing solution",
            style: TextStyle(color: Colors.white),
          ),
        ],
      );
}
