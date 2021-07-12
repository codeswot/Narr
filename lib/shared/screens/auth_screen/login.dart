import 'package:flutter/material.dart';
import 'package:narr/core/services/service_injector/service_injectors.dart';
import 'package:narr/shared/globals/global_var.dart';
import 'package:narr/shared/screens/dashboard.dart';
import 'package:narr/shared/widgets/buttons/primary_raised_button.dart';
import 'package:narr/shared/widgets/cards/form_card.dart';
import 'package:narr/shared/widgets/forms/auth_textfield.dart';

class Login extends StatefulWidget {
  static String id = 'login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    narrService.socketService.connectToSocketServer();
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff00a368),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FormCard(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 15),
                        Image.asset(
                          'assets/images/png/logo-narr.png',
                          width: 200,
                        ),
                        SizedBox(height: 15),
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Color(0xff00a368),
                          ),
                        ),
                        SizedBox(height: 15),
                        AuthTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Email is required';
                            } else if (!value.contains('@')) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          hint: 'Email',
                          prefixIcon: Icon(Icons.email),
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        AuthTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 6) {
                              return 'Password less than 6 characters';
                            }
                            return null;
                          },
                          hint: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: Icon(Icons.visibility),
                          ),
                          isObsecure: _obscureText,
                          controller: password,
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.of(context)
                              //     .pushNamed(ForgotPassword.id);
                            },
                            child: Text(
                              'forgot Password ? ',
                              style: TextStyle(
                                color: Colors.grey[500],
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        PrimaryRaisedButton(
                          onTap: (startLoading, stopLoading, btnState) {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              startLoading();
                              narrService.authService
                                  .login(
                                      email: email.text,
                                      password: password.text)
                                  .then((user) {
                                stopLoading();
                                currentUser = user; //For now
                                narrService.socketService
                                    .handleLoginEvent(
                                        token: user.token, user: user.user)
                                    .then((value) {
                                  narrService.routerService.popUntil(
                                    context,
                                    Dashboard(),
                                  );
                                });
                                // if (user.user.userRole == 'student') {
                                //for debug sake ParentApp(); => StudentApp();

                                // } else {
                                //   si.routerService
                                //       .popUntil(context, ParentApp());
                                // }
                              });
                            }
                          },
                          buttonTitle: 'Login',
                        ),
                        SizedBox(height: 30.0),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushReplacementNamed(Register.id);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('New researcher? '),
                                  SizedBox(width: 5),
                                  Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Color(0xff00a368),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        GestureDetector(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushReplacementNamed(RegisterOrg.id);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('New Organisation? '),
                                  SizedBox(width: 5),
                                  Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Color(0xff00a368),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}