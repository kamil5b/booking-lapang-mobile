//-6.96908130780144, 107.62842811164019

import 'package:booking_lapang_mobile/OrderPage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'MapLapang.dart';
import 'models/Lapang.dart';

class DetailLapang extends StatefulWidget {
  const DetailLapang({Key? key, required this.user, required this.lapangan}) : super(key: key);
  final Lapang lapangan;
  final user;
  @override
  State<DetailLapang> createState() => _DetailLapangState();
}
class _DetailLapangState extends State<DetailLapang> {

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
            '${widget.lapangan.name}',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87)
        )
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
              ),
              // /*
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 15),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    widget.lapangan.pic,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                ),
              ),
              /*
              Flexible(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  child: Text(
                    'Lapang Futsal?',
                  ),
                ),
              ),*/
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapLapang(user: widget.user, lapangan: widget.lapangan),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Cek lokasi lapangan',
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderPage(user: widget.user, lapangan: widget.lapangan),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 3,
                          color: Color(0x33000000),
                          offset: Offset(0, 1),
                        )
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Pesan Sekarang!',
                          ),
                          Icon(
                            Icons.chevron_right_rounded,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              //*/
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