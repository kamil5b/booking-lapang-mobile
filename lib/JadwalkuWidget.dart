
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/Order.dart';
class JadwalkuWidget extends StatefulWidget {
  const JadwalkuWidget({Key? key, required this.user_id}) : super(key: key);
  final int user_id;
  @override
  _JadwalkuWidgetState createState() => _JadwalkuWidgetState();
}

class _JadwalkuWidgetState extends State<JadwalkuWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Future<List<Order>> _orders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orders = JadwalKu(widget.user_id);
    print("_orders");
    print(_orders.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
        future: _orders,
        builder:(context, AsyncSnapshot snapshot)
      {

        print(snapshot.hasData);
      if (!snapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      } else {
        return Center(child:DataTable(
          dataRowColor: MaterialStateProperty.all(Color(0xFFECFF17)),
          headingRowColor: MaterialStateProperty.all(Color(0xFFECFF17)),
          columnSpacing: 38.0,
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Tanggal')),
            DataColumn(label: Text('Waktu')),
            DataColumn(label: Text('Durasi')),
            DataColumn(label: Text('Delete'))
          ],
          rows: List.generate(snapshot.data.length, (index) {
            final y = snapshot.data[index].id;
            final tahun = snapshot.data[index].tanggal.year;
            final bulan = snapshot.data[index].tanggal.month;
            final tanggal = snapshot.data[index].tanggal.day;
            final z = snapshot.data[index].waktu.substring(0,5);
            final w = snapshot.data[index].durasi;

            return DataRow(cells: [
              DataCell(Container(child: Text('$y'))),
              DataCell(Container(child: Text('$tanggal/$bulan/$tahun'))),
              DataCell(Container(child: Text('$z'))),
              DataCell(Container(child: Text('$w'))),
              DataCell(Container(child: IconButton(
                icon: FaIcon(
                  FontAwesomeIcons.trashAlt,
                  size: 24,
                ),
                onPressed: () {
                  deleteJadwal(y);
                  setState((){ _orders = JadwalKu(widget.user_id);});
                },
              )))
            ]);
          }),
        ));
      }
    }),
    );
  }
}
/*
Padding(
            padding:
            EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
              Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment:
              MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'No',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Tanggal',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Waktu',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Durasi',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Action',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ), //Header Row
            Divider(
              thickness: 1,
              color: Color(0x90000000),
            ),
            FutureBuilder(
            future: _orders,
            builder:(context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListView.builder(
                itemCount: snapshot.data.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,
                      children: [
                          Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${snapshot.data[index].id}',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                          Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${snapshot.data[index].tanggal}',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                          Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${snapshot.data[index].waktu}',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                          Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '${snapshot.data[index].durasi}',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                          Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.trashAlt,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ],
                        ),
                          ]
                        );
                      }
                    );
                  }
                }
              )
            ]
          )
        )
*
* */