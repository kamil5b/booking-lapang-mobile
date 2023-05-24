

import 'dart:convert';
import 'package:intl/intl.dart';
import '../api.dart';

class Order {
  int id;
  DateTime tanggal;
  String waktu;
  int durasi;
  int lapang_id;

  Order(
      this.id,
      this.tanggal,
      this.waktu,
      this.durasi,
      this.lapang_id
      );

}

void deleteJadwal(int id) async{
  var res = await Network().getData('/order/delete/$id');
  var body = jsonDecode(res.body);
  if(body['success']){
    print("success delete");
  }
}

Future<List<Order>> JadwalKu(int id) async{
  var res = await Network().getData('/order/$id');
  var body = jsonDecode(res.body);
  List<Order> order = [];
  if(body['success']){
    var datas = body['data'];
    print("SUCCESS");
    //print(datas.length);
    //datas.forEach( (data) => print((data)));
    for(var i=0;i<datas.length;i++){
      print(i);
      print(datas[i]['id'].runtimeType);
      print(DateTime.parse(datas[i]['tanggal']).runtimeType);
      print(datas[i]['waktu'].runtimeType);
      print(datas[i]['durasi'].runtimeType);
      print(datas[i]['lapang_id'].runtimeType);
      print(i);
      var o = Order(
          datas[i]['id'],
          DateTime.parse(datas[i]['tanggal']),
          datas[i]['waktu'],
          datas[i]['durasi'],
          datas[i]['lapang_id']
      );
      print(datas[i]);
      order.add(o);
    }
    /*
    datas.forEach( (data) => print(data['tanggal']));
    datas.forEach( (data) =>
        order.add(
        Order(
        data['id'],
        DateTime.parse(data['tanggal']),
            DateTime.parse(data['waktu']),
        data['durasi'],
        data['lapang_id']
    )
  )
    );*/
    print("COBA");
    print("===");
    print(order[0].id);
    print("===");
  }
  return order;
}