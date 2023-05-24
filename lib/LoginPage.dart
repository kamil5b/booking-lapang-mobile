import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'HomePage.dart';
import 'RegisterPage.dart';
import 'api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late String email,password;
  final _unfocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        backgroundColor: Color(0xFFECFF17),
        body: SingleChildScrollView(
          child: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Booking Lapang!',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF06981D),
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                        'assets/images/locate1.png',
                        height: 300,
                        fit: BoxFit.cover
                    )
                    //Image.network(
                    //  'https://picsum.photos/seed/790/600',
                    //  width: 300,
                    //  height: 200,
                    //  fit: BoxFit.cover,
                    //),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                child: Form(
                    key: formKey,
                    child:Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: emailAddressController,
                          autofocus: true,
                          autofillHints: [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (eMail){
                            if(eMail!.isEmpty){
                              return 'Please enter your Phone number';
                            }
                            email = eMail;
                            return null;
                          }
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: passwordController,
                          autofillHints: [AutofillHints.password],
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                    () => passwordVisibility =
                                !passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 24,
                              ),
                            ),
                          ),
                          validator: (pass){
                            if(pass!.isEmpty){
                              return 'Please enter your Password';
                            }
                            password = pass;
                            return null;
                          },
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              _login();
                            }
                          },
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(230,52),
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            primary: Color(0xFF6F1DD8),
                            textStyle: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFECFF17),
                            ),
                            elevation: 3,
                            side: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: ElevatedButton(
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text('Daftar'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(145,44),
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            primary: Color(0xFF6F1DD8),
                            textStyle: TextStyle(
                              fontFamily: 'Readex Pro',
                              color: Color(0xFFECFF17),
                            ),
                            elevation: 0,
                            side: BorderSide(
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                )
              )
            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }

  void _login() async{
    var data = {
      'email' : email,
      'password' : password
    };
    print("ENTRY");
    var res = await Network().post(data, '/login');
    var body = jsonDecode(res.body);
    print("MARKICOB");
    if(body['success']){
      print("SUCCESS");
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => HomePage()
        ),
      );
    }else{
      print("ADA YANG SALAH");
    }
  }
}
