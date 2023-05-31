import 'package:booking_lapang_mobile/JadwalkuWidget.dart';
import 'package:booking_lapang_mobile/LapangWidget.dart';
import 'package:booking_lapang_mobile/LoginPage.dart';
import 'package:booking_lapang_mobile/ProfileWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  late TabController _tabController;

  String name="Nama";
  int user_id=-1;
  var User=null;
  @override
  void initState() {
    super.initState();
    _loadUserData();
    _tabController = new TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }
  _loadUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = jsonDecode(localStorage.getString('user')!);

    if(user != null) {
      setState(() {
        name = user['name'];
        user_id = user['id'];
        User = user;
      });
    }else{
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => LoginPage()
        ),
      );
    }
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    if(index==0){
      _tabController.animateTo(0);
    }
    if(index==1){
      _tabController.animateTo(1);
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFECFF17),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 30, 15),
                    child: Text(
                      '$name',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child:
                _selectedIndex < 2 ?
                DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment(0, 0),
                        child: TabBar(
                          labelColor: Colors.black87,
                          unselectedLabelColor: Colors.grey,
                          labelStyle: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 18,
                          ),
                          indicatorColor: Colors.black87,
                          controller: _tabController,
                          tabs: [
                            Tab(
                              text: 'List Lapangan',
                            ),
                            Tab(
                              text: 'JadwalKu',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            LapangPageWidget(user: User),
                            JadwalkuWidget(user_id: user_id),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                : ProfileWidget(user: User),
              ),
            ],
          ),
        ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xFF6F1DD8),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Lapangan',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Jadwalku',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
          )
      ),
    );
  }
}
