

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:path/path.dart';

class Api{

    String _url = "http://192.168.0.126:5000";

    uploadFile(image) async {

      Dio dio = new Dio();

      FormData formdata = new FormData(); // just like JS

      formdata.add("image", new UploadFileInfo(image, "gabarito.png"));

      var result = await dio.post(_url+"/upload",
          data: formdata,
          options: Options(
            method: 'POST',
            responseType: ResponseType.json, // or ResponseType.JSON
            headers: {
              'Content-Type': 'multipart/form-dataitem',
            },
          ),
      );

      print("Resultado: ${result}");
      return result;

    }

}