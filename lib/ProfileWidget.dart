import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'HomePage.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';
import 'api.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key, required this.user}) : super(key: key);
  final user;
  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  @override
  void initState() {
    super.initState();
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Profile',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        color: Color(0xFF06981D),
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),

                Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                    child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Container(
                                width: double.infinity,
                                child: Text("ID : ${widget.user['id']}",
                                    style:TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Container(
                                width: double.infinity,
                                child: Text("Nama : ${widget.user['name']}",
                                    style:TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Container(
                                width: double.infinity,
                                child: Text("NIM : ${widget.user['nim']}",
                                    style:TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )),

                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                              child: Container(
                                width: double.infinity,
                                child: Text("Email : ${widget.user['email']}",
                                  style:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs?.clear();
                                    Navigator.pushReplacement(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => LoginPage()
                                      ),
                                    );
                                  },
                                  child: Text('Logout'),
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
                          ],
                        )
                    )
              ],
            ),
          ),// This trailing comma makes auto-formatting nicer for build methods.
        )
    );
  }

}
