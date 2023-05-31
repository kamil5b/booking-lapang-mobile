//-6.96908130780144, 107.62842811164019

import 'package:booking_lapang_mobile/OrderPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models/Lapang.dart';

class MapLapang extends StatefulWidget {
  const MapLapang({Key? key, required this.user, required this.lapangan}) : super(key: key);
  final Lapang lapangan;
  final user;
  @override
  State<MapLapang> createState() => _MapLapangState();
}
class _MapLapangState extends State<MapLapang> {

  late GoogleMapController mapController;
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFECFF17),
      appBar: AppBar(
          backgroundColor: Color(0xFFECFF17),
          automaticallyImplyLeading: false,
          leading: IconButton(
            color: Colors.black87,
            icon: Icon(
              Icons.arrow_back_rounded,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          elevation: 0,
          title: Text(
              'Map ${widget.lapangan.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)
          )
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              /*
              Container(
                width: MediaQuery.of(context).size.width,
                height: 152,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Color(0xFF0F1113),
                                size: 24,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                            child: Text(
                              'Back',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFF0F1113),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                              child: Text(
                                'Hotel Review',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                child: Icon(
                                  Icons.search_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 24,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 0),
                                  child: TextFormField(
                                    controller: textController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'Search  here...',
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF95A1AC),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.95, 0),
                                  child: Icon(
                                    Icons.tune_rounded,
                                    color: Color(0xFF95A1AC),
                                    size: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),*/
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                  child: Padding(
                      padding: EdgeInsets.only(bottom: 50.0),
                      child :GoogleMap(
                        zoomGesturesEnabled: true,
                        initialCameraPosition: CameraPosition(target: LatLng(widget.lapangan.lat, widget.lapangan.lng),zoom:15.0),
                        markers: {
                          Marker(
                            markerId: const MarkerId("tempat"),
                            position: LatLng(widget.lapangan.lat, widget.lapangan.lng),
                          )
                        },
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
*
GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(widget.lapangan.lat, widget.lapangan.lng),
                      zoom: 14,
                    ),
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: true,
                    compassEnabled: true,
                    markers: {
                      Marker(
                        markerId: const MarkerId("tempat"),
                        position: LatLng(widget.lapangan.lat, widget.lapangan.lng),
                      )
                    },
                  ),
* */