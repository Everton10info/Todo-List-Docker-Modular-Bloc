import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../shared/core/http_client/app_http_client_dio.dart';
import '../models/todo_model.dart';

class HomeRepository {
  final HttpClient _httpClient;

  HomeRepository(this._httpClient);

  Future<List<TodoModel>> getData() async {
    Response response = await _httpClient.getHttp();
    final result = (response.data as List)
        .map((todo) => TodoModel.fromJson(todo))
        .toList();
    return result;
  }

  Future insertData(String name, bool check) async {
    var response = await _httpClient.posttHttp(name, check);
    debugPrint('post dio + ${response.data}');
    return response.data;
  }

  Future deleteData(String id) async {
    var response = await _httpClient.deleteHttp(id);
    return response.data;
  }

  Future updateData(String id, String name, bool check) async {
    Map<String, dynamic> data = {"id": id, "name": name, "completed": check};

    var response = await _httpClient.updateHttp(id, data);
    return response.data;
  }
}
