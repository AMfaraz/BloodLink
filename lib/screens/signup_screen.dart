import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/input_fields.dart';
import '../utils/colors.dart';
import './login_screen.dart';
import '../resources/auth_methods.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  bool isloading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        backgroundColor: Colors.white24,
        title: const Text("Signup"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/logo/blood.svg",
                height: 250,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: primaryColor,
                    border: Border.all(
                      width: 1,
                    )),
                margin: EdgeInsets.symmetric(
                    horizontal: (MediaQuery.of(context).size.width * 0.15)),
                // width: MediaQuery.of(context).size.width*0.75,
                // height: MediaQuery.of(context).size.width*0.75,
                padding: const EdgeInsets.only(
                    top: 15, bottom: 15, right: 5, left: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  //adding textfields
                  children: <Widget>[
                    TextInput(
                        inputController: usernameController,
                        fieldName: "Username",
                        fieldType: TextInputType.name),
                    const SizedBox(
                      height: 25,
                    ),
                    TextInput(
                        inputController: emailController,
                        fieldName: "Email",
                        fieldType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 25,
                    ),
                    TextInput(
                      inputController: passwordController,
                      fieldName: "Password",
                      fieldType: TextInputType.text,
                      isPass: true,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final String res = await AuthMethods().signUp(
                            email: emailController.text,
                            password: passwordController.text,
                            username: usernameController.text);
                        setState(() {
                          isloading = true;
                        });
                        print(res);
                        setState(() {
                          isloading = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: (isloading == true)
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                    text: "Already Have an Account? ",
                    style:
                        const TextStyle(fontSize: 15, color: Colors.redAccent),
                    children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            navigateToLogin(context);
                          },
                        text: "Login",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

}
