

import 'dart:convert';

import '../api.dart';

class Lapang {
  int id;
  String name;
  String category;
  double lat;
  double lng;
  String pic;

  Lapang(
      this.id,
      this.name,
      this.category,
      this.lat,
      this.lng,
      this.pic
      );

}
Future<List<Lapang>> getAllLapang() async{
  var res = await Network().getData('/lapang');
  var body = jsonDecode(res.body);
  List<Lapang> lapang = [];
  var link = Network().lnk;
  if(body['success']){
    var datas = body['data'];
    print("SUCCESS");
    print(datas.length);
    datas.forEach( (data) =>
        lapang.add(
            Lapang(
              data['id'],
              data['name'],
              data['category'],
              data['lat'],
              data['lng'],
              data['pic'] != "" ? link+'/pic/'+data['pic'] : link+'/images/Rectangle%2026.png'
            )
        )
    );
    print("COBA");
    print("===");
    print(lapang[0].id);
    print("===");
  }
  return lapang;
}