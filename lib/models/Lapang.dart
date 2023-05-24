

import 'dart:convert';

import '../api.dart';

class Lapang {
  int id;
  String name;
  String category;
  double lat;
  double lng;

  Lapang(
      this.id,
      this.name,
      this.category,
      this.lat,
      this.lng,
      );

}
Future<List<Lapang>> getAllLapang() async{
  var res = await Network().getData('/lapang');
  var body = jsonDecode(res.body);
  List<Lapang> lapang = [];
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
              data['lng']
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