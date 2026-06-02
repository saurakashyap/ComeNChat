import 'package:chat_app/helper/helperfunctions.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/views/chatRoomScreen.dart';
import 'package:chat_app/widgets/widget.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggle;

  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;

  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  final formKey = GlobalKey<FormState>();

  TextEditingController userNameTextEditingController =
      new TextEditingController();

  TextEditingController emailTextEditingController =
      new TextEditingController();

  TextEditingController passwordTextEditingController =
      new TextEditingController();

  signMeUp() {
    if (formKey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "name": userNameTextEditingController.text,
        "email": emailTextEditingController.text
      };

      HelperFunctions.saveUserEmailSharedPreference(
          emailTextEditingController.text);

      HelperFunctions.saveUserEmailSharedPreference(
          userNameTextEditingController.text);

      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpWithEmailAndPassword(
              emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((val) {
        databaseMethods.uploadUserInfo(userInfoMap);

        HelperFunctions.saveUserLoggedInSharedPreference(true);

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ChatRoom()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMain(context),
      body: Container(
        alignment: Alignment.center,
        child: isLoading
            ? Container(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              return val.isEmpty || val.length < 2
                                  ? 'Enter a valid username'
                                  : null;
                            },
                            controller:
                                userNameTextEditingController,
                            style: TextStyle(),
                            decoration:
                                textFieldInputDecoration(
                                    'username'),
                          ),
                          TextFormField(
                            validator: (val) {
                              return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val)
                                  ? null
                                  : "Enter a valid email";
                            },
                            controller:
                                emailTextEditingController,
                            style: TextStyle(),
                            decoration:
                                textFieldInputDecoration(
                                    'email'),
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (val) {
                              return val.length > 6
                                  ? null
                                  : 'Please provide a password with more than six characters';
                            },
                            controller:
                                passwordTextEditingController,
                            decoration:
                                textFieldInputDecoration(
                                    'password'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      alignment: Alignment.centerRight,
                    ),
                    SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        signMeUp();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width:
                            MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF00695C),
                              const Color(0xFF00695C),
                            ],
                          ),
                          borderRadius:
                              BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Sign Up',
                          style: simpleTextStyle(),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have a account?",
                          style: mediumTextStyle(),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.toggle();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 8),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration:
                                    TextDecoration.underline,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
