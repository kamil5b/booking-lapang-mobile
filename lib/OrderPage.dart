import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:convert';

import 'HomePage.dart';
import 'LoginPage.dart';
import 'api.dart';
import 'models/Lapang.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key, required this.user, required this.lapangan}) : super(key: key);
  final user;
  final Lapang lapangan;
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  late DateTime datePicked;
  late TimeOfDay timePicked;
  late TextEditingController timeController;
  late TextEditingController nameAddressController;
  late TextEditingController imageController;
  late TextEditingController dateController;
  late TextEditingController durasiController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  late int durasi;
  final _unfocusNode = FocusNode();
  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);
    setState(() {
      image = img;
      imageController.text = img!.name;
    });
  }
  @override
  void initState() {
    super.initState();
    nameAddressController = TextEditingController();
    durasiController = TextEditingController();
    imageController = TextEditingController();
    datePicked = DateTime.now();
    imageController.text = "Tap to upload KTM";
    nameAddressController.text = '${widget.user['name']}';
    timeController = TextEditingController();
    dateController = TextEditingController();
    timeController.text = "--:--";
    dateController.text = "Tanggal";
    timePicked = TimeOfDay.now();
  }
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
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
                    'Booking ${widget.lapangan.name}',
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Color(0xFF06981D),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
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
                            readOnly:true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Nama Pembooking',
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

                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                            controller: dateController,
                            autofocus: true,
                            readOnly:true,
                            obscureText: false,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              contentPadding:
                              EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                            ),
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                onConfirm: (date) {
                                  datePicked = date;
                                  setState(() {
                                    dateController.text = "${date.day}/${date.month}/${date.year}";
                                  });
                                }, currentTime: DateTime.now(), locale: LocaleType.id);
                          }
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: timeController,
                          autofocus: true,
                          readOnly:true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Waktu',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),

                          ),
                            onTap:() async {
                              TimeOfDay? pickedTime =  await showTimePicker(
                                initialTime: TimeOfDay.now(),
                                context: context,
                                initialEntryMode: TimePickerEntryMode.input,
                              );

                              if(pickedTime != null ){//output 10:51 PM
                                DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                //converting to DateTime so that we can further format on different pattern.

                                String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

                                //DateFormat() is from intl package, you can format the time on any pattern you need.

                                setState(() {
                                  timeController.text = formattedTime;
                                  timePicked = pickedTime;
                                });
                              }
                          }
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: durasiController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Durasi',
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
                            validator: (d){
                              if(d!.isEmpty){
                                return 'Please input Durasi';
                              }
                              durasi = int.parse(d) ;
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
                            controller: imageController,
                            autofocus: true,
                            readOnly:true,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'KTM',
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              filled: true,
                              contentPadding:
                              EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),

                            ),
                            onTap:() async {
                                myAlert();
                            },

                        ),
                      ),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        image!=null ?
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                                File(image!.path),
                                height: 300,
                                fit: BoxFit.cover
                            )
                          //Image.network(
                          //  'https://picsum.photos/seed/790/600',
                          //  width: 300,
                          //  height: 200,
                          //  fit: BoxFit.cover,
                          //),
                        )
                        : Text("Please input your KTM"),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child:Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print("TEST");
                              _order();
                            }
                          },
                          child: Text('Order'),
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
                    )),
                  ],
                ))
              )
            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      )
    );
  }

  void _order() async {
    Map<String,String> data = {
      'orang_id' : widget.user['id'].toString(),
      'lapang_id' : widget.lapangan.id.toString(),
      'tanggal': datePicked.toString(),
      'waktu' : '${timePicked.hour}:${timePicked.minute}',
      'durasi': durasi.toString()
    };

    var res = await Network().upload(data, File(image!.path),'/order');
    print(res.statusCode);
    if(res.statusCode == 200) {
      print("SUCCESS");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }else{
      print("WAT DE FAK");
    }

  }
}
