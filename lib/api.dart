
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';

class Network{
  final String lnk = 'http://192.168.1.2:8000';
  // 192.168.1.8:8000 is my IP, change with your IP address
  var token;

  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!)['token'];
  }

  post(data, apiURL) async{
    print("POST");
    var fullUrl = lnk+'/api' + apiURL;
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }
  upload(data, File imageFile, apiURL) async{
    print("UPLOAD");
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    var fullUrl = lnk+'/api' + apiURL;
    var req = http.MultipartRequest('POST', Uri.parse(fullUrl))
      ..fields.addAll(data)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile!.path));
    return await req.send();
  }


  editData(data, apiURL) async{
    print("AUTH");
    var fullUrl = lnk+'/api' + apiURL;
    return await http.put(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  deleteData(apiURL) async{
    var fullUrl = lnk+'/api' + apiURL;
    await _getToken();
    return await http.delete(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
  }

  getData(apiURL) async{
    var fullUrl = lnk+'/api' + apiURL;
    await _getToken();
    print("GET DATA");
    var data = await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
    print(data.body);
    return data;
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };
}