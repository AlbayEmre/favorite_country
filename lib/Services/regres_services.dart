import 'dart:io';

import 'package:dio/dio.dart';
import 'package:favorite_country/Model/Model.dart';

abstract class IRegrsService {
  Dio dio;
  IRegrsService(this.dio);

  Future<List<Ulke>?> fetchResourceItems();
}

class RequestService extends IRegrsService {
  RequestService(super.dio);

  @override
  Future<List<Ulke>?> fetchResourceItems() async {
    final response = await dio.get("/v3.1/all?fields=name,flags,cca2,capital,languages,region,population");
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;

      if (jsonBody is List) {
        return jsonBody.map((e) => Ulke.fromJson(e)).toList();
      }
    }
    return null;
  }
}
