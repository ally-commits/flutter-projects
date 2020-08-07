import 'package:fisho/models/user_model.dart';
import 'package:fisho/providers/auth_provider.dart';
import 'package:fisho/screens/auth_screen/otp_screen.dart';
import 'package:fisho/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget { 
  final Function func;
  LoginScreen({Key key, @required this.func}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final textFieldValueHolder = TextEditingController();
  String pNumber = '+91 ';
  getTextInputData() {
    setState(() {
      pNumber = textFieldValueHolder.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>  (
      builder: (context, auth, child) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView(
                children: <Widget>[
                  Container (
                    margin: EdgeInsets.only(bottom: 20),
                    height: MediaQuery.of(context).size.height * 0.30,
                    color: Const.primaryColor.withOpacity(0.2),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width:MediaQuery.of(context).size.width * 0.90, 
                        child: Text(
                          "Phone Number",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                            fontSize: 18
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5), 
                        width:MediaQuery.of(context).size.width * 0.90, 
                        height: 60, 
                        child: Center(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: textFieldValueHolder,
                            decoration: InputDecoration(
                              // border: InputBorder, 
                            ),
                            autocorrect: false,
                            onChanged: (value) => {
                              setState(() {
                                pNumber = value;  
                              })
                            },
                            maxLength: 10,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                            autofocus: true,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.func();
                        },
                        child: Container(
                          height: 60,
                          margin: EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                            color: Const.primaryColor,
                            borderRadius: BorderRadius.circular(4)
                          ),
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold
                              ),
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
    );
  }
}