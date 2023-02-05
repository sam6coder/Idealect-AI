import 'dart:developer';
import 'package:food_allergens/resources/authentication_methods.dart';
import 'package:food_allergens/screens/sign_in_screen.dart';
import 'package:food_allergens/utils/color_themes.dart';
import 'package:food_allergens/utils/constants.dart';
import 'package:food_allergens/utils/utils.dart';
import 'package:food_allergens/widgets/custom_main_button.dart';
import 'package:food_allergens/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SizedBox(
                    height: screenSize.height * 0.85,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.85,
                        width: screenSize.width * 0.9,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sign-Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,color: Colors.white,fontSize: 25.0),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),

                            Text(
                              'Name',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),


                            TextFieldWidget(
                              title: "Name",
                              controller: nameController,
                              obscureText: false,
                              hintText: "Enter your name",
                            ),
                            SizedBox(
                              height: 15.0,
                            ),

                            Text(
                              'Address',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                            TextFieldWidget(
                              title: "Address",
                              controller: addressController,
                              obscureText: false,
                              hintText: "Enter your address",
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'E-Mail',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                            TextFieldWidget(
                              title: "Email",
                              controller: emailController,
                              obscureText: false,
                              hintText: "Enter your email",
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                            TextFieldWidget(
                              title: "Password",
                              controller: passwordController,
                              obscureText: true,
                              hintText: "Enter your password",
                            ),
                            SizedBox(
                              height: 10.0,
                            ),

                            Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: CustomMainButton(
                                    child: const Text(
                                      "Sign In",
                                      style: TextStyle(
                                          letterSpacing: 0.4, color: Colors.black),
                                    ),
                                    color: Color(0xFF5CD87F),
                                    isLoading: isLoading,
                                    onPressed: () async {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      String output =
                                          await authenticationMethods.signUpUser(
                                              name: nameController.text,
                                              address: addressController.text,
                                              email: emailController.text,
                                              password: passwordController.text);
                                      setState(() {
                                        isLoading = false;
                                      });
                                      if (output == "success") {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const SignInScreen()));
                                      } else {
                                        //error
                                        Utils().showSnackBar(
                                            context: context, content: output);
                                      }
                                    },
                                  ),
                                ),
                  SizedBox(
                    height: 10.0,
                  ),




                  CustomMainButton(
                      child: const Text(
                        "Back",
                        style: TextStyle(
                          letterSpacing: 0.6,
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.grey,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignInScreen();
                        }));
                      }),
                        ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
