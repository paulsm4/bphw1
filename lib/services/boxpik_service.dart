// ignore_for_file: avoid_web_libraries_in_flutter, avoid_print, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:sync_http/sync_http.dart';
import 'package:http/http.dart' as http;
import '/globals.dart';

class BoxPikService {
  final String BASE_URL = "https://boxpik.com/boxpik-mvp/rc10/";
  final String BOXPIK_IMAGE_PATH = "https://boxpik.com/boxpik-mvp/uploads/avatar_images/";

  String lastError = "";
  bool isAuthorized = false;

  Future<void> _queryServer  (username, password) async {
    print("_queryServer()...");
    final uri = Uri.parse(BASE_URL + "user/login");
    final headers = {'Content-Type': 'application/json'};
     Map<String, dynamic> logonRequest = {
      "email": username,
      "password": password,
      "lat":"0.0",
      "lng":"0.0",
      "device_name": "Flutter-test",
      "device_udid": "111111"
    };
    String json = jsonEncode(logonRequest);
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: json);
    print("HTTP Status Code: $response.statusCode.toString()...");
    if (response.statusCode == 200) {
      print("HTTP Response Body: $response.body...");
      var body = jsonDecode(response.body);
      if (body['Status'] == 'fail') {
        lastError = body['message'];
        isAuthorized = false;
      } else {
        userInfo = body['content'];
        isAuthorized = true;
      }
    }
  }

  Future<bool> login(String username, String password) async {
    print("BoxPikService.login(): username: $username, password: $password...");
    lastError = "";
    await _queryServer(username, password);
    return isAuthorized;
  }

  // Logout
  Future<void> logout() async {
    lastError = "";
    userInfo = null;
    isAuthorized = false;
    return;
  }

  Widget getAvatar(String photo) {
    String url = BOXPIK_IMAGE_PATH + photo;
    // return CircleAvatar(
    //   foregroundImage : NetworkImage(url)
    // );
    return Image.network(
      url,
      height: 150,
      width: 150);
  }
  
}