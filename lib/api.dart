

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:path/path.dart';



class Api{

    String _url = "http://192.168.0.126:5000";

    Future<String> capturarGabarito() async {
    final response = await http.get('$_url/resultado');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON

      var dados = json.decode(response.body);

       print(response.body.toString());

    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

    uploadFile(image) async {

      Dio dio = new Dio();

      FormData formdata = new FormData(); // just like JS

      formdata.add("image", new UploadFileInfo(image, basename("gabarito.png")));

      dio.post(_url+"/upload",
          data: formdata,
          options: Options(
            method: 'POST',
            responseType: ResponseType.json, // or ResponseType.JSON
            headers: {
              'Content-Type': 'multipart/form-dataitem',
            },
          ),
      )
          .then((response) => print(response))
          .catchError((error) => print(error));

    }

}