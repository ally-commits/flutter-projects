import 'package:fisho/models/user_model.dart';
import 'package:fisho/providers/auth_provider.dart';
import 'package:fisho/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'package:provider/provider.dart';

class OptScreen extends StatefulWidget {
  final Function func;
  OptScreen({Key key, @required this.func}) : super(key: key);

  @override
  _OptScreenState createState() => _OptScreenState();
}

class _OptScreenState extends State<OptScreen> {
  static User user;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>  (
      builder: (context, auth, child) {
        return Scaffold( 
          body: SafeArea(
            child: ListView(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    widget.func();
                  },
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 50),
                  child: Center(
                    child: Text(
                      "Enter OTP Value",
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                ),
                PinEntryTextField(
                  onSubmit: (String pin){
                    // auth.login();
                  },
                ),
                GestureDetector(
                  onTap: () {
                    auth.login();
                  },
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.90,
                        margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          color: Const.primaryColor,
                          borderRadius: BorderRadius.circular(4)
                        ), 
                        child: Center(
                          child: Text(
                            "Verify OTP",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}