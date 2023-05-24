import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'HomePage.dart';
import 'LoginPage.dart';
import 'api.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  late TextEditingController emailAddressController;
  late TextEditingController nameAddressController;
  late TextEditingController nimAddressController;
  late TextEditingController passwordController;
  late TextEditingController password2Controller;
  late bool passwordVisibility;
  late bool password2Visibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late String email,password,name,nim,password2;
  final _unfocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    nameAddressController = TextEditingController();
    nimAddressController = TextEditingController();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    password2Controller = TextEditingController();
    passwordVisibility = false;
    password2Visibility = false;
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
                            controller: nameAddressController,
                            autofocus: true,
                            autofillHints: [AutofillHints.name],
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Name',
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
                            validator: (eMail){
                              if(eMail!.isEmpty){
                                return 'Please enter your Name';
                              }
                              name = eMail;
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
                            controller: nimAddressController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'NIM',
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
                            keyboardType:TextInputType.number,
                            validator: (eMail){
                              if(eMail!.isEmpty){
                                return 'Please enter your NIM';
                              }
                              nim = eMail;
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
                              return 'Please enter your Email';
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: password2Controller,
                          autofillHints: [AutofillHints.password],
                          obscureText: !password2Visibility,
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
                                    () => password2Visibility =
                                    !password2Visibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                password2Visibility
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
                            password2 = pass;
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
                              _register();
                            }
                          },
                          child: Text('Daftar'),
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
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Text('Login'),
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
                ))
              )
            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }

  void _register() async{
    var data = {
      'name' : name,
      'nim' : nim,
      'email':email,
      'password' : password,
      'password2' : password2
    };
    print(data);
    print("REGSITERED");
    var res = await Network().post(data, '/register');
    var body = jsonDecode(res.body);
    print(res.body);
    if(body != null) {
      print(body['message']);
      if (body['success']) {
        print("SUCCESS");
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['token']));
        localStorage.setString('user', json.encode(body['user']));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    }

  }
}
