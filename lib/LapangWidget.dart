
import 'package:booking_lapang_mobile/DetailLapang.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/Lapang.dart';
class LapangPageWidget extends StatefulWidget {
  const LapangPageWidget({Key? key, required this.user}) : super(key: key);
  final user;
  @override
  _LapangPageWidgetState createState() => _LapangPageWidgetState();
}

class _LapangPageWidgetState extends State<LapangPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Lapang>> _lapangs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lapangs = getAllLapang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFECFF17),
        resizeToAvoidBottomInset: false, // set it to false
        body:  FutureBuilder(
            future: _lapangs,
            builder:(context, AsyncSnapshot snapshot) {
              print(snapshot.hasData);
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0, 5, 0, 5),
                            child: InkWell(
                              onTap: () async {

                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailLapang(
                                        user: widget.user,
                                        lapangan: snapshot.data[index],
                                    ),
                                  ),
                                );
                              },
                              child:
                                Material(
                                  color: Colors.transparent,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(15),
                                  ),
                                  child: Container(
                                    width: 320,
                                    height: 85,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  8),
                                              child: Image.network(
                                                'https://picsum.photos/seed/493/600',
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${snapshot.data[index].name}',
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontFamily:
                                                'Readex Pro',
                                                fontSize: 16,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              'Lapangan ${snapshot.data[index].category}',
                                              textAlign: TextAlign.start,
                                              //style: FlutterFlowTheme.of(
                                              //    context)
                                              //    .bodyMedium,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.angleRight,
                                              color: Colors.grey,
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                            ),
                          );
                        }
                    )
                );
              }
            }
        )
    );
  }
}
/*
 Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                              child:
                              InkWell(
                                onTap: () async {

                                },
                                child:Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: const Color(0xFF088454),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child:
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Text(
                                      '${snapshot.data[index].kode_lapang}',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )

                          );

* */